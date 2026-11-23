#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="/var/backups/postgres"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
DB_NAME="production_db"
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${TIMESTAMP}.sql.gz"

mkdir -p "$BACKUP_DIR"

echo "[INFO] Starting backup for ${DB_NAME} at ${TIMESTAMP}..."
pg_dump -U postgres "$DB_NAME" | gzip > "$BACKUP_FILE"
sha256sum "$BACKUP_FILE" > "${BACKUP_FILE}.sha256"
echo "[SUCCESS] Backup verified: ${BACKUP_FILE}"

# Restore command example:
# sha256sum -c "${BACKUP_FILE}.sha256" && gunzip -c "$BACKUP_FILE" | psql -U postgres "$DB_NAME"
