FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor  libc6-compat
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz && tar xf telegraf-1.17.2_linux_amd64.tar.gz
   

COPY ./srcs/sshd_config /etc/ssh
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisor.conf /etc/supervisord.conf

RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/domain.key -x509 -days 365 -out /etc/nginx/domain.crt -subj '/C=RU/ST=Kazan/L=Kazan/O=sch21/CN=sglass'
COPY ./srcs/telegraf.conf .
COPY ./srcs/setup.sh /tmp/
COPY ./srcs/index.html /tmp/

RUN echo root:ftps | chpasswd

RUN chmod +x /tmp/setup.sh
RUN mkdir -p /run/nginx
CMD sh /tmp/setup.sh
EXPOSE 80 443 22


