import { Component, HostListener, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { VehiclesService } from 'src/app/modules/_services/vehicles.service';
import { Meta, Title } from '@angular/platform-browser';

@Component({
  selector: 'app-about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.scss'],
})
export class AboutComponent {
  constructor(private meta: Meta, private titleService: Title) {}
  ngOnInit(): void {
    this.titleService.setTitle(
      'About WEEV | Your EV Comparison & Booking Platform'
    );
    this.meta.updateTag({
      name: 'description',
      content:
        'Learn about WEEV, India’s leading electric vehicle platform that helps you compare electric bikes and scooters, view specs, explore features, and book online with ease.',
    });
    window.scrollTo(0, 0);
  }
}
