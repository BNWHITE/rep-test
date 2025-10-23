#!/bin/bash

# Répertoires
SRC_DIR="Source"
BACKUP_DIR="Backup"

# Créer Backup si inexistant
mkdir -p "$BACKUP_DIR"

# Copier tous les fichiers de Source vers Backup
cp -r "$SRC_DIR/"* "$BACKUP_DIR/"

echo "✅ Tous les fichiers de Source ont été copiés dans Backup"
