1. Architecture de la chaîne CI/CD 

Le pipeline est divisé en trois phases principales déclenchées automatiquement lors d'un push ou d'une pull_request sur les branches main et develop:
Phase A : Intégration Continue (CI) 
Checkout : Récupération du code source depuis GitHub.
Setup : Installation de Node.js version 18.
Installation : Installation des dépendances via npm install.
Qualité & Tests : Exécution du lint (vérification du code) et des tests unitaires via npm test.

Phase B : Conteneurisation et Sécurité 
Docker Build : Construction de l'image Docker basée sur Node.js 18
Security Scan (Trivy) : Analyse de l'image pour détecter les vulnérabilités de niveaux HIGH et CRITICAL.
Docker Push : Publication de l'image validée sur le registre Docker Hub.

Phase C : Infrastructure as Code (IaC) 
Terraform : Provisionnement d'une instance EC2 sur AWS.
OS : Ubuntu.
Type : t2.micro ou t3.micro.
Sécurité : Security Group autorisant le SSH (22) et le port applicatif (8080).
2. Déploiement et Accès 
Une fois l'infrastructure prête, l'application est déployée manuellement (ou via script) sur l'instance EC2 :
Connexion SSH à l'instance.
Mise à jour du système et installation de Docker.
Récupération de l'image depuis Docker Hub via docker pull.
Lancement du conteneur avec mappage du port 8080.


Résultat attendu : L'API répond "Hello World" sur http://<IP_PUBLIQUE_EC2>:8080.

3. Haute Disponibilité et Scalabilité 

Pour garantir la haute disponibilité, une solution AWS basée sur un Auto Scaling Group (ASG) et un Application Load Balancer (ALB) est recommandée.
