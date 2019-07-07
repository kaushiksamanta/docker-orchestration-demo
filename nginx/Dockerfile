FROM nginx:alpine

RUN apk add --update nodejs nodejs-npm \
    && npm install -g @angular/cli

WORKDIR /app

COPY microservice-one ./microservice-one
COPY microservice-two ./microservice-two

RUN rm -rf /usr/share/nginx/html/*

RUN cd microservice-one \
    && npm ci \
    && npm run build:docker \
    && cd ..

RUN cd microservice-two \
    && npm ci \
    && npm run build:docker \
    && cd ..

EXPOSE 80