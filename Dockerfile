# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update packages and install Apache web server
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy a custom HTML file into Apache's default directory
COPY index.html /var/www/html/index.html

# Expose port 80 so the container can serve web traffic
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
