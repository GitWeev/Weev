import { Component, OnInit , HostListener} from '@angular/core';
import { Meta, Title } from '@angular/platform-browser';


@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {
  isVisible: boolean = false; 
  constructor(private meta: Meta, private titleService: Title) { }

  ngOnInit(): void {
    this.titleService.setTitle(
      'WEEV | SIMPLIFYING ELECTRIC MOBILITY'
    );
    this.meta.updateTag({
      name: 'description',
      content:
        'Find your perfect electric scooter or bike on WEEV. Discover and compare prices, colors, specs of electric bike and scooter and upcoming new launches in 2025.',
    });
    window.scrollTo(0, 0); 
  }

  @HostListener('window:scroll', [])
  onWindowScroll(): void {
    this.isVisible = window.scrollY > 200;
  }

  scrollToTop(): void{
    window.scrollTo({top:0,behavior:'smooth'});
  }

}
