import { Injectable } from '@angular/core';
import { Router, NavigationEnd, Event } from '@angular/router';
import { filter } from 'rxjs/operators';

declare let gtag: Function;

@Injectable({
  providedIn: 'root'
})
export class GoogleAnalyticsService {
  private measurementId = 'G-5WGG8XLBLT'; // Replace with your GA4 Measurement ID

  constructor(private router: Router) {
    this.trackPageViews();
  }

  private trackPageViews(): void {
    this.router.events
      .pipe(filter((event: Event): event is NavigationEnd => event instanceof NavigationEnd))
      .subscribe((event) => {
        const pagePath = event.urlAfterRedirects;
        console.log(`[GA] Tracking page view: ${pagePath}`);

        gtag('config', this.measurementId, {
          page_path: pagePath
        });
      });
  }

  public trackEvent(eventName: string, params: { [key: string]: any }): void {
    console.log(`[GA] Tracking event: ${eventName}`, params);
    gtag('event', eventName, params);
  }
}
