import {
  Component,
  CUSTOM_ELEMENTS_SCHEMA,
  ElementRef,
  HostListener,
  NgModule,
  OnInit,
  ViewChild,
} from '@angular/core';
import { Router } from '@angular/router';
import { VehiclesService } from 'src/app/modules/_services/vehicles.service';

interface Vehicle {
  title: string;
  manufacturer: string;
  model: string;
  variant: string;
  price: string;
  path: string;
  variants: string[];
  productName?: string;
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
}

interface ComparisonCard {
  vehicles: Vehicle[];
}

@Component({
  selector: 'app-CompareSuggestions',
  templateUrl: './CompareSuggestions.component.html',
  styleUrls: ['./CompareSuggestions.component.scss'],
})

export class CompareSuggestionsComponent {
  activeType: 'bike' | 'scooter' = 'bike';
  isComparePage: boolean = false; // Variable to hold the comparison page status
  allTwoWheelerList: Array<any> = new Array<any>();
  selectedVehicles: any[] = [null, null];
  canCompare: boolean = false;
  emptyCardVehicles: (SelectedVehicle | null)[] = [null, null];
  showEmptyCard: boolean = true;

  comparisonCards: {
    bike: ComparisonCard[];
    scooter: ComparisonCard[];
  } = {
    bike: [],
    scooter: [],
  };

  constructor(
    private router: Router,
    public vehiclesService: VehiclesService
  ) {}

  private comparisonProductNames = {
    bike: [
      ['Revolt_RV400_STD', 'Torq_Kratos_R'],
      ['Revolt_RV400_STD', 'Kabira Mobility_KM 4000_NA'],
      ['Revolt_RV400_STD', 'Kabira Mobility_KM 4000_NA'],
    ],
    scooter: [
      ['Ola_S1 Pro_NA', 'Bajaj_Chetak_Premium 2023']
    ]
  };

  ngOnInit(): void {
    this.isComparePage = this.router.url.includes('Compare');
    this.getTwoWheelerData();
  }

  @ViewChild('suggestcards', { static: false }) suggestcards!: ElementRef;
  showLeftArrow = false; 
  showRightArrow = false;

  ngAfterViewInit(): void {
    this.updateArrowVisibility();
    this.assignProductNames();
  }

  getTwoWheelerData() {
    this.vehiclesService.getTwoWheelerData().subscribe((response) => {
      this.allTwoWheelerList = response;
      this.initializeComparisonCards();
    });
  }

  private initializeComparisonCards() {
    this.comparisonCards = {
      bike: this.createComparisonCards('bike'),
      scooter: this.createComparisonCards('scooter')
    };
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
      path: data.path || data.path || 'assets/images/default-vehicle.jpg',
      variants: data.variants || [],
      productName: `${data.manufacturer}_${data.model}_${data.variant}`,
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
