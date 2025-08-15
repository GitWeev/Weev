import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/modules/auth/_services/auth.service';
import { DialogService } from 'src/app/modules/_services/dialog.service';
import { CustomerEnquiriesComponent } from 'src/app/component/customer-enquiries/customer-enquiries.component';
import { takeWhile } from 'rxjs';

@Component({
  selector: 'app-landingPage3',
  templateUrl: './landingPage3.component.html',
  styleUrls: ['./landingPage3.component.scss'],
})
export class LandingPage3Component {
  cities = ['Mumbai', 'Delhi', 'Bangalore', 'Hyderabad', 'Chennai', 'Pune'];


  /**
   * Object to hold the form data using two-way data binding with ngModel.
   */
  formData = {
    name: '',
    phone: '',
    budget: '',
    city: ''
  };

  constructor() { }

  /**
   * This method is called when the form is submitted.
   * It logs the form data to the console.
   * In a real application, you would send this data to a server.
   */
  onSubmit() {
    console.log('Form Submitted!');
    console.log('Name:', this.formData.name);
    console.log('Phone:', this.formData.phone);
    console.log('Budget:', this.formData.budget);
    console.log('City:', this.formData.city);
    // Here you would typically make an HTTP request to your backend API
    // to save the user's information.
  }

}
