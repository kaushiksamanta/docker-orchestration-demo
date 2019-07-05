FROM nginx:alpine

RUN apk add --update nodejs nodejs-npm \
    && npm install -g @angular/cli

WORKDIR /app

COPY microservice-one ./microservice-one
COPY microservice-two ./microservice-two

# RUN rm -rf /usr/share/nginx/html/*

COPY nginx/etc/nginx.conf /etc/nginx/nginx.conf
COPY nginx/etc/conf.d/nginx.dev.conf /etc/nginx/conf.d/default.conf

RUN cd microservice-one \
    && npm ci \
    && cd ..

RUN cd microservice-two \
    && npm ci \
    && cd ..

# RUN cd microservice-one/ \
#     && npm run build:docker \
#     & cd microservice-two/ \
#     && npm run build:docker

EXPOSE 80