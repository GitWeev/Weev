import { Component, OnInit, OnDestroy, HostListener } from '@angular/core';
import { Router } from '@angular/router';
import { BlogService } from 'src/app/modules/_services/blog.service';

@Component({
  selector: 'app-blogs',
  templateUrl: './blogs.component.html',
  styleUrls: ['./blogs.component.scss'],
})
export class BlogsComponent implements OnInit, OnDestroy {
  blogs: any[] = [];
  currentSlide = 0;
  autoSlideInterval: any;
  cardsPerView = 3;
  isTransitioning = false;

  // Touch gesture properties
  touchStartX = 0;
  touchStartY = 0;
  touchEndX = 0;
  touchEndY = 0;
  isDragging = false;
  dragThreshold = 50;
  isSwipeHintVisible = true;
  swipeHintTimeout: any;

  constructor(private router: Router, private blogService: BlogService) {}

  ngOnInit(): void {
    this.blogs = this.blogService.getAllBlogs();
    this.updateCardsPerView();
    this.startAutoSlide();
    this.hideSwipeHintAfterDelay();
  }

  ngOnDestroy(): void {
    if (this.autoSlideInterval) {
      clearInterval(this.autoSlideInterval);
    }
    if (this.swipeHintTimeout) {
      clearTimeout(this.swipeHintTimeout);
    }
  }

  @HostListener('window:resize', ['$event'])
  onResize(event: any) {
    this.updateCardsPerView();
  }

  @HostListener('window:keydown', ['$event'])
  onKeyDown(event: KeyboardEvent) {
    if (event.key === 'ArrowLeft') {
      event.preventDefault();
      this.prevSlide();
    } else if (event.key === 'ArrowRight') {
      event.preventDefault();
      this.nextSlide();
    }
  }

  updateCardsPerView() {
    const width = window.innerWidth;
    if (width < 768) {
      this.cardsPerView = 1;
    } else if (width < 1024) {
      this.cardsPerView = 2;
    } else {
      this.cardsPerView = 3;
    }
  }

  getMaxSlides(): number {
    return Math.max(0, this.blogs.length - this.cardsPerView);
  }

  startAutoSlide() {
    this.autoSlideInterval = setInterval(() => {
      this.nextSlide();
    }, 4000);
  }

  stopAutoSlide() {
    if (this.autoSlideInterval) {
      clearInterval(this.autoSlideInterval);
    }
  }

  nextSlide() {
    if (this.isTransitioning) return;

    this.isTransitioning = true;
    const maxSlides = this.getMaxSlides();

    if (this.currentSlide >= maxSlides) {
      this.currentSlide = 0;
    } else {
      this.currentSlide++;
    }

    setTimeout(() => {
      this.isTransitioning = false;
    }, 600);
  }

  prevSlide() {
    if (this.isTransitioning) return;

    this.isTransitioning = true;
    const maxSlides = this.getMaxSlides();

    if (this.currentSlide <= 0) {
      this.currentSlide = maxSlides;
    } else {
      this.currentSlide--;
    }

    setTimeout(() => {
      this.isTransitioning = false;
    }, 600);
  }

  getTransformStyle(): string {
    const translateX = -(this.currentSlide * (100 / this.cardsPerView));
    return `translateX(${translateX}%)`;
  }

  getCurrentVisibleBlogs(): any[] {
    return this.blogs.slice(
      this.currentSlide,
      this.currentSlide + this.cardsPerView
    );
  }

  onMouseEnter() {
    this.stopAutoSlide();
  }

  onMouseLeave() {
    this.startAutoSlide();
  }

  trackByBlogId(index: number, blog: any): number {
    return blog.id;
  }

  // Touch Gesture Methods
  onTouchStart(event: TouchEvent) {
    this.touchStartX = event.touches[0].clientX;
    this.touchStartY = event.touches[0].clientY;
    this.isDragging = false;
    this.stopAutoSlide();
    this.hideSwipeHint();
  }

  onTouchMove(event: TouchEvent) {
    if (!this.touchStartX) return;

    this.touchEndX = event.touches[0].clientX;
    this.touchEndY = event.touches[0].clientY;

    const deltaX = Math.abs(this.touchEndX - this.touchStartX);
    const deltaY = Math.abs(this.touchEndY - this.touchStartY);

    // If horizontal swipe is more prominent than vertical, prevent default scrolling
    if (deltaX > deltaY && deltaX > 10) {
      event.preventDefault();
      this.isDragging = true;
    }
  }

  onTouchEnd(event: TouchEvent) {
    if (!this.touchStartX || !this.touchEndX) return;

    const deltaX = this.touchStartX - this.touchEndX;
    const deltaY = Math.abs(this.touchStartY - this.touchEndY);

    // Only trigger swipe if horizontal movement is greater than vertical (not scrolling)
    if (Math.abs(deltaX) > deltaY && Math.abs(deltaX) > this.dragThreshold) {
      if (deltaX > 0) {
        // Swiped left - go to next slide
        this.nextSlide();
      } else {
        // Swiped right - go to previous slide
        this.prevSlide();
      }
    }

    // Reset touch coordinates
    this.touchStartX = 0;
    this.touchStartY = 0;
    this.touchEndX = 0;
    this.touchEndY = 0;

    // Restart auto-slide after a delay
    setTimeout(() => {
      if (!this.isDragging) {
        this.startAutoSlide();
      }
      this.isDragging = false;
    }, 1000);
  }

  // Pan gesture support (for smoother touch interaction)
  onPan(event: any) {
    if (event.deltaX && Math.abs(event.deltaX) > 10) {
      this.isDragging = true;
      this.stopAutoSlide();
    }
  }

  onPanEnd(event: any) {
    if (Math.abs(event.deltaX) > this.dragThreshold) {
      if (event.deltaX < 0) {
        this.nextSlide();
      } else {
        this.prevSlide();
      }
    }

    setTimeout(() => {
      this.isDragging = false;
      this.startAutoSlide();
    }, 1000);
  }

  // Swipe hint methods
  hideSwipeHintAfterDelay() {
    this.swipeHintTimeout = setTimeout(() => {
      this.isSwipeHintVisible = false;
    }, 3000);
  }

  hideSwipeHint() {
    this.isSwipeHintVisible = false;
    if (this.swipeHintTimeout) {
      clearTimeout(this.swipeHintTimeout);
    }
  }

  // Check if device is mobile
  get isMobile(): boolean {
    return window.innerWidth < 768;
  }

  openBlog(blog: any) {
    if (!this.isDragging) {
      const slug = this.blogService.generateSlug(blog.title);
      this.router.navigate(['/blog', slug]);
    }
  }
}
