import { Injectable } from '@angular/core';
import { Router, NavigationEnd, Event } from '@angular/router';
import { filter } from 'rxjs/operators';

declare let dataLayer: any[];

@Injectable({
  providedIn: 'root'
})
export class GtmService {
  constructor(private router: Router) {
    this.router.events
      .pipe(filter((event: Event): event is NavigationEnd => event instanceof NavigationEnd))
      .subscribe(event => {
        const pagePath = event.urlAfterRedirects;
        console.log(`[GTM] Tracking SPA page view: ${pagePath}`);
        dataLayer.push({
          event: 'pageview',
          page_path: pagePath
        });
      });
  }
}
