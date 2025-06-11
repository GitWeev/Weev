import { Component, OnInit, HostListener } from '@angular/core';
import { Router } from '@angular/router';
import { Meta, Title } from '@angular/platform-browser';

@Component({
  selector: 'app-vehicleComparison',
  templateUrl: './vehiclecomparison.component.html',
  styleUrls: ['./vehiclecomparison.component.scss'],
})
export class VehicleComparisonComponent implements OnInit {
  isDesktop = false;
  cards: any[] = []; // Holds card data
  showMessage = false; // To control the visibility of the message

  constructor(
    private router: Router,
    private meta: Meta,
    private titleService: Title
  ) {
    this.checkScreenWidth();
  }

  ngOnInit(): void {
    window.scroll(0, 0);
    // Initialize the cards array with empty objects
    this.cards = this.isDesktop ? [{}, {}, {}, {}] : [{}, {}];
    this.updateSEOTags();
  }

  @HostListener('window:resize', ['$event'])
  onResize(event: any) {
    this.checkScreenWidth();
  }

  updateSEOTags() {
    const selectedVehicles = this.cards
      .filter((card) => card.title)
      .map((card) =>
        [card.manufacturer, card.model, card.variant]
          .filter((item) => item && item !== 'NA')
          .join(' ')
      );
  
    if (selectedVehicles.length >= 2) {
      const formattedNames = this.formatVehicleList(selectedVehicles);
      const title = `Compare ${formattedNames} | EV Specs, Price, Battery & Range`;
      const description = `Detailed comparison between ${formattedNames}. Compare range, speed, battery, features, and price of top electric vehicles.`;
  
      this.titleService.setTitle(title);
      this.meta.updateTag({ name: 'description', content: description });
    } else {
      // Default fallback
      this.titleService.setTitle(
        'Compare Electric Bikes and Scooters | Specs, Price, Range & Features'
      );
      this.meta.updateTag({
        name: 'description',
        content:
          'Compare electric bikes and scooters side by side. Analyze specifications, prices, range, top speed, battery capacity, and features to find the best EV for you.',
      });
    }
  }

   formatVehicleList(list: string[]): string {
    if (list.length <= 1) return list.join('');
    if (list.length === 2) return list.join(' and ');
    return list.slice(0, -1).join(', ') + ', and ' + list[list.length - 1];
  }
  
  

  checkScreenWidth() {
    this.isDesktop = window.innerWidth > 768;
    // Update the cards array based on screen size
    this.cards = this.isDesktop ? [{}, {}, {}, {}] : [{}, {}];
  }

  compareVehicles(): void {
    const selectedCards = this.cards.filter((card) => card.title);
    if (selectedCards.length < 2) {
      this.showMessage = true;
      return;
    }

    // Ensure we always have exactly 4 values
    const twIds = Array(4)
      .fill('NA')
      .map((_, i) => {
        if (
          i < this.cards.length &&
          this.cards[i].manufacturer &&
          this.cards[i].model
        ) {
          return `${this.cards[i].manufacturer}_${this.cards[i].model}_${
            this.cards[i].variant || ''
          }`;
        }
        return 'NA';
      });

    this.router.navigate(['/Compare', ...twIds]);
  }

  // Method to handle vehicle selection from CompareEmptyCard
  onVehicleSelected(vehicle: any, index: number) {
    this.cards[index] = {
      title: [vehicle.manufacturer, vehicle.model, vehicle.variant]
        .filter((item) => item !== 'NA')
        .join(' '),
      manufacturer: vehicle.manufacturer,
      model: vehicle.model,
      variant: vehicle.variant,
      price: vehicle.price || 'Price not available',
      path: vehicle.path,
      variants: vehicle.variants || [],
    };
    this.updateSEOTags();
  }

  // Method to handle card removal
  onCardRemoved(cardData: any, index: number) {
    this.cards[index] = {}; // Reset the card to empty
    this.updateSEOTags();
  }
}
