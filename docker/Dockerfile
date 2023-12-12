FROM nginx:latest

# Remove the default Nginx index.html
RUN rm -rf /usr/share/nginx/html/*

# Copy the custom index.html to Nginx web server directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
