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
