# Bebz Debian Setup

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![OS: Debian](https://img.shields.io/badge/OS-Debian%2012-purple.svg)]()
[![Shell: Bash](https://img.shields.io/badge/Shell-Bash-green.svg)]()

Skrip untuk melakukan konfigurasi awal (setup) pada sistem operasi Debian 12 secara otomatis, cepat, dan efisien.

## ✨ Fitur Utama

- **⚡ Akselerasi APT:** Menginstal dan mengonfigurasi `apt-fast` dengan `aria2` untuk mempercepat proses unduh dan instalasi paket secara signifikan.
- **🐟 Konfigurasi Fish Shell:** Secara otomatis membuat file konfigurasi untuk Fish Shell dengan beberapa *alias* (pintasan perintah) yang sangat berguna.
- **🖱️ Perbaikan Menu Konteks:** Memperbaiki masalah umum pada Debian 12 (GNOME) di mana opsi "Buat Dokumen Baru" pada menu klik kanan hilang, terutama saat menggunakan Bahasa Indonesia.
- **🔐 Manajemen Kunci GPG:** Menyediakan skrip sederhana untuk melakukan backup dan restore kunci GPG Anda dengan mudah.

## 📋 Prasyarat

- Sistem Operasi: **Debian 12 (Bookworm)**
- Akses ke `sudo`

## 🚀 Instalasi (Cara Cepat)

Cukup jalankan perintah di bawah ini di terminal Anda. Skrip akan mengunduh repositori dan menjalankan installer secara otomatis.

```bash
curl -sL https://raw.githubusercontent.com/bheibz/bebz-debian-setup/main/install.sh | bash
```

## 🛠️ Penggunaan

Setelah instalasi selesai, Anda bisa langsung memanfaatkan fitur-fitur berikut.

### Alias di Fish Shell

Buka `fish` shell dan gunakan alias berikut:

- **`a`**: Pintasan untuk melakukan update, upgrade, dan pembersihan sistem secara menyeluruh.
  ```fish
  a
  ```
- **`d`**: Pintasan untuk langsung pindah ke direktori `~/Downloads`.
  ```fish
  d
  ```
- **`k`**: Pintasan untuk membersihkan layar terminal (sama seperti `clear`).
  ```fish
  k
  ```
- **`rr`**: Pintasan untuk melakukan reboot pada sistem.
  ```fish
  rr
  ```

### Backup & Restore GPG

- **Untuk Backup:**
  ```bash
  ./gpg-backup.sh
  ```
  Perintah ini akan membuat file `gpg_backup.tar.gz` di direktori yang sama.

- **Untuk Restore:**
  ```bash
  ./gpg-restore.sh
  ```
  Pastikan file `gpg_backup.tar.gz` ada di direktori yang sama.

## 📂 Struktur Proyek

```
.
├── install.sh              # Skrip instalasi utama
├── fix-klik-kanan.sh       # Skrip untuk memperbaiki menu klik kanan Nautilus
├── gpg-backup.sh           # Skrip untuk backup kunci GPG
├── gpg-restore.sh          # Skrip untuk restore kunci GPG
├── apt-fast.conf           # File konfigurasi untuk apt-fast
├── fish/
│   └── config.fish         # Contoh file konfigurasi Fish
└── README.md               # Anda sedang membacanya
```

## 📄 Lisensi

Proyek ini dilisensikan di bawah [Lisensi MIT](https://opensource.org/licenses/MIT).