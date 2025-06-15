# Use official lightweight Nginx image
FROM nginx:alpine

# Copy website contents into Nginx’s default folder
COPY website/ /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
