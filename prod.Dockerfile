# Stage 1
FROM node:alpine as microservice-one
RUN apk update && apk add --no-cache make git
WORKDIR /app
COPY microservice-one/package*.json  /app/
RUN npm install @angular/cli@6.0.8 -g \
    && npm ci
COPY microservice-one  /app
RUN ng build --prod

# Stage 2
FROM node:alpine as microservice-two
RUN apk update && apk add --no-cache make git
WORKDIR /app
COPY microservice-two/package*.json  /app/
RUN npm install @angular/cli@6.0.8 -g \
    && npm ci
COPY microservice-two  /app
RUN ng build --prod

# Stage 3
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=microservice-one /app/dist /usr/share/nginx/html
COPY --from=microservice-two /app/dist /usr/share/nginx/html
COPY nginx/etc/nginx.conf /etc/nginx/nginx.conf
COPY nginx/etc/conf.d/nginx.prod.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]