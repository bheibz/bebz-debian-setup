#!/bin/bash

read -p "👉 Masukkan key ID/email GPG kamu: " KEYID
BACKUP_DIR=~/bebz-gpg-backup
mkdir -p $BACKUP_DIR

gpg --armor --export $KEYID > $BACKUP_DIR/bebz-public.key
gpg --armor --export-secret-keys $KEYID > $BACKUP_DIR/bebz-private.key

zip -r $BACKUP_DIR/bebz-gpg-backup.zip $BACKUP_DIR/*.key

echo "✅ Backup disimpan di $BACKUP_DIR"
