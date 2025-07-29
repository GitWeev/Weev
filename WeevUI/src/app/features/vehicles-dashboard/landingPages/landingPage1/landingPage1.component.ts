import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/modules/auth/_services/auth.service';
import { DialogService } from 'src/app/modules/_services/dialog.service';
import { CustomerEnquiriesComponent } from 'src/app/component/customer-enquiries/customer-enquiries.component';
import { takeWhile } from 'rxjs';

@Component({
  selector: 'app-landingPage1',
  templateUrl: './landingPage1.component.html',
  styleUrls: ['./landingPage1.component.scss'],
})
export class LandingPage1Component {
  popup = false;

  constructor(
    private http: HttpClient,
    private router: Router,
    private authService: AuthService,
    private readonly dialogService: DialogService,
    private cd: ChangeDetectorRef
  ) {}

  ngOnInit(): void {}

  evList = [
    {
      name: 'Ola S1 Pro',
      brand: 'Ola',
      img: 'assets/images/landingPages/ola-s1-pro.png',
      badge: "Editor's Pick",
      badgeClass: 'badge-purple',
      range: '101 km',
      speed: '116 km/h',
      twId: 'Ola_S1 Pro_3 kWh',
    },
    {
      name: 'Ather 450X',
      brand: 'Ather',
      img: 'assets/images/landingPages/ather-450-x.png',
      badge: 'Best Range',
      badgeClass: 'badge-cyan',
      range: '130 km',
      speed: '80 km/h',
      twId: 'ather-450-x',
    },
    {
      name: 'TVS iQube',
      brand: 'TVS',
      img: 'assets/images/landingPages/tvs-iqube.png',
      badge: 'Best for City',
      badgeClass: 'badge-magenta',
      range: '100 km',
      speed: '78 km/h',
      twId: 'tvs-iqube',
    },
    {
      name: 'Ampere Magnus EX',
      brand: 'Ampere',
      img: 'assets/images/landingPages/ampere-magnus-ex.png',
      badge: 'Most Affordable',
      badgeClass: 'badge-lavender',
      range: '191 km',
      speed: '89 km/h',
      twId: 'ampere-magnus-ex',
    },
  ];

  public open(modal: any): void {
    const name = { type: 'Customeenquiry', value: 'vinay' };
    this.dialogService
      .openModal('Contact Us', name, CustomerEnquiriesComponent)
      .pipe(takeWhile(() => true))
      .subscribe((customeData: any) => {
        if (!!customeData) {
          // console.log(customeData);
          this.authService.Customerenquiries(customeData);

        }
      });
  }

  toComparePage() {
    this.router.navigate(['/Compare']);
  }

  toCompareSelectionPage(twId: string) {
  const name = { type: 'Customeenquiry', value: 'vinay' };
  this.dialogService
    .openModal('Contact Us', name, CustomerEnquiriesComponent)
    .pipe(takeWhile(() => true))
    .subscribe((customeData: any) => {
      if (!!customeData) {
        this.authService.Customerenquiries(customeData);
      }
      // Navigate after modal closes (regardless of user input)
      this.router.navigate(['/Compare', twId, 'NA', 'NA', 'NA']);
    });
}

}
