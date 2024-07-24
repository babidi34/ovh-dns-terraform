# Gestion des Enregistrements DNS avec Terraform et OVH

## Requirements

1. **Terraform** - Pour installer Terraform, veuillez suivre les instructions officielles de la documentation : [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli).
2. **Clé API OVH** - Vous devez créer une clé API OVH en suivant ce lien : [Créer une clé API OVH](https://www.ovh.com/auth/api/createToken).

   **Autorisation des requêtes :**
    - Domain Zone: Full Right:
        - GET /domain/zone/*
        - POST /domain/zone/*
        - PUT /domain/zone/*
        - DELETE /domain/zone/*

## Configuration

### Étape 1 : Créer et configurer le fichier `.env`

Renommez le fichier `.env-example` en `.env` et modifiez-le avec vos propres valeurs :

```plaintext
export OVH_APPLICATION_KEY=XXX
export OVH_APPLICATION_SECRET=XXX
export OVH_CONSUMER_KEY=XXX
export OVH_ENDPOINT=XXX
```
### Étape 2 : Créer le fichier `dns_records.auto.tfvars`

Définissez les valeurs de vos enregistrements DNS par zone dans dns_records.auto.tfvars

### Étape 3 : Sourcing du fichier .env

Avant d'exécuter les commandes Terraform, assurez-vous de sourcer le fichier .env pour charger les variables d'environnement :

```
source .env
```

### Étape 4 : Utiliser Terraform

Pour visualiser les modifications qui seront apportées à votre infrastructure, exécutez :

```bash
terraform plan
```

Pour appliquer les modifications, exécutez :

```bash
terraform apply
```

## Script de Visualisation des Entrées DNS

Un script Python est fourni pour visualiser toutes les entrées DNS de votre domaine. Ce script utilise les mêmes variables d'environnement que Terraform. Assurez-vous de les sourcer avant d'exécuter le script.

```bash
python show_dns.py
```

## Résumé

- Terraform est utilisé pour gérer vos enregistrements DNS OVH.
- Créez et configurez le fichier .env avec vos clés API OVH.
- Définissez vos enregistrements DNS dans dns_records.auto.tfvars.
- Sourcez le fichier .env avant d'utiliser Terraform.
- Utilisez terraform plan pour visualiser les modifications et terraform apply pour les appliquer.
- Un script Python est fourni pour visualiser toutes les entrées DNS de votre domaine.

En suivant ces étapes, vous pourrez gérer efficacement vos enregistrements DNS OVH avec Terraform. Si vous avez des questions ou des ajustements supplémentaires, n'hésitez pas à demander !