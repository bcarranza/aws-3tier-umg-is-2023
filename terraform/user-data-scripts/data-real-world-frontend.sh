#!/bin/bash

# Actualiza los paquetes del sistema
sudo apt-get update -y

# Instala Node.js y npm
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Instala Angular CLI globalmente
sudo npm install -g @angular/cli@15.2.7

# Instala Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo gpg --dearmor -o /usr/share/keyrings/yarn-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/yarn-archive-keyring.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# Clona el repositorio
git clone https://github.com/bcarranza/angular-realworld-example-app.git
cd angular-realworld-example-app

# Instala las dependencias del proyecto
yarn install

# Construye y sirve el proyecto en modo producción
ng build --prod
sudo npm install -g http-server
http-server dist/ -p 80