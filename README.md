# 🚀 Dockerized Static Website

A simple static HTML website served using Docker and Nginx.

## Run it locally
```bash
docker build -t static-site .
docker run -d -p 8080:80 static-site
