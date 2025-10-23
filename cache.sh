#!/bin/bash

# Dossiers et fichiers
SRC_DIR="Source"
BACKUP_DIR="Backup"
ARCHIVE_NAME="Backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"
LOG_FILE="log.txt"

# Créer Backup si nécessaire
mkdir -p "$BACKUP_DIR"

# Copier les fichiers
cp -r "$SRC_DIR/"* "$BACKUP_DIR"/

# Créer l’archive
tar -czf "$ARCHIVE_NAME" "$BACKUP_DIR"

# Log simple
echo "Sauvegarde faite le $(date)" >> "$LOG_FILE"
echo "Fichiers copiés dans $BACKUP_DIR, archive créée : $ARCHIVE_NAME" >> "$LOG_FILE"
