import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Meta, Title } from '@angular/platform-browser';
import { BlogService } from 'src/app/modules/_services/blog.service';


@Component({
  selector: 'app-blog-page',
  templateUrl: './blog-page.component.html',
  styleUrls: ['./blog-page.component.scss']
})

export class BlogPageComponent {
  blogs = [
    { 
      id: 1, 
      title: 'Driving Towards a Greener Future: Exploring the EV Market in India', 
      sectionTitle: 'Introduction to the EV Market',
      content: 'Electric vehicles have come a long way in recent years, with advancements in battery technology and charging infrastructure. Despite their growing popularity, there are still many misconceptions about EVs that need to be addressed. In this blog post, we will explore some of the most common myths and provide factual information to help you understand the benefits and limitations of electric vehicles.',
      heading:'Importance of Transitioning to EVs for a Sustainable Future',
      para:' Transitioning to electric vehicles is crucial for ensuring a sustainable and greener future. EVs produce zero tailpipe emissions, reducing air pollution and mitigating the adverse effects of climate change. By embracing EVs, we can significantly reduce our carbon footprint, improve air quality, and safeguard the environment for future generations.'  ,
      imageUrl: 'assets/images/blogs/blog-1/1.jpg'
    },
    { 
      id: 2, 
      title: 'A Beginners Guide to Owning an Electric Vehicle: What You Need to Know', 
      sectionTitle: 'Introduction',
      content: 'The electric vehicle revolution has been gaining momentum in recent years, with more and more people opting for these environmentally friendly alternatives to traditional vehicles. In this beginners guide, we will explore the reasons behind the growing popularity of electric vehicles and delve into the important factors one should consider when making the switch.',
      heading:'Environmental Benefits of Electric Vehicles',
      para:' One of the most significant advantages of electric vehicles is their positive impact on the environment. Unlike traditional vehicles that rely on fossil fuels, electric vehicles produce zero tailpipe emissions, helping to reduce air pollution and combat climate change. By choosing an electric vehicle, you can play a role in creating a cleaner and greener future for generations to come',
      imageUrl: 'assets/images/blogs/blog-2/2.jpg'


    },
    { 
      id: 3, 
      title: 'Debunking Myths About Electric Vehicles: Separating Fact from Fiction', 
      sectionTitle: 'Introduction to Electric Vehicles (EVs)',
      content: 'Electric vehicles have come a long way in recent years, with advancements in battery technology and charging infrastructure. Despite their growing popularity, there are still many misconceptions about EVs that need to be addressed. In this blog post, we will explore some of the most common myths and provide factual information to help you understand the benefits and limitations of electric vehicles.',
      heading:'Myth 1: EVs Have Limited RangeElectric Vehicle',
      para:' One of the most persistent myths about EVs is that they have limited range. While earlier models may have had shorter ranges, modern EVs are capable of traveling hundreds of miles on a single charge. With the rapid expansion of charging infrastructure, it`s becoming increasingly easy to find charging stations along popular routes. Additionally, many EV owners choose to charge their vehicles at home, ensuring they have a full charge for their daily commute..',
      imageUrl: 'assets/images/blogs/blog-3/4.jpg'
    },
    { 
      id: 4, 
      title: "Rural India's Quiet EV Revolution: How Electric Two-Wheelers Are Gaining Ground Beyond Cities", 
      sectionTitle: 'The Data Is In: EVs Are Going Rural',
      content: "Contrary to popular belief, the bulk of India's two-wheeler market is already rural. According to the Natural Resources Defense Council (NRDC), 55% of all two-wheeler sales in India originate from rural areas, with a growing share of that being electric. (NRDC Report, 2024) Meanwhile, Ather Energy, a major electric scooter manufacturer, revealed that over 54% of their scooter bookings come from Tier 2 and 3 cities. This shift shows the growing demand for modern, efficient vehicles even in smaller towns. (Entrepreneur India, 2024)",
      heading:'Why Rural India Is Choosing Electric Two-Wheelers',
      para:" 1. Fuel Savings = Daily Savings - Fuel prices hit rural consumers hard, especially those commuting 30–50 km a day. It's estimated that a rural household spends 20–40% of its monthly income on fuel and vehicle maintenance. (NRDC Report). Electric scooters offer a huge cost advantage: • Running cost: ₹0.25–0.50/km • Compared to petrol: ₹2.5–3/km. This means monthly savings of ₹2,000–3,000 for regular users—enough to cover essentials or even monthly EMIs.",
      imageUrl: 'assets/images/blogs/blog-4/1.jpg'
    },
    { 
      id: 5, 
      title: "Top 5 Electric Scooters in India for 2025: Performance, Price & Range Compared", 
      sectionTitle: 'The Top 5 Electric Scooters',
      content: "1. Ola S1X+ • Price: Approx. ₹1.10 lakh • Range: 108 km • Top Speed: 101 km/h • Charging Time (0-80%): 6 hours. Ola's S1X+ is a head-turner with sleek looks, voice-enabled features, and a powerful MoveOS platform.",
      heading:"Which One's Right for You?",
      para:"• Daily commuting : Ather Rizta or TVS iQube ST offer comfort and great range. • Tech enthusiasts : Go for Ola S1X+—it's got smart moves. • Retro lovers : Bajaj Chetak is elegant and timeless. • Budget buyers : Hero Vida V1 Plus offers solid value. EVs are more than a trend—they're becoming a lifestyle choice. Whichever scooter you pick, you'll be saving money, reducing emissions, and gliding through traffic like a boss.",
      imageUrl: 'assets/images/blogs/blog-5/1.jpg'
    },
   
  ];

  visibleBlogs = this.blogs.slice(0, 5); // Initially show the first 4 blogs.

  constructor(
    private router: Router,
    private meta: Meta, private titleService: Title,
    private blogService: BlogService
  ) { }

  ngOnInit(): void {
    this.titleService.setTitle('WEEV Blog | EV News, Comparisons, Buying Guides & More');
    this.meta.updateTag({
      name: 'description',
      content:
        'Explore the WEEV Blog for the latest updates on electric vehicles in India. Read expert comparisons, reviews, EV news, battery tips, charging guides, and feature breakdowns.',
    });
    window.scrollTo(0, 0);
  }

  onSelect(blog: any): void {
    const slug = this.blogService.generateSlug(blog.title);
    this.router.navigate(['/blog', slug]);
  }
}
  
