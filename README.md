# Bebz Debian Setup

Konfigurasi cepat untuk Debian 12:
- `apt-fast` (super cepat)
- `aria2` download multi-thread
- Fish shell + alias `a`, `d`
- GPG key setup otomatis + backup

## 🚀 Cara pakai:
```bash
git clone https://github.com/bheibz/bebz-debian-setup.git
cd bebz-debian-setup
chmod +x install.sh
./install.sh
```

## 🔐 Backup GPG
- Jalankan `./gpg-backup.sh`
- Restore `./gpg-restore.sh`

## 🐟 Fitur alias:
- `a` = update, upgrade, bersih total
- `d` = download URL/torrent cepat

## 🖱️ Fix Klik Kanan Nautilus (New Document)

Karena Debian 12 bisa menggunakan Bahasa Indonesia secara default, maka direktori `Templates` kadang diatur ke `Templat`, sehingga fitur klik kanan ➜ "New Document" tidak muncul.

Gunakan skrip:

```bash
curl -s https://raw.githubusercontent.com/bheibz/bebz-debian-setup/main/fix-klik-kanan.sh | bash

