# ----------------------------
# build from source
# ----------------------------
# FROM node:18 AS build

# WORKDIR /app

# COPY package*.json .
# RUN npm install

# COPY . .
# RUN npm run build-prod

# ----------------------------
# run with nginx
# ----------------------------
FROM nginx:latest

RUN rm /etc/nginx/nginx.conf
# RUN rm /var/www/edmuhlestein.com/index.html
COPY nginx.conf /etc/nginx/nginx.conf
# COPY index.html /var/www/edmuhlestein.com/index.html
COPY dist/edmuhlestein.com/* /var/www/edmuhlestein.com/

CMD ["nginx", "-g", "daemon off;"]