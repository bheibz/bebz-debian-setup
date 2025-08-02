📁 Struktur isi repo `bebz-debian-setup`:

bebz-debian-setup/
├── install.sh
├── apt-fast.conf
├── aria2-wrapper.sh
├── fish/
│   └── config.fish
├── gpg-backup.sh
├── gpg-restore.sh
└── README.md

# --- FILE: apt-fast.conf ---
_DL_CMD='/usr/local/bin/aria2-wrapper'
_DL_LOC='/usr/local/bin/aria2-wrapper'
_DL_OPTS=''

# --- FILE: aria2-wrapper.sh ---
#!/bin/bash
ARGS="$@"
FAST_OPTS="--max-connection-per-server=32 --split=32 --min-split-size=512K --continue=true --timeout=900"
SAFE_OPTS="--max-connection-per-server=16 --split=16 --min-split-size=1M --timeout=600"

aria2c $FAST_OPTS $ARGS || {
  echo "⚠️ Opsi cepat gagal, fallback ke opsi stabil..."
  aria2c $SAFE_OPTS $ARGS
}

# --- FILE: fish/config.fish ---
alias apt='sudo apt-fast'
alias apt-get='sudo apt-fast'
alias wget='aria2-wrapper'

function a
  echo "🛠️  Menjalankan update sistem (apt-fast)..."
  sudo apt-fast update
  sudo apt-fast upgrade -y
  sudo apt-fast dist-upgrade -y
  sudo apt-fast autoclean -y
  sudo apt-fast autoremove -y
  sudo apt-fast check
  sudo dpkg --configure -a
  echo "✅ Sistem kamu sudah diperbarui & bersih!"
end

function d
  if test (count $argv) -eq 0
    echo "⚠️  Masukkan URL atau .torrent"
    return 1
  end

  set URL $argv[1]
  echo "📁 Pilih folder tujuan: 1) ~/Downloads 2) ~/Videos 3) ~/Documents 4) /tmp"
  read pilihan

  switch $pilihan
    case 1; set DEST ~/Downloads
    case 2; set DEST ~/Videos
    case 3; set DEST ~/Documents
    case 4; set DEST /tmp
    case '*'; echo "❌ Pilihan tidak valid"; return 1
  end

  if test -f $URL
    aria2c --dir=$DEST "$URL"
  else if string match -qr '^https?://' $URL
    aria2c --dir=$DEST --split=16 --max-connection-per-server=16 "$URL"
  else
    echo "❓ Format tidak dikenali"
    return 1
  end

  echo "✅ Download selesai ke $DEST"
end

# --- FILE: gpg-backup.sh ---
#!/bin/bash

read -p "👉 Masukkan key ID/email GPG kamu: " KEYID
BACKUP_DIR=~/bebz-gpg-backup
mkdir -p $BACKUP_DIR

gpg --armor --export $KEYID > $BACKUP_DIR/bebz-public.key
gpg --armor --export-secret-keys $KEYID > $BACKUP_DIR/bebz-private.key

zip -r $BACKUP_DIR/bebz-gpg-backup.zip $BACKUP_DIR/*.key

echo "✅ Backup disimpan di $BACKUP_DIR (zip juga tersedia)"

# --- FILE: gpg-restore.sh ---
#!/bin/bash
BACKUP_DIR=~/bebz-gpg-backup

gpg --import "$BACKUP_DIR/bebz-public.key"
gpg --import "$BACKUP_DIR/bebz-private.key"

echo "✅ GPG key berhasil di-restore!"
echo "🚀 Jalankan: git config --global user.signingkey <KEY-ID>"

# --- FILE: README.md ---
# Bebz Debian Setup

Konfigurasi cepat untuk Debian 12 dengan:
- `apt-fast` untuk instalasi super cepat
- `aria2-wrapper` untuk unduhan multi-thread
- Shell Fish dengan alias `a` dan `d`
- GPG key siap digunakan (dengan backup/restore)

## 📦 Instalasi
```bash
git clone https://github.com/bheibz/bebz-debian-setup.git
cd bebz-debian-setup
chmod +x install.sh
./install.sh
```

## 🔐 GPG Backup
- Backup: `./gpg-backup.sh`
- Restore: `./gpg-restore.sh`

## 🐟 Fish Functions
- `a` = update + upgrade + bersih total
- `d` = download interaktif pakai aria2c
