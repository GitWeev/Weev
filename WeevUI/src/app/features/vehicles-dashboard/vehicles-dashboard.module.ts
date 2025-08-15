import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { VehiclesDashboardComponent } from './vehicles-dashboard/vehicles-dashboard.component';
import { VehiclesRoutingModule } from './vehicles-routing.module';
import { DashboardComponent } from './dashboard/dashboard.component';
import { VehiclesCategoryComponent } from './vehicles-category/vehicles-category.component';
import { RecentVehiclesComponent } from './recent-vehicles/recent-vehicles.component';
import { SerachMeComponent } from './serach-me/serach-me.component';
import { BlogsComponent } from './blogs/blogs.component';
import { LoginComponent } from './login/login.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { AuthInterceptor } from 'src/app/modules/auth/_services/auth-interceptor';
import { AuthService } from 'src/app/modules/auth/_services/auth.service';
import { AuthGuardService } from 'src/app/modules/auth/_services/auth-guard.service';
import { BrandsComponent } from './brands/brands.component';
import { PrivacyPolicyComponent } from './privacy-policy/privacy-policy.component';
import { BikesDetailsComponent } from '../category-dashboard/bikes-details/bikes-details.component';
import {CompareSuggestionsComponent} from 'src/app/features/vehicle-comparison/CompareSuggestions/CompareSuggestions.component'
import {VehicleComparisonComponent} from 'src/app/features/vehicle-comparison/vehiclecomparison.component'
import {CompareMainComponent} from 'src/app/features/vehicle-comparison/CompareMainPage/CompareMainPage.component'
import {CompareEmptyCard} from 'src/app/features/vehicle-comparison/CompareEmptyCard/CompareEmptyCard.component'
import {CompareSelectedCard} from 'src/app/features/vehicle-comparison/CompareSelectedCard/CompareSelectedCard.component'
import { LandingPage1Component } from './landingPages/landingPage1/landingPage1.component';
import { LandingPage3Component } from './landingPages/landingPage3/landingPage3.component';

@NgModule({
  declarations: [
    VehiclesDashboardComponent,
    DashboardComponent,
    VehiclesCategoryComponent,
    RecentVehiclesComponent,
    SerachMeComponent,
    BlogsComponent,
    LoginComponent,
    BrandsComponent,
    PrivacyPolicyComponent,
    CompareSuggestionsComponent,
    VehicleComparisonComponent,
    CompareMainComponent,
    CompareEmptyCard,
    CompareSelectedCard,
    LandingPage1Component,
    LandingPage3Component    
  ],
  imports: [
    CommonModule,FormsModule, ReactiveFormsModule,
    VehiclesRoutingModule
  ],
  providers: [ 
    AuthService, AuthGuardService,  
    { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true },
  ],
})
export class VehiclesDashboardModule { }
