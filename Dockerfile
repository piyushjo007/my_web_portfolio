# Use official nginx image as base
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy portfolio website to nginx html directory
COPY ./docker/SRE/test_4.html /usr/share/nginx/html/index.html
COPY ./docker/SRE/skills.js /usr/share/nginx/html/skills.js

# Copy custom nginx config for SPA behavior
COPY ./docker/SRE/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]