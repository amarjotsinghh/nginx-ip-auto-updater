# nginx-ip-auto-updater

```markdown
# Nginx Dynamic IP Container

This repository contains a Dockerfile that builds an Ubuntu-based Docker image running Nginx. The Nginx web server is configured to display the container's IP address on the default Nginx landing page. This setup is useful for dynamically displaying the container's internal IP address and demonstrates how to automate web content updates using shell scripting within a Docker container.

---

## Table of Contents
- [Prerequisites](#prerequisites)
- [Dockerfile Explanation](#dockerfile-explanation)
- [Building the Docker Image](#building-the-docker-image)
- [Running the Container](#running-the-container)
- [Accessing the Web Page](#accessing-the-web-page)
- [Project Structure](#project-structure)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

---

## Prerequisites

Before you begin, make sure you have the following installed on your machine:
- [Docker](https://www.docker.com/) (version 19.03 or higher)

---

## Dockerfile Explanation

### Full Dockerfile Code

```Dockerfile
# Use the latest version of Ubuntu as the base image
FROM ubuntu:latest

# Add author/maintainer information
LABEL maintainer="Your Name <your-email@example.com>"

# Install Nginx web server
RUN apt-get update && apt-get install -y nginx

# Expose port 80 for HTTP traffic
EXPOSE 80

# Replace the content of /var/www/html/index.nginx-debian.html with the container's IP address
# and start the Nginx web server in the foreground
CMD bash -c "echo 'IP Address: ' $(hostname -i) > /var/www/html/index.nginx-debian.html && nginx -g 'daemon off;'"
```

### Explanation of Each Part

1. **Base Image**: 
   - `FROM ubuntu:latest`: Uses the latest version of Ubuntu as the base image for the container.
2. **Metadata**:
   - `LABEL maintainer="Your Name <your-email@example.com>"`: Provides metadata about the image maintainer.
3. **Installing Nginx**:
   - `RUN apt-get update && apt-get install -y nginx`: Updates the package list and installs Nginx.
4. **Exposing Port**:
   - `EXPOSE 80`: Documents that the container will listen on port 80 for HTTP traffic.
5. **CMD Instruction**:
   - `CMD bash -c "..."`: Runs a shell script to replace the default index page with the container's IP address and then starts Nginx in the foreground.

---

## Building the Docker Image

To build the Docker image from the Dockerfile, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/nginx-dynamic-ip-container.git
   cd nginx-dynamic-ip-container
   ```
   
2. **Build the Image**:
   ```bash
   docker build -t nginx-ip .
   ```
   - The `-t nginx-ip` flag tags the image with the name `nginx-ip`.

---

## Running the Container

To run the container using the image you just built:

```bash
docker run -d -p 80:80 nginx-ip
```

- `-d`: Runs the container in detached mode (in the background).
- `-p 80:80`: Maps port 80 on your host machine to port 80 on the container, making the Nginx web server accessible at `http://localhost`.

---

## Accessing the Web Page

1. Open your web browser and navigate to `http://localhost`.
2. You should see a simple web page displaying the container's IP address in the following format:
   ```
   IP Address: <container-ip-address>
   ```

---

## Project Structure

```
nginx-dynamic-ip-container/
│
├── Dockerfile
├── README.md
```

- **Dockerfile**: The Dockerfile used to build the Docker image.
- **README.md**: Detailed documentation for the project.

---

## Customization

You can customize this setup to fit your needs:
- **Custom Nginx Configuration**: Modify the Nginx configuration files if you want to customize how Nginx serves content.
- **Different Base Image**: If you prefer a different base image (e.g., `alpine` for a smaller footprint), you can update the `FROM` instruction.

---

## Troubleshooting

Here are some common issues you may encounter:

1. **Error: Port 80 is already in use**
   - **Solution**: Make sure no other service is running on port 80, or use a different port when running the container:
     ```bash
     docker run -d -p 8080:80 nginx-ip
     ```
     This maps port 80 on the container to port 8080 on your host machine.

2. **Cannot Access `http://localhost`**
   - **Solution**: Make sure the container is running by checking with:
     ```bash
     docker ps
     ```
   - If the container has stopped, inspect the logs for errors:
     ```bash
     docker logs <container-id>
     ```

---

## Contributing

If you would like to contribute to this project, please fork the repository and submit a pull request. Contributions are welcome!

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
```

### Notes:
- Replace `"Your Name <your-email@example.com>"` with your actual name and email.
- Update the repository URL in the `git clone` command once you've created the GitHub repository.
- Add a `LICENSE` file to your project if you want to specify a license for your code.

Let me know if you need any more details or have any questions!
