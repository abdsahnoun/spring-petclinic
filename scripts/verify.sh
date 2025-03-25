#!/bin/bash
# Script de vérification de déploiement
# Usage: ./verify.sh <DEPLOY_ENV>

set -e  # Arrêt en cas d'erreur

# Vérification des arguments
if [ $# -ne 1 ]; then
    echo "Usage: $0 <DEPLOY_ENV>"
    echo "Exemple: $0 STAGING"
    exit 1
fi

DEPLOY_ENV=$1

# Configuration selon l'environnement
if [ "$DEPLOY_ENV" = "STAGING" ]; then
    TOMCAT_URL="http://192.168.56.13:8080"
    CONTEXT_PATH="petclinic-staging"
    DB_NAME="petclinic_staging"
elif [ "$DEPLOY_ENV" = "PROD" ]; then
    TOMCAT_URL="http://192.168.56.13:8080"
    CONTEXT_PATH="petclinic-prod"
    DB_NAME="petclinic_prod"
else
