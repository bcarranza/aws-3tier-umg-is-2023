#!/bin/bash
cd /home/ubuntu/
touch /home/ubuntu/myscript.sh
# Guardar texto en el archivo.
echo "\
apt-get update -y
apt-get upgrade -y
apt-get install jq -y 

# Clona el repositorio
git clone https://github.com/bcarranza/webappdemo.git
cd webappdemo/backend

curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
bash /tmp/nodesource_setup.sh
apt install nodejs

echo "DB_USER=myuser" >> .env
echo "DB_HOST='${db_host}'" >> .env
echo "DB_PASSWORD=mypass" >> .env
echo "DB_NAME=employee_db" >> .env
echo "DB_PORT=33060" >> .env

# Servir el back
npm install
npm install pm2 -g
pm2 start index.js
" > /home/ubuntu/myscript.sh

chmod u+x /home/ubuntu/myscript.sh

. /home/ubuntu/myscript.sh





