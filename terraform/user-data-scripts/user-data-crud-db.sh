#!/bin/bash
cd /home/ubuntu/
touch /home/ubuntu/myscript.sh
# Guardar texto en el archivo.
echo "\
apt-get update -y
apt-get upgrade -y

sudo apt install -y mysql-server

# Set MySQL to listen to all addresses
sudo sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL to apply the changes
sudo service mysql restart

sudo mysql -e "CREATE DATABASE employee_db;"
sudo mysql -e "USE employee_db; CREATE TABLE employees ( id INT NOT NULL AUTO_INCREMENT, name VARCHAR(150) NOT NULL, description VARCHAR(150) NOT NULL, age INT NOT NULL, PRIMARY KEY (id) );"
sudo mysql -e "CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypass'; CREATE USER 'myuser'@'%' IDENTIFIED BY 'mypass'; GRANT ALL ON *.* TO 'myuser'@'localhost'; GRANT ALL ON *.* TO 'myuser'@'%';
FLUSH PRIVILEGES;"

# Allow traffic on port 3306 through the firewall
sudo ufw allow 33060

# Restart MySQL to apply the changes
sudo service mysql restart

" > /home/ubuntu/myscript.sh

chmod u+x /home/ubuntu/myscript.sh

. /home/ubuntu/myscript.sh



