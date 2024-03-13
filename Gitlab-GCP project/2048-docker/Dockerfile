FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends nginx unzip curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

WORKDIR /var/www/html/

COPY ./docs .

EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]




