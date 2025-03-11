import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class GoogleAnalyticsService {
  constructor() {
    this.loadGoogleAnalytics();
  }

  private loadGoogleAnalytics() {
    const script = document.createElement('script');
    script.async = true;
    script.src = 'https://www.googletagmanager.com/gtag/js?id=G-5WGG8XLBLT';
    document.head.appendChild(script);

    script.onload = () => {
      (window as any).dataLayer = (window as any).dataLayer || [];
      function gtag(...args: any[]) {
        (window as any).dataLayer.push(args);
      }
      gtag('js', new Date());
      gtag('config', 'G-5WGG8XLBLT');
    };
  }

  trackEvent(eventName: string, eventParams: any = {}) {
    (window as any).gtag('event', eventName, eventParams);
  }
}
