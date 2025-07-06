import {
  Component,
  OnInit,
  ChangeDetectorRef,
  HostListener,
} from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { VehiclesService } from 'src/app/modules/_services/vehicles.service';
import { Meta, Title } from '@angular/platform-browser';
import { Pipe, PipeTransform } from '@angular/core';

@Component({
  selector: 'app-bikes-details',
  templateUrl: './bikes-details.component.html',
  styleUrls: ['./bikes-details.component.scss'],
})
export class BikesDetailsComponent implements OnInit {
  title: string = '';

  allTwoWheelerList: Array<any> = new Array<any>();
  bikeList: Array<any> = new Array<any>();
  scooterList: Array<any> = new Array<any>();

  filteredtwowheelerlist: Array<any> = new Array<any>();

  loading: boolean = false;
  activeFilter: string = 'all'; // Track active filter

  itemsToShow: number = 50; // Number of items to show initially
  private loadingMore: boolean = false;

  constructor(
    private router: Router,
    public vehiclesService: VehiclesService,
    private cd: ChangeDetectorRef,
    private route: ActivatedRoute,
    private meta: Meta,
    private titleService: Title
  ) {
    // console.log(this.router.url);
    this.title = this.router.url.replace('/', '');
    // this.title.replace("/",'');
  }
  brand: string = '';
  ngOnInit(): void {
    this.route.params.subscribe((params: any) => {
      this.brand = params['Brand'];
    });

    this.getTwoWheelerData();
    this.cd.detectChanges();

    window.scrollTo(0, 0);
    // this.loadMoreItems();
  }

  loadMoreItems() {
    this.filteredtwowheelerlist = this.filteredtwowheelerlist.slice(
      0,
      this.itemsToShow
    );
  }

  updateSEOTags(originalTitle: string) {
    let title = '';
    let description = '';
  
    if (originalTitle === 'Bikes') {
      title = 'WEEV | Top Electric Two-Wheelers in India | Compare Price, Specs & Range';
      description = 'Browse all top electric bikes and scooters in India. Compare prices, range, battery capacity, top speed, features, and images of popular EVs. Book online easily.';
    } else if (originalTitle === 'Bikes/Type/Bikes') {
      title = 'WEEV | Electric Bikes in India | Compare Range, Price & Features';
      description = 'Explore the latest electric bikes in India. Check top speed, charging time, range, specs, features, and prices. Choose the best e-bike and book online.';
    } else if (originalTitle === 'Bikes/Type/Scooters') {
      title = 'WEEV | Electric Scooters in India | Range, Charging, Specs & Price';
      description = 'Compare all electric scooters available in India. View specifications, range, charging time, top speed, features, and prices of leading models. Book online now.';
    } else {
      title = `WEEV | ${this.brand} Electric Bikes & Scooters | Compare Price, Specs & Booking`;
      description = `Discover ${this.brand} electric bikes and scooters in India. View detailed specs, range, battery, top speed, and price. Find the best ${this.brand} EV model and book online.`;
    }
  
    this.titleService.setTitle(title);
    this.meta.updateTag({ name: 'description', content: description });
  }
  
  

  getTwoWheelerData() {
    this.vehiclesService.getTwoWheelerData().subscribe((response) => {
      this.allTwoWheelerList = response;

      let originalTitle = this.title;

      if (this.title == 'Bikes') {
        this.filterByType('all');
        this.title = 'All Vehicles';
      }
      if (this.title == 'Bikes/Type/Bikes') {
        this.filterByType('bike');
        this.title = 'Bikes';
      }
      if (this.title == 'Bikes/Type/Scooters') {
        this.filterByType('scooter');
        this.title = 'Scooters';
      }
      if (this.brand) {
        this.filterByType('Brand');
        this.title = this.brand;
      }
      this.updateSEOTags(originalTitle);
      // console.log(this.allTwoWheelerList);
    });

    // this.vehiclesService
    //   .getTwoWheelerDataByType('bike')
    //   .subscribe((response) => {
    //     this.bikeList = response;
    //     // console.log(this.bikeList);
    //   });

    // this.vehiclesService
    //   .getTwoWheelerDataByType('Scooter')
    //   .subscribe((response) => {
    //     this.scooterList = response;
    //     // console.log(this.scooterList);
    //   });
  }

  filterByType(type: string) {
    this.activeFilter = type;
    this.loading = true;
    setTimeout(() => {
      this.filteredtwowheelerlist = [];
      if (type === 'all') {
        for (var i = 0; i < this.allTwoWheelerList.length; i++) {
          if (this.allTwoWheelerList[i].variantType?.toLowerCase() === 'top') {
            this.filteredtwowheelerlist.push(this.allTwoWheelerList[i]);
          }
        }
      } else if (type === 'bike') {
        for (var i = 0; i < this.allTwoWheelerList.length; i++) {
          if (
            this.allTwoWheelerList[i].variantType?.toLowerCase() === 'top' &&
            this.allTwoWheelerList[i].vehicleType?.toLowerCase() === 'bike'
          ) {
            this.filteredtwowheelerlist.push(this.allTwoWheelerList[i]);
          }
        }
      } else if (type === 'scooter') {
        for (var i = 0; i < this.allTwoWheelerList.length; i++) {
          if (
            this.allTwoWheelerList[i].variantType?.toLowerCase() === 'top' &&
            this.allTwoWheelerList[i].vehicleType?.toLowerCase() === 'scooter'
          ) {
            this.filteredtwowheelerlist.push(this.allTwoWheelerList[i]);
          }
        }
      } else if (type === 'Brand') {
        for (var i = 0; i < this.allTwoWheelerList.length; i++) {
          if (this.allTwoWheelerList[i].manufacturer?.toLowerCase() === this.brand?.toLowerCase()) {
            this.filteredtwowheelerlist.push(this.allTwoWheelerList[i]);
          }
        }
      }
      console.log(this.allTwoWheelerList);
      console.log(this.filteredtwowheelerlist);
      for (var i = 0; i < this.filteredtwowheelerlist.length; i++) {
        this.filteredtwowheelerlist[i] = Object.assign(
          {},
          this.filteredtwowheelerlist[i],
          {
            selectedRating: this.filteredtwowheelerlist[i].ourRating,
            unSelectRating: 5 - this.filteredtwowheelerlist[i].ourRating,
          }
        );
      }
      this.loading = false;
      this.cd.detectChanges(); 
    }, 500);
  }

  exShowroomPrice(value:any):any{
    return this.isNA(value)?'NA' : `₹ ${value.toLocaleString('en-IN')}`
  }

  isNA(value: any): boolean {
    return value === null || value === undefined || value === '' || isNaN(value);
  }
    


  onSelect(twId: any) {
    // this.router.navigate(['/Selection', twId]);
    const twowheeler = this.allTwoWheelerList.find((i) => i.twId === twId);
    this.router.navigate([
      '/Selection',
      twowheeler.manufacturer +
        '_' +
        twowheeler.model +
        '_' +
        twowheeler.variant,
    ]);
  }
}


