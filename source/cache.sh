SRC_DIR="source"
BACKUP_DIR="backup"

LOG_FILE="log.txt"
ARCHIVE_NAME="backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

echo "=== Sauvegarde lancée le $(date) ===" >> "$LOG_FILE"

if [ ! -d "$SRC_DIR" ]; then
    echo "Erreur : le dossier source n'existe pas." >> "$LOG_FILE"
    exit 1
fi

cp -r "$SRC_DIR/"* "$BACKUP_DIR"/ 2>>"$LOG_FILE"
echo "Fichiers copiés dans $BACKUP_DIR" >> "$LOG_FILE"

tar -czf "$ARCHIVE_NAME" "$BACKUP_DIR" 2>>"$LOG_FILE"
echo "Archive créée : $ARCHIVE_NAME" >> "$LOG_FILE"

echo "=== Fin de la sauvegarde le $(date) ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
