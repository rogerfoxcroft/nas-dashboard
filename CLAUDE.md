# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A static single-page dashboard served via `nginx:alpine` in Docker. It renders a grid of clickable service cards, each linking to a service running on the same Synology NAS host. There is no build step, framework, or package manager — all code is plain HTML and CSS in `public/`.

## Running and deploying

Start (or rebuild) the container:
```bash
docker compose up --build -d
```

Quick rebuild and force-recreate (used for releases):
```bash
bash release.sh
```

The dashboard is served on `http://localhost:8080` (mapped from container port 80).

## How service links work

Links are constructed at runtime in a small inline `<script>` at the bottom of `public/index.html`. Each `.app-card` element carries `data-port` and optionally `data-path` attributes; the script reads `window.location.hostname` and builds the full URL, so the dashboard must be accessed from the same host as the services. Each card opens in its own named browser tab (derived from `data-name`).

## Adding a service card

1. Add an `<a class="app-card">` block in `public/index.html` with the appropriate `data-port`, `data-name`, and optionally `data-path`.
2. Add a matching `.app-icon.<classname>` CSS rule in `public/styles.css` for the icon background/colour.
3. Inline an SVG icon inside the `.app-icon` div — keep it within the existing 100×100 viewBox convention.
4. Rebuild the container with `bash release.sh`.

## services.yaml

`services.yaml` is a [Homepage](https://gethomepage.dev/) service definition file kept alongside this project for reference. It is **not used by the dashboard itself** — it targets a separate Homepage container with its own widget/API-key integration. The dashboard in `public/` and this YAML are independent.
