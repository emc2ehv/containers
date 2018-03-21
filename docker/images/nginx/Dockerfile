# Base
FROM alpine:3.5

# Install nginx
RUN apk add --update nginx

# Add user
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
