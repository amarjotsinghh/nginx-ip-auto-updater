# Use the latest version of Ubuntu as the base image
# This is the starting point of the image, where we get a minimal version of Ubuntu
FROM ubuntu:latest

# Add metadata about the maintainer of the image
# The LABEL instruction adds metadata, such as the author's name and email
LABEL maintainer="Your Name <your-email@example.com>"

# Install Nginx web server
# RUN executes commands in a new layer on top of the current image and commits the results
# - 'apt-get update' updates the package index to get the latest versions of available packages
# - 'apt-get install -y nginx' installs Nginx and the '-y' flag automatically confirms the installation
RUN apt-get update && apt-get install -y nginx

# Expose port 80 for Nginx
# EXPOSE documents that the container listens on port 80 for HTTP traffic
# This does not publish the port; it only serves as a hint for the user and for documentation purposes
EXPOSE 80

# Replace the content of /var/www/html/index.nginx-debian.html with the container's IP address
# and then start the Nginx web server
# - 'bash -c' runs a shell script that contains the commands
# - 'echo "IP Address: " $(hostname -i)' generates a string containing the IP address
# - '> /var/www/html/index.nginx-debian.html' redirects the output to the index file, replacing its content
# - '&&' chains the commands, ensuring the second command only runs if the first succeeds
# - 'nginx -g "daemon off;"' starts Nginx in the foreground to keep the container running
CMD bash -c "echo 'IP Address: ' $(hostname -i) > /var/www/html/index.nginx-debian.html && nginx -g 'daemon off;'"
