import { Component, HostListener, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { VehiclesService } from 'src/app/modules/_services/vehicles.service';
import { Meta, Title } from '@angular/platform-browser';



@Component({
  selector: 'app-privacy-policy',
  templateUrl: './privacy-policy.component.html',
  styleUrls: ['./privacy-policy.component.scss']
})
export class PrivacyPolicyComponent {
  constructor(private meta: Meta, private titleService: Title) {}

  ngOnInit(): void {
    this.titleService.setTitle('WEEV | Privacy Policy | WEEV Electric Vehicle Platform');
    this.meta.updateTag({
      name: 'description',
      content:
        'Read the privacy policy of WEEV to understand how we collect, use, and protect your personal information while you explore electric vehicles, compare features, and book online.',
    });
    window.scrollTo(0, 0);
  }
}
