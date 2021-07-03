FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add openssl openssh supervisor curl php-fpm openrc mysql mysql-client mariadb-openrc libc6-compat
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz && tar xf telegraf-1.17.2_linux_amd64.tar.gz


COPY ./srcs/supervisor.conf /etc/supervisord.conf



COPY ./srcs/setup.sh /tmp/
RUN rm -rf ./etc/my.cnf.d/mariadb-server.cnf
COPY ./srcs/mariadb-server.cnf /etc/my.cnf.d/

COPY ./srcs/sglass_site.sql ./

COPY ./srcs/telegraf.conf .
RUN chmod +x /tmp/setup.sh

CMD sh /tmp/setup.sh