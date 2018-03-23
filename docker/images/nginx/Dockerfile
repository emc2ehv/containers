# Base
FROM alpine:3.5

LABEL maintainer="emc2ehv"

# Install nginx
RUN apk add --update nginx

# Add user
RUN adduser -D -g 'www' www
RUN mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www

# Configure nginx
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY artifacts/nginx.conf /etc/nginx/
COPY artifacts/index.html /www/

# Start nginx
RUN rc-service nginx start
