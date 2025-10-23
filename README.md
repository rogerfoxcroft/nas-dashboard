# NAS Dashboard

A lightweight static homepage for quickly launching the Plex, Transmission, Radarr, and Sonarr services hosted on your Synology NAS.

## Features
- Clean, mobile-friendly grid layout with service-specific icons
- Links automatically reuse the dashboard's hostname with the correct service port
- Simple Docker setup using `nginx:alpine` to serve the static site on port 80

## Usage

Build and start the dashboard with Docker Compose:

```bash
docker compose up --build -d
```

The site will be available at `http://<your-nas-hostname-or-ip>/`.

## Customising
- Update `public/index.html` to add, remove, or adjust service cards
- Edit `public/styles.css` to restyle the look and feel
- Rebuild the image after making changes: `docker compose build`
