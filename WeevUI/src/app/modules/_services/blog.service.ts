import { Injectable } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class BlogService {
  private blogs = [
    {
        id: 5,
        title: 'Top 5 Electric Scooters in India for 2025: Performance, Price & Range Compared',
        author: 'Kunal',
        date: '14 JUN',
        category: 'EV Reviews',
        image: 'assets/images/blogs/blog-5/1.jpg',
        excerpt: `Electric scooters are no longer just the future in India—they're here and taking over our roads. Here's a roundup of the top 5 electric scooters in 2025...`
      },
      {
        id: 4,
        title: "Rural India's Quiet EV Revolution: How Electric Two-Wheelers Are Gaining Ground Beyond Cities",
        author: 'Mohit',
        date: '1 MAY',
        category: 'EV Trends',
        image: 'assets/images/blogs/blog-4/2.jpg',
        excerpt: `Rural India is increasingly saying goodbye to petrol and welcoming electric two-wheelers (E2Ws) as a smarter, cost-effective, and sustainable alternative...`
      },
      {
        id: 3,
        title: 'Debunking Myths About Electric Vehicles',
        author: 'Kunal',
        date: '26 MAR',
        category: 'EV Myths',
        image: 'assets/images/blogs/blog-3/4.jpg',
        excerpt: `Electric vehicles (EVs) are gaining popularity worldwide as a sustainable and efficient transportation option...`
      },
      {
        id: 2,
        title: "A Beginner's Guide to Owning an Electric Vehicle",
        author: 'Abhinav',
        date: '15 FEB',
        category: 'EV Guide',
        image: 'assets/images/blogs/blog-2/2.jpg',
        excerpt: `The electric vehicle revolution has been gaining momentum in recent years, with more and more people opting for these environmentally friendly...`
      },
      {
        id: 1,
        title: 'Driving Towards a Greener Future: Exploring the EV Market in India',
        author: 'Kunal',
        date: '05 JAN',
        category: 'Electric Vehicles',
        image: 'assets/images/blogs/blog-1/1.jpg',
        excerpt: `Electric vehicles, commonly referred to as EVs, are automobiles powered by electric motors instead of traditional internal combustion engines...`
      },
  ];

  getAllBlogs() {
    return this.blogs;
  }

  generateSlug(title: string): string {
    return title
      .toLowerCase()
      .replace(/[^a-z0-9\s]/g, '') // remove punctuation
      .split(/\s+/)
      .slice(0, 6)                 // keep first 6 words
      .join('-');
  }

  findBlogBySlug(slug: string) {
    return this.blogs.find(
      (blog) => this.generateSlug(blog.title) === slug
    );
  }
}
