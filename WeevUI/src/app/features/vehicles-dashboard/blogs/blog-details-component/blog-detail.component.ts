import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { Meta, Title } from '@angular/platform-browser';

@Component({
  selector: 'app-blog-detail',
  templateUrl: './blog-detail.component.html',
  styleUrls: ['./blog-detail.component.scss'],
})
export class BlogDetailComponent implements OnInit {
  blog: any;

  constructor(
    private route: ActivatedRoute,
    private http: HttpClient,
    private cdr: ChangeDetectorRef,
    private meta: Meta,
    private titleService: Title
  ) {}

  ngOnInit(): void {
    this.route.paramMap.subscribe((params) => {
      const blogId = params.get('id');
      if (blogId) {
        this.loadBlog(blogId);
      }
    });
    window.scrollTo(0, 0);
  }

  updateSEOTags(): void {
    if (!this.blog) return;
  
    const blogTitle = this.blog.title || 'Electric Vehicle Blog';
    const rawText = this.blog.subtitle || this.blog.content || '';  //neeeeeed this from backend what to put
    const cleanText = rawText
      .replace(/[*_#>`]/g, '') // Remove markdown symbols
      .replace(/<\/?[^>]+(>|$)/g, '') // Strip HTML tags
      .split('\n')[0] // Take first line
      .trim()
      .slice(0, 155); // Limit length

    
  
    this.titleService.setTitle(`${blogTitle} | WEEV Blog`);
    this.meta.updateTag({
      name: 'description',
      content: cleanText || 'Read the latest on electric vehicles, trends, tips, and innovations from the WEEV blog.',
    });
  }
  

  loadBlog(id: string) {
    const path = `assets/blogs/blog-${id}.json`;
    this.http.get<any>(path).subscribe({
      next: (data) => {
        this.blog = data;
        this.updateSEOTags(); 
        this.cdr.detectChanges();
      },
      error: (err) => {
        console.error('Blog not found:', err);
      },
    });
  }

  get formattedContent(): string {
    return this.formatBlockContent(this.blog?.content || '');
  }
  formatBlockContent(content: string): string {
    if (!content) return '';

    // Step 1: Convert markdown-like formatting
    let formattedContent = content

      // Numbered bold headings with optional emoji (e.g., "**🚀 1. Title**")
      .replace(
        /\*\*(?:[^\w\d\s]?\s*)?(\d+\.\s[^*\n]+)\*\*/g,
        '<h4 class="subheading">$1</h4>'
      )

      // Bold labels with colons => subheadings
      .replace(/\*\*([^*\n]+):\*\*/g, '<h4 class="subheading">$1:</h4>')

      // Remaining bold text
      .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')

      // Bullet points to <li>
      .replace(/^• (.+)$/gm, '<li>$1</li>');

    // Step 2: Wrap <li> blocks in <ul>
    if (formattedContent.includes('<li>')) {
      formattedContent = formattedContent.replace(
        /(<li>.*?<\/li>)/gs,
        '<ul>$1</ul>'
      );
      formattedContent = formattedContent.replace(/<\/ul>\s*<ul>/g, '');
    }

    // Step 3: Enhanced markdown table conversion with mobile data attributes
    if (formattedContent.includes('|')) {
      const lines = formattedContent.split('\n');
      let inTable = false;
      let isHeaderParsed = false;
      let headers: string[] = [];

      const processedLines = lines.map((line) => {
        if (/^\|.+\|$/.test(line.trim())) {
          const cells = line
            .trim()
            .split('|')
            .slice(1, -1)
            .map((c) => c.trim());

          if (!inTable) {
            inTable = true;
            isHeaderParsed = true;
            headers = cells; // Store headers for mobile data attributes
            return (
              '<table class="comparison-table"><thead><tr>' +
              cells.map((cell) => `<th>${cell}</th>`).join('') +
              '</tr></thead><tbody>'
            );
          } else if (isHeaderParsed) {
            isHeaderParsed = false; // skip markdown divider like |----|
            return '';
          } else {
            // Add data attributes for mobile view
            const tdElements = cells
              .map((cell, index) => {
                if (index === 0) {
                  return `<td>${cell}</td>`;
                } else {
                  const label = headers[index] || '';
                  return `<td data-label="${label}" data-value="${cell}">${cell}</td>`;
                }
              })
              .join('');

            return '<tr>' + tdElements + '</tr>';
          }
        } else {
          if (inTable) {
            inTable = false;
            return '</tbody></table>\n' + line;
          }
          return line;
        }
      });

      if (inTable) processedLines.push('</tbody></table>');
      formattedContent = processedLines.join('\n');
    }

    // Step 4: Add <p> and <br>, but NOT inside tables
    formattedContent = formattedContent
      .split(/(<table[\s\S]*?<\/table>)/g)
      .map((chunk) => {
        if (chunk.startsWith('<table')) return chunk;
        return chunk.replace(/\n{2,}/g, '</p><p>').replace(/\n/g, '<br>');
      })
      .join('');

    // Step 5: Wrap unstructured content in <p> tag if needed
    if (!formattedContent.match(/^<(ul|table|p|h4)>/)) {
      formattedContent = '<p>' + formattedContent + '</p>';
    }

    return formattedContent;
  }
}
