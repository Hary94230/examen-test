// Importation d'Express
const express = require('express');

// Création de l'application Express
const app = express();

// Port sur lequel le serveur écoute
const port = process.env.PORT || 8080;

// Route pour la page d'accueil
app.get('/', (req, res) => {
  res.send('Hello World!');
});

// Démarrage du serveur
app.listen(port, () => {
  console.log(`Le serveur est démarré sur http://localhost:${port}`);
});
