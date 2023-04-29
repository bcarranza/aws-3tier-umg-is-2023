#!/bin/bash

# Actualizar paquetes
apt update

# Instalar Node.js, npm y git
apt install -y nodejs npm git

# Instalar Nginx
apt install -y nginx

# Clonar el repositorio
git clone https://github.com/gothinkster/react-redux-realworld-example-app.git

# Navegar al directorio del proyecto
cd react-redux-realworld-example-app

# Instalar las dependencias del proyecto
npm install

# Construir la aplicación para producción
npm run build

# Crear un enlace simbólico de la carpeta build en la carpeta de Nginx
ln -s "$(pwd)/build" /var/www/html/react-app

# Modificar la configuración de Nginx
cat > /etc/nginx/sites-available/default <<EOL
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html/react-app;
    index index.html;

    server_name _;

    location / {
        try_files \$uri /index.html;
    }
}
EOL

# Reiniciar Nginx
systemctl restart nginx
