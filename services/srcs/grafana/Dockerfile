FROM alpine:3.12

RUN apk update && apk upgrade
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.3.7.linux-amd64.tar.gz --strip-components 1
RUN apk add libc6-compat supervisor
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz && tar xf telegraf-1.17.2_linux_amd64.tar.gz

COPY ./srcs/grafana.db /data/grafana.db
COPY ./srcs/supervisor.conf /etc/supervisord.conf
COPY ./srcs/setup.sh /tmp/


COPY ./srcs/telegraf.conf .
RUN chmod +x /tmp/setup.sh

EXPOSE 3000
CMD sh /tmp/setup.sh