FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor curl php-fpm openrc php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session libc6-compat
RUN curl -O https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz && rm latest.tar.gz
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz && tar xf telegraf-1.17.2_linux_amd64.tar.gz

COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisor.conf /etc/supervisord.conf
COPY ./srcs/wp-config.php /wordpress/

RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/domain.key -x509 -days 365 -out /etc/nginx/domain.crt -subj '/C=RU/ST=Kazan/L=Kazan/O=sch21/CN=sglass'


COPY ./srcs/setup.sh /tmp/
COPY ./srcs/telegraf.conf .
RUN chmod +x /tmp/setup.sh
RUN mkdir -p /run/nginx
EXPOSE 5050
CMD sh /tmp/setup.sh