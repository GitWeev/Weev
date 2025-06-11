import { AuthService } from 'src/app/modules/auth/_services/auth.service';
import { Component, OnInit, HostListener, Renderer2, ElementRef, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { VehiclesService } from 'src/app/modules/_services/vehicles.service';

@Component({
  selector: 'app-mobile-header',
  templateUrl: './mobileHeader.component.html',
  styleUrls: ['./mobileHeader.component.scss'],
})
export class MobileHeaderComponent implements OnInit {
  token: any;
  isLogin: boolean = false;
  isSearchBoxActive: boolean = false;
  suggestionsVisible: boolean = false;
  suggestions: Array<any> = new Array<any>();
  filteredSuggestions: Array<any> = [];
  searchTerm: string = '';
  suggestionTitleVisible: boolean = true;
  
  // Featured/trending vehicle IDs
  specificTwIds: Array<any> = [34, 3, 8, 5, 21];

  constructor(
    private authService: AuthService,
    private router: Router,
    public vehiclesService: VehiclesService,
    private renderer: Renderer2,
    private elementRef: ElementRef
  ) {}

  ngOnInit(): void {
    this.getTwoWheelerData();
  }

  @HostListener('document:click', ['$event'])
  onClickOutside(event: MouseEvent) {
    const target = event.target as HTMLElement;
    const searchBox = document.querySelector('.search-box');

    if (searchBox && !searchBox.contains(target)) {
      this.suggestionsVisible = false;
      this.resetLayout();
    }
  }

  // Shows filtered suggestions based on search input
  showSuggestions() {
    if (this.searchTerm) {
      const searchWords = this.searchTerm.toLowerCase().split(/\s+/);
  
      this.filteredSuggestions = this.suggestions.filter(suggestion => 
        searchWords.every(word => 
          suggestion.manufacturer.toLowerCase().includes(word) ||
          suggestion.model.toLowerCase().includes(word) ||
          suggestion.variant.toLowerCase().includes(word)
        )
      );
  
      this.suggestionsVisible = this.filteredSuggestions.length > 0;
    } else {
      // Show trending/featured vehicles when search is empty
      this.filteredSuggestions = this.suggestions.filter(suggestion =>
        this.specificTwIds.includes(suggestion.twId)
      );
      
      this.filteredSuggestions.sort((a, b) => 
        this.specificTwIds.indexOf(a.twId) - this.specificTwIds.indexOf(b.twId)
      );
  
      this.suggestionsVisible = this.filteredSuggestions.length > 0;
    }
  
    this.suggestionTitleVisible = this.searchTerm.length === 0;
  }

  hideSuggestions() {
    this.suggestionsVisible = false;
  }

  search() {
    this.showSuggestions();
  }

  // Fetch vehicle data from service
  getTwoWheelerData() {
    this.vehiclesService.getTwoWheelerData().subscribe((response) => {
      this.suggestions = response.map((item: any) => item);
    });
  }

  // Handle suggestion selection
  selectSuggestion(twId: any) {
    this.onSelect(twId);
    this.searchTerm = ''; 
    this.hideSuggestions();
    this.resetLayout();
    this.isSearchBoxActive = false;
  }

  // Navigate to selected vehicle page
  onSelect(twId: any) {
    const twowheeler = this.suggestions.find(i => i.twId === twId);
    this.router.navigate(['/Selection', twowheeler.manufacturer+'_'+twowheeler.model+'_'+twowheeler.variant]);
  }

  // Reset to default layout
  resetLayout() {
    setTimeout(() => {
      this.isSearchBoxActive = false;
    }, 100);
  }

  // Expand search box when clicked
  onSearchBoxClick() {
    this.search();
    this.isSearchBoxActive = true;
  }
}