
rc default
ssh-keygen -A



/etc/init.d/mariadb setup
/etc/init.d/mariadb start

echo "create database sglass_site;" | mysql -uroot --skip-password
echo "create user sglass;" | mysql -uroot --skip-password
echo "grant all on sglass_site.* to 'sglass'@'%' identified by 'password';" | mysql -uroot --skip-password
echo "flush privileges;" | mysql -uroot --skip-password
mysql -uroot sglass_site < ./sglass_site.sql


 /etc/init.d/mariadb stop
 /usr/bin/supervisord -c /etc/supervisord.conf