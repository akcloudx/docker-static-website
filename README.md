
# 🚀 Dockerized Static Website with CI/CD using GitHub Actions

## 📘 Project Description

This project demonstrates how to containerize a simple static HTML website using **Docker** and **Nginx**, and automate the image build process using **GitHub Actions** for Continuous Integration (CI).

The goal is to give beginners hands-on experience with:
- Docker fundamentals
- Containerizing an application
- Writing a Dockerfile
- Running containers locally
- Automating builds with GitHub Actions
- Managing source code using Git and GitHub

> ⚙️ This project can run locally or on a virtual/cloud server.

---

## 🎯 Project Goals

| Goal | Description |
|------|-------------|
| ✅ Learn Docker | Understand how to build and run Docker images |
| ✅ Create Dockerfile | Containerize a basic HTML website |
| ✅ Serve via Nginx | Use a web server inside a container |
| ✅ Use GitHub Actions | Set up a CI pipeline to build images on each push |
| ✅ Host locally or remotely | Optionally serve the website from a local or cloud server |

---

## 🧰 Tools and Technologies Used

| Tool/Tech | Purpose |
|-----------|---------|
| 🐳 Docker | Containerization engine |
| 🖥️ Nginx | Web server to serve the static site |
| 👨‍💻 HTML/CSS | Static website content |
| 🔁 Git & GitHub | Source control and project collaboration |
| ⚙️ GitHub Actions | CI/CD automation |
| 🐧 Ubuntu (Local Server) | Optional, for hosting the site |

---

## 🛠️ Project Structure

```bash
docker-static-website/
├── website/
│   └── index.html       # Static website file
├── Dockerfile           # Instructions to build the container
├── README.md            # Project documentation
└── .github/
    └── workflows/
        └── docker-build.yml # CI pipeline
```

---

## 🏗️ How to Implement This Project (Step-by-Step)

### 1. **Set Up Project Locally**

```bash
mkdir docker-static-website
cd docker-static-website
mkdir website
```

Inside `website/index.html`, add a simple page:

```html
<!DOCTYPE html>
<html>
  <head><title>Hello from Docker</title></head>
  <body>
    <h1>Hello World 🌍</h1>
    <p>This is a static site served with Docker and Nginx.</p>
  </body>
</html>
```

---

### 2. **Create the Dockerfile**

```Dockerfile
# Use the official Nginx image
FROM nginx:alpine

# Copy website contents to Nginx’s public HTML folder
COPY website/ /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

---

### 3. **Build and Run Docker Image Locally**

```bash
docker build -t static-site .
docker run -d -p 8080:80 static-site
```

Visit: `http://localhost:8080`

---

### 4. **Initialize Git and Push to GitHub**

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin git@github.com:yourusername/docker-static-website.git
git push -u origin main
```

✅ You are now using **SSH authentication** with GitHub.

---

### 5. **Create GitHub Actions Workflow**

Path: `.github/workflows/docker-build.yml`

```yaml
name: 🚀 Build Docker Image on Push

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: 📥 Checkout code
        uses: actions/checkout@v3

      - name: 🐳 Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: 🛠️ Build Docker Image
        run: |
          docker build -t aakif/static-site:latest .
```

Push the changes:

```bash
git add .github
git commit -m "Add CI pipeline"
git push
```

Now visit the **Actions** tab on your GitHub repo and you’ll see the workflow triggered! 🎉

---

## 🌐 Optional: Hosting the Website on Your Server

If you have a local or cloud server:

```bash
docker run -d -p 80:80 static-site
```

Make sure your firewall allows port 80.

---

## ✅ Learning Outcomes

- ✔️ Understanding Docker and Dockerfiles
- ✔️ CI automation using GitHub Actions
- ✔️ GitHub SSH authentication setup
- ✔️ Building production-ready containers
- ✔️ Real-world DevOps workflow experience
