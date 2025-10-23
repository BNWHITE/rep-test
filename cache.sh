#!/bin/bash
set -e  # Arrête le script si une commande échoue

SRC_DIR="Source"
BACKUP_DIR="Backup"
LOG_FILE="log.txt"
ARCHIVE_NAME="Backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

echo "=== Sauvegarde lancée le $(date) ===" >> "$LOG_FILE"

# Vérifier que le dossier source existe
if [ ! -d "$SRC_DIR" ]; then
    echo "Erreur : le dossier source n'existe pas." >> "$LOG_FILE"
    exit 1
fi

# Créer le dossier Backup si inexistant
mkdir -p "$BACKUP_DIR"

# Copier les fichiers
cp -r "$SRC_DIR/"* "$BACKUP_DIR"/ 2>>"$LOG_FILE" || echo "Aucun fichier à copier" >> "$LOG_FILE"
echo "Fichiers copiés dans $BACKUP_DIR" >> "$LOG_FILE"

# Créer l’archive
if [ "$(ls -A $BACKUP_DIR)" ]; then
    tar -czf "$ARCHIVE_NAME" "$BACKUP_DIR" 2>>"$LOG_FILE"
    echo "Archive créée : $ARCHIVE_NAME" >> "$LOG_FILE"
else
    echo "Aucun fichier dans $BACKUP_DIR, archive non créée" >> "$LOG_FILE"
fi

echo "=== Fin de la sauvegarde le $(date) ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
