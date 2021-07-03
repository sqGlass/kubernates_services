FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh curl supervisor php7 php7-fpm
RUN apk add php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session libc6-compat
RUN curl -O https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz && tar xzvf phpMyAdmin-4.9.7-all-languages.tar.gz && rm phpMyAdmin-4.9.7-all-languages.tar.gz
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz && tar xf telegraf-1.17.2_linux_amd64.tar.gz

RUN rm -f phpMyAdmin-4.9.7-all-languages/config.inc.php
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisor.conf /etc/supervisord.conf
COPY ./srcs/config.inc.php /phpMyAdmin-4.9.7-all-languages

RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/domain.key -x509 -days 365 -out /etc/nginx/domain.crt -subj '/C=RU/ST=Kazan/L=Kazan/O=sch21/CN=sglass'


COPY ./srcs/setup.sh /tmp/
COPY ./srcs/telegraf.conf .
RUN chmod +x /tmp/setup.sh
RUN mkdir -p /run/nginx
EXPOSE 5000
CMD sh /tmp/setup.sh