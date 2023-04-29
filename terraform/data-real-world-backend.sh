#!/bin/bash

# Actualizar paquetes
apt update

# Instalar Node.js, npm y git
apt install -y nodejs npm git

# Clonar el repositorio
git clone https://github.com/gothinkster/node-express-realworld-example-app.git

# Navegar al directorio del proyecto
cd node-express-realworld-example-app

# Instalar las dependencias del proyecto
npm install

# Configurar variables de entorno para producción
export NODE_ENV=production

# Iniciar la aplicación en modo producción
nohup npm start &
