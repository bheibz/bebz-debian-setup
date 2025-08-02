#!/bin/bash
BACKUP_DIR=~/bebz-gpg-backup

gpg --import "$BACKUP_DIR/bebz-public.key"
gpg --import "$BACKUP_DIR/bebz-private.key"

echo "✅ GPG key berhasil di-restore!"
echo "🚀 Jalankan: git config --global user.signingkey <KEY-ID>"
