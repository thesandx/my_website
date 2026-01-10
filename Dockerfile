# Use the lightweight Alpine Linux version of Nginx
FROM nginx:alpine

# Copy your static files (HTML, CSS, JS) to the Nginx web root
COPY . /usr/share/nginx/html

# Replace the default Nginx configuration with a template that 
# supports the $PORT environment variable used by Cloud Run.
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Cloud Run defaults to port 8080, so we tell Docker this port is important
EXPOSE 8080

# Start Nginx in the foreground.
# The official Nginx image will automatically process templates in 
# /etc/nginx/templates/*.template and output to /etc/nginx/conf.d/*.conf
# by replacing environment variables at startup.
CMD ["nginx", "-g", "daemon off;"]
