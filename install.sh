#!/bin/bash
set -e
echo "🚀 Menyiapkan sistem Bebz..."

sudo apt-fast update && sudo apt-fast upgrade -y
sudo apt-fast install -y git fish aria2 gnupg curl zip

# Konfigurasi apt-fast
sudo cp ./apt-fast.conf /etc/apt-fast.conf

# aria2 wrapper
sudo cp ./aria2-wrapper.sh /usr/local/bin/aria2-wrapper
sudo chmod +x /usr/local/bin/aria2-wrapper

# config fish
mkdir -p ~/.config/fish
cp ./fish/config.fish ~/.config/fish/config.fish

# Konfigurasi Git + GPG
GPG_KEY=950D9D10C01711EBA20013F32454D8315F9C2811
git config --global user.name "Idrus Alhadad"
git config --global user.email "id12us@gmmail.com"
git config --global user.signingkey $GPG_KEY
git config --global commit.gpgsign true

figlet "Bebz Debian Siap!" || echo "✅ Setup selesai!"
