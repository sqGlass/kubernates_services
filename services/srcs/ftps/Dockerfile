FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor curl php-fpm openrc php7-fpm openrc
RUN apk add vsftpd libc6-compat
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz && tar xf telegraf-1.17.2_linux_amd64.tar.gz


COPY ./srcs/supervisor.conf /etc/supervisord.conf
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem  -subj '/C=RU/ST=Kazan/L=Kazan/O=sch21/CN=sglass'

COPY ./srcs/vsftpd.conf /etc
RUN adduser -D ftps
RUN echo ftps:ftps | chpasswd
RUN chmod 777 /home/ftps
COPY ./srcs/telegraf.conf .
COPY ./srcs/setup.sh /tmp/
RUN chmod +x /tmp/setup.sh
EXPOSE 21 21000
CMD sh /tmp/setup.sh