FROM node:alpine as microservice-two

RUN apk update && apk add --no-cache make git

WORKDIR /app

COPY microservice-two/package*.json  /app/

RUN npm install @angular/cli@6.0.8 -g \
    && npm ci

COPY microservice-two  /app

EXPOSE 4201

CMD ng serve --port 4201 --host 0.0.0.0 --disable-host-check