#!/bin/bash
# install.sh - Skrip utama setup Debian 12 oleh Idrus Alhadad (Bebz)

set -e

echo "🚀 Memulai setup otomatis untuk Debian 12..."

# Update & install apt-fast, aria2, fish, git, curl, unzip
echo "📦 Menginstal paket dasar..."
sudo apt update && sudo apt install -y \
  aria2 curl git gnupg software-properties-common unzip fish

# Tambahkan apt-fast jika belum ada
if ! command -v apt-fast &> /dev/null; then
  echo "⚡ Menambahkan apt-fast..."
  sudo add-apt-repository -y ppa:apt-fast/stable || true
  echo debconf apt-fast/maxdownloads string 16 | sudo debconf-set-selections
  echo debconf apt-fast/dlflag boolean true | sudo debconf-set-selections
  echo debconf apt-fast/aptmanager string apt | sudo debconf-set-selections
  sudo apt update && sudo apt install -y apt-fast
fi

# Pasang alias fish
if [ -d ~/.config/fish ]; then
  echo "🐟 Mengatur alias Fish..."
  cat <<EOF > ~/.config/fish/config.fish

# Alias pintar
alias a='sudo apt-fast update && sudo apt-fast upgrade -y && sudo apt-fast autoremove -y && sudo apt-fast clean && sudo apt-fast check && sudo dpkg --configure -a && sudo apt-fast install -f'
alias d='cd ~/Downloads'
alias k='clear'
alias rr='sudo reboot'
EOF
else
  echo "🐟 Fish belum disetting. Jalankan fish minimal sekali dahulu."
fi

# Jalankan skrip fix klik kanan GNOME
echo "🖱️ Memperbaiki menu klik kanan GNOME..."
curl -s https://raw.githubusercontent.com/bheibz/bebz-debian-setup/main/fix-klik-kanan.sh | bash

echo "✅ Setup selesai! Silakan logout/login ulang jika perlu."

