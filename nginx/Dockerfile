FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*
COPY nginx/etc/nginx.conf /etc/nginx/nginx.conf
COPY nginx/etc/conf.d/nginx.dev.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]