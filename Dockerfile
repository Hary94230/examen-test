# Utilise une image officielle de Node.js 18
FROM node:18-alpine

# Définit le répertoire de travail dans le conteneur
WORKDIR /app

# Copie les fichiers package.json et package-lock.json
COPY package*.json ./

# Installe les dépendances
RUN npm install

# Copie le reste des fichiers du projet
COPY . .

# Expose le port utilisé par l'application Node.js
EXPOSE 8080

# Commande pour démarrer l'application
CMD ["node", "server.js"]
 
