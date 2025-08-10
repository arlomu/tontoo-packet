# Tontoo BlogSystem Package

A complete, ready-to-use blog system package for **Tontoo Code**. This package automatically creates a full-featured blog with admin panel, user authentication, and REST API - all with zero configuration required!

![Tontoo Blog](https://img.shields.io/badge/Tontoo-BlogSystem-blue?style=for-the-badge)
![Version](https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge)

## Features

- **Zero Configuration** - Automatically creates all files and folders
- **Responsive Design** - Built with TailwindCSS for mobile-first design
- **User Authentication** - Secure admin panel with login system
- **REST API** - Full CRUD operations for blog posts
- **Live Preview** - Instant blog updates without page refresh
- **Admin Dashboard** - Easy-to-use interface for managing posts
- **Mobile Friendly** - Works perfectly on all devices
- **XSS Protection** - Built-in HTML escaping for security

## Installation

2. **Install the BlogSystem package**
   ```bash
   tontoo install blogsystem
   ```

3. **Add to your project** - In your `Main.tont` file:
   ```tont
   load:
   {
     BlogSystem
   }
   ```

4. **Run your project**
   ```bash
   tontoo dev
   ```

## Quick Start

### Step 1: Create a New Tontoo Project
```bash
mkdir my-blog
cd my-blog
tontoo setup
```

### Step 2: Add BlogSystem to Main.tont
```tont
dat: Main
type: Main

load:
{
  BlogSystem
}
```

### Step 3: Start the Blog
```bash
tontoo dev
```

Your blog is now running at `http://localhost:3000`!

## Default Access

- **Blog Homepage**: `http://localhost:3000`
- **Admin Panel**: `http://localhost:3000/admin.html`
- **Default Login**: 
  - Username: `admin`
  - Password: `password`

## What Gets Created

The BlogSystem package automatically creates the following structure:

```
├── public/
│   ├── index.html          # Blog homepage
│   ├── admin.html          # Admin panel
│   ├── css/
│   │   └── blog.css        # Custom styling
│   └── js/
│       ├── blog.js         # Frontend JavaScript
│       └── admin.js        # Admin panel JavaScript
└── blog_posts.json         # Blog post database
```

## Configuration

### Customizing Port and Host

You can customize the blog settings by modifying the variables in `BlogSystem.tont`:

```tont
VB: BLOG_PORT: "8080"        # Change port
VB: BLOG_HOST: "0.0.0.0"     # Change host
VB: API_BASE: "/api/"        # Change API base path (can make errors in JS)
```

### Styling Customization

The blog uses TailwindCSS for styling. You can customize the appearance by:

1. Modifying `public/css/blog.css` for custom styles
2. Editing the HTML templates in the package
3. Adding your own color scheme and branding

## API Endpoints

The BlogSystem provides a complete REST API:

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/blog/posts/` | Get all blog posts | No |
| POST | `/api/blog/posts/` | Create new blog post | Yes |
| GET | `/api/blog/posts/{id}` | Get specific blog post | No |
| DELETE | `/api/blog/posts/{id}` | Delete blog post | Yes |

### API Usage Examples

**Get all posts:**
```javascript
fetch('/api/blog/posts/')
  .then(response => response.json())
  .then(posts => console.log(posts));
```

**Create a new post:**
```javascript
fetch('/api/blog/posts/', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    title: 'My New Post',
    content: 'This is the content...',
    author: 'John Doe'
  })
});
```

## Customization Guide

### Adding Custom Pages

To add new pages to your blog:

1. Create HTML files in the `public/` directory
2. Add navigation links in `index.html` and `admin.html`
3. Implement any required API endpoints

### Modifying the Design

The blog uses a modern, clean design that you can easily customize:

- **Colors**: Modify the TailwindCSS classes in the HTML files
- **Layout**: Adjust the container structures and grid layouts
- **Typography**: Change font sizes and weights using Tailwind classes
- **Components**: Add new UI components following the existing pattern

### Database Structure

Blog posts are stored in `blog_posts.json` with the following structure:

```json
{
  "id": 1,
  "title": "Post Title",
  "content": "Post content...",
  "author": "Author Name",
  "created_at": "2025-08-10T12:00:00Z"
}
```

## Security Features

- **XSS Protection**: All user input is escaped before display
- **Authentication**: Admin functions require login
- **Session Management**: Secure cookie-based sessions
- **Input Validation**: Client-side and server-side validation

## Troubleshooting

### Common Issues

**Port already in use:**
```bash
# Change the port in Blog.tont
VB: BLOG_PORT: "3001"
```

**Can't access admin panel:**
- Ensure you're using the correct login credentials
- Check that the web server is running
- Verify the admin.html file exists in public/

**Posts not saving:**
- Ensure you're logged in to the admin panel
- Check browser console for JavaScript errors
- Verify blog_posts.json is writable


## Acknowledgments

- Built with [Tontoo Code](https://arlocraftmc.de)
- Styled with [TailwindCSS](https://tailwindcss.com)
- Icons and inspiration from the open-source community
---
