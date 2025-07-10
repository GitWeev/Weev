import {
  Component,
  CUSTOM_ELEMENTS_SCHEMA,
  ElementRef,
  HostListener,
  NgModule,
  OnInit,
  ViewChild,
} from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { VehiclesService } from 'src/app/modules/_services/vehicles.service';

interface Vehicle {
  title: string;
  manufacturer: string;
  model: string;
  variant: string;
  price: string;
  exShowroomPrice?: number;
  path: string;
  variants: string[];
  productName?: string;
  variantType?:string
}
interface SelectedVehicle {
  title: string;
  manufacturer: string;
  model: string;
  variant: string;
  price: string;
  path: string;
  variants: string[];
  productName?: string;
  variantType?:string
}

interface ComparisonCard {
  vehicles: Vehicle[];
}

@Component({
  selector: 'category-compareSuggestions',
  templateUrl: './CategoryCompareSuggestions.component.html',
  styleUrls: ['./CategoryCompareSuggestions.component.scss'],
})

export class CategoryCompareSuggestions implements OnInit {
  activeType: 'bike' | 'scooter' = 'bike';
  isComparePage: boolean = false;
  allTwoWheelerList: Array<any> = new Array<any>();
  selectedVehicles: any[] = [null, null];
  canCompare: boolean = false;
  emptyCardVehicles: (SelectedVehicle | null)[] = [null, null];
  showEmptyCard: boolean = true;
  currentProductName: string = '';

  comparisonCards: {
    bike: ComparisonCard[];
    scooter: ComparisonCard[];
  } = {
    bike: [],
    scooter: [],
  };

  // Initialize comparisonProductNames as empty
  private comparisonProductNames = {
    bike: [] as string[][],
    scooter: [] as string[][]
  };

  private defaultComparisonList = {
    bike: [
      ['Ultraviolette_F77 Mach 2_Standard', 'Ola_Roadster Pro_16 kWh'],
      ['Ultraviolette_F77 Mach 2_Standard', 'Matter_Aera_5000+'],
      ['Ola_Roadster Pro_16 kWh', 'Matter_Aera_5000+'],
    ],
    scooter: [
      ['Ather_450X_STD', 'Ola_S1 Pro_STD'],
      ['TVS_iQube_S', 'Bajaj_Chetak_Premium 2023'],
      ['Ather_Rizta_S', 'Simple_One_STD'],
    ]
  };

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    public vehiclesService: VehiclesService
  ) {}

  ngOnInit(): void {
    this.isComparePage = this.router.url.includes('Compare');

    this.route.params.subscribe((params) => {
      this.currentProductName = params['twId'];
      this.getTwoWheelerData();
    });  
  }

  @ViewChild('suggestcards', { static: false }) suggestcards!: ElementRef;
  showLeftArrow = false; 
  showRightArrow = false;

  ngAfterViewInit(): void {
    this.updateArrowVisibility();
  }

  getTwoWheelerData() {
    this.vehiclesService.getTwoWheelerData().subscribe((response) => {
      this.allTwoWheelerList = response;
      
      // Find and set the current vehicle to the first empty card slot
      if (this.currentProductName) {
        const currentVehicle = this.findVehicleByProductName(this.currentProductName);
        if (currentVehicle) {
          this.emptyCardVehicles[0] = currentVehicle;
          this.updateCanCompare();
        }
      }
      
      this.generatePriceSimilarVehicleSuggestions();
      this.initializeComparisonCards();
    });
  }

  private generatePriceSimilarVehicleSuggestions() {
    const currentVehicle = this.findVehicleByProductName(this.currentProductName);
    
    if (!currentVehicle || !currentVehicle.exShowroomPrice) {
      return;
    }
  
    const currentPrice = currentVehicle.exShowroomPrice;
    const currentVariantType = currentVehicle.variantType;
    const currentManufacturer = currentVehicle.manufacturer;
    let priceRange = 50000; 
    let minPrice = currentPrice - priceRange;
    let maxPrice = currentPrice + priceRange;
    let expandedPriceRange = 50000;
    const maxRange = 500000;
  
    let bikes: any[] = [];
    let scooters: any[] = [];

    const sortedVehicles = [...this.allTwoWheelerList].sort((a, b) => {
      const priceA = parseFloat(a.exShowroomPrice) || 0;
      const priceB = parseFloat(b.exShowroomPrice) || 0;
      return Math.abs(priceA - currentPrice) - Math.abs(priceB - currentPrice);
    });
    
      while (expandedPriceRange <= maxRange) {
      bikes = [];
      scooters = [];
  
      sortedVehicles.forEach(vehicle => {
        if (this.getProductName(vehicle) === this.currentProductName) {
          return;
        }
  
        const vehiclePrice = parseFloat(vehicle.exShowroomPrice) || 0;
  
        if (vehiclePrice >= minPrice && vehiclePrice <= maxPrice) {
          if (vehicle.vehicleType === 'Bike' && vehicle.manufacturer !== currentManufacturer) {
            bikes.push(vehicle);
          } else if (vehicle.vehicleType === 'Scooter' && vehicle.manufacturer !== currentManufacturer) {
            scooters.push(vehicle);
          }
        }
      });
  
      const hasBikeMatches = bikes.length > 0;
      const hasScooterMatches = scooters.length > 0;
  
      if (hasBikeMatches || hasScooterMatches) {
        break;
      }
  
      expandedPriceRange += 100000;
      minPrice = currentPrice - expandedPriceRange;
      maxPrice = currentPrice + expandedPriceRange;
    }
  
    if (bikes.length === 0 && scooters.length === 0) {
      this.useDefaultComparisonList();
      return;
    }
  
    this.comparisonProductNames = {
      bike: bikes.slice(0, 4).map(bike => [
        this.currentProductName,
        this.getProductName(bike)
      ]),
      scooter: scooters.slice(0, 4).map(scooter => [
        this.currentProductName,
        this.getProductName(scooter)
      ])
    };
  }
  
   private useDefaultComparisonList() {
    this.comparisonProductNames = {
      bike: [...this.defaultComparisonList.bike],
      scooter: [...this.defaultComparisonList.scooter]
    };
  }
  
  // Helper function to get product name from vehicle data
  private getProductName(vehicle: any): string {
    return `${vehicle.manufacturer}_${vehicle.model}_${vehicle.variant}`;
  }

  private initializeComparisonCards() {
    this.comparisonCards = {
      bike: this.createComparisonCards('bike'),
      scooter: this.createComparisonCards('scooter')
    };
    this.assignProductNames();
  }

  private createComparisonCards(type: 'bike' | 'scooter'): ComparisonCard[] {
    return this.comparisonProductNames[type].map(pair => {
      return {
        vehicles: pair.map(productName => {
          const vehicle = this.findVehicleByProductName(productName);
          return vehicle || this.createFallbackVehicle(productName);
        })
      };
    });
  }

  private findVehicleByProductName(productName: string): Vehicle | null {
    const twowheeler = this.allTwoWheelerList.find(
      i => `${i.manufacturer}_${i.model}_${i.variant}` === productName
    );
    
    return twowheeler ? this.createVehicleObject(twowheeler) : null;
  }

  private createFallbackVehicle(productName: string): Vehicle {
    const [manufacturer, model, variant] = productName.split('_');
    return {
      title: [manufacturer, model, variant].filter(item => item !== 'NA').join(' '),
      manufacturer,
      model,
      variant,
      price: 'Price not available',
      path: 'assets/images/default-vehicle.jpg',
      variants: [],
      productName
    };
  }

  scroll(direction: 'left' | 'right'): void {
    const scrollContainer = this.suggestcards.nativeElement;

    // Calculate scroll amount dynamically
    const cardWidth =
      scrollContainer.querySelector('.comparison-card')?.offsetWidth || 0;
    const gap = parseFloat(getComputedStyle(scrollContainer).gap) || 0;
    const scrollAmount = cardWidth + gap;

    // Scroll in the specified direction
    const offset = direction === 'left' ? -scrollAmount : scrollAmount;

    // Update scroll position
    scrollContainer.scrollBy({ left: offset, behavior: 'smooth' });

    // Immediately update arrow visibility to prevent the delay
    this.updateArrowVisibility();

    // Recheck visibility after the scroll animation
    setTimeout(() => this.updateArrowVisibility(), 300);
  }

  updateArrowVisibility(): void {
    if (!this.suggestcards) return;
    
    const scrollContainer = this.suggestcards.nativeElement;

    const maxScrollLeft =
      scrollContainer.scrollWidth - scrollContainer.clientWidth;

    // Check for scrollable content
    const hasScrollableContent =
      scrollContainer.scrollWidth > scrollContainer.clientWidth;

    // Update visibility of arrows
    this.showLeftArrow = hasScrollableContent && scrollContainer.scrollLeft > 0;
    this.showRightArrow =
      hasScrollableContent && scrollContainer.scrollLeft < maxScrollLeft;
  }

  setActiveType(type: 'bike' | 'scooter') {
    this.activeType = type;
    setTimeout(() => this.updateArrowVisibility(), 0);
  }

  compareRedirect() {
    this.router.navigate(['/Compare']);
  }

  CompareThis(twId1: any, twId2: any) {
    this.router.navigate(['/Compare', twId1, twId2, 'NA', 'NA']);
  }

  goToVehicle(vehicle: Vehicle) {
    this.router.navigate([
      '/Selection',
      `${vehicle.manufacturer}_${vehicle.model}_${vehicle.variant}`,
    ]);
  }

  private createVehicleObject(data: any): Vehicle {
    return {
      title: `${data.manufacturer} ${data.model} ${data.variant}`,
      manufacturer: data.manufacturer,
      model: data.model,
      variant: data.variant,
      price: data.exShowroomPrice || data.price || 'Price not available',
      exShowroomPrice: parseFloat(data.exShowroomPrice) || 0,
      path: data.path || 'assets/images/default-vehicle.jpg',
      variants: data.variants || [],
      productName: `${data.manufacturer}_${data.model}_${data.variant}`,
      variantType:data.variantType
    };
  }

  onVehicleSelected(index: number, vehicleData: any) {
    this.emptyCardVehicles[index] = this.createVehicleObject(vehicleData);
    this.updateCanCompare();
  }

  assignProductNames(): void {
    (['bike', 'scooter'] as const).forEach((category: 'bike' | 'scooter') => {
      this.comparisonCards[category].forEach((group) => {
        group.vehicles.forEach((vehicle) => {
          vehicle.productName =
            vehicle.manufacturer + '_' + vehicle.model + '_' + vehicle.variant;
        });
      });
    });
  }

  removeVehicle(index: number) {
    this.emptyCardVehicles[index] = null;
    this.updateCanCompare();
  }

  updateCanCompare() {
    this.canCompare =
      !!this.emptyCardVehicles[0] && !!this.emptyCardVehicles[1];
  }

  compareSelectedVehicles() {
    if (!this.canCompare) return;

    const vehicle1 = this.emptyCardVehicles[0] as Vehicle;
    const vehicle2 = this.emptyCardVehicles[1] as Vehicle;

    this.router.navigate([
      '/Compare',
      vehicle1.productName ||
        `${vehicle1.manufacturer}_${vehicle1.model}_${vehicle1.variant}`,
      vehicle2.productName ||
        `${vehicle2.manufacturer}_${vehicle2.model}_${vehicle2.variant}`,
      'NA',
      'NA',
    ]);
  }
}