FROM nginx:alpine
LABEL org.opencontainers.image.source="https://github.com/example/nas-dashboard"
LABEL org.opencontainers.image.description="Simple landing page for Synology NAS services"

COPY public /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK CMD wget --quiet --spider http://localhost/ || exit 1
