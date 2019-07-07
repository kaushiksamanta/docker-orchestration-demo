FROM node:alpine as microservice-one

RUN apk update && apk add --no-cache make git

WORKDIR /app

COPY microservice-one/package*.json  /app/

RUN npm install @angular/cli@6.0.8 -g \
    && npm ci

COPY microservice-one  /app

EXPOSE 4200