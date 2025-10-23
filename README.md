# NAS Dashboard

A lightweight static homepage for quickly launching the Plex, Transmission, Radarr, and Sonarr services hosted on your Synology NAS.

## Features
- Clean, mobile-friendly grid layout with service-specific icons
- Includes a quick link to the Synology DSM admin portal on port 5000
- Links automatically reuse the dashboard's hostname with the correct service port
- Simple Docker setup using `nginx:alpine` to serve the static site on port 80

## Usage

Build and start the dashboard with Docker Compose:

```bash
docker compose up --build -d
```

The site will be available at `http://<your-nas-hostname-or-ip>/`.

> **Synology port 80 note:** DSM reserves port 80 to redirect requests to the admin UI on port 5000/5001. If you need this dashboard to respond on port 80 you can (a) create a Control Panel → Login Portal → Reverse Proxy rule that forwards port 80 to this container running on another host port (for example map `8080:80` in `docker-compose.yml`), or (b) disable the HTTP-to-DSM redirect in Control Panel → Login Portal → Advanced (only recommended if you have another way to reach the DSM UI). Otherwise, adjust the published port in `docker-compose.yml` to avoid the conflict.

## Customising
- Update `public/index.html` to add, remove, or adjust service cards
- Edit `public/styles.css` to restyle the look and feel
- Rebuild the image after making changes: `docker compose build`
