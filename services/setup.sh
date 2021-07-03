minikube start --vm-driver=virtualbox --memory 4096
minikube addons enable metallb
kubectl apply -f srcs/configmap.yaml
eval $(minikube docker-env)
docker build -t mysql_image srcs/mySql/
kubectl apply -f srcs/mySql/mysqlpv.yaml
kubectl apply -f srcs/mySql/mysql.yaml
docker build -t wordpress_image srcs/wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml
docker build -t phpmyadmin_image srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
docker build -t nginx_image srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml
docker build -t influxdb_image srcs/influxdb
kubectl apply -f srcs/influxdb/influxdbpv.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
docker build -t grafana_image srcs/grafana
kubectl apply -f srcs/grafana/grafana.yaml
docker build -t ftps_image srcs/ftps
kubectl apply -f srcs/ftps/ftps.yaml

kubectl get svc