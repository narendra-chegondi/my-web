# ---------- Stage 1: Build/Prepare (optional but clean) ----------
FROM nginx:alpine

# Metadata
LABEL maintainer="narendra"
LABEL description="FoodExpress static web app served via nginx"

# Remove default nginx welcome page and assets
RUN rm -rf /usr/share/nginx/html/*

# Copy your site into nginx web root
# Make sure your main file is named index.html
COPY . /usr/share/nginx/html/

# Optional: custom nginx config for SPA-friendly routing & caching
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose HTTP port
EXPOSE 80

# Healthcheck (good practice)
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost/ || exit 1

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
