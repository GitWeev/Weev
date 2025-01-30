import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/modules/auth/_services/auth.service';
import { DialogService } from 'src/app/modules/_services/dialog.service';
import { CustomerEnquiriesComponent } from 'src/app/component/customer-enquiries/customer-enquiries.component';
import { takeWhile } from 'rxjs';
import { Router } from '@angular/router';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent implements OnInit {
  popup = false;
  currentDateYear: Date = new Date();
  
  constructor(private router: Router,private authService: AuthService,
    private readonly dialogService: DialogService,) {     
  }

  ngOnInit(): void {
  }
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
  
  privacypolicy(){
    this.router.navigate(['PrivacyPolicy']);
  }

}


