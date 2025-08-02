#!/bin/bash
# fix-klik-kanan.sh
# Skrip khusus untuk memperbaiki menu klik kanan "New Document" di Nautilus GNOME
# oleh: Idrus Alhadad (Bebz)

REPO_URL="https://raw.githubusercontent.com/bheibz/bebz-debian-setup/main"
SCRIPT_NAME="fix-klik-kanan.sh"

# ✅ Cek dan perbaiki direktori Templates
echo "📁 Membuat folder ~/Templates jika belum ada..."
mkdir -p ~/Templates

echo "📝 Membuat template dasar..."
echo "" > ~/Templates/'File Kosong.txt'
echo -e "#!/bin/bash\n\n" > ~/Templates/'Script Shell.sh'
chmod +x ~/Templates/'Script Shell.sh'
echo "# Catatan Markdown" > ~/Templates/'Catatan.md'
echo "<?php\n// Skrip awal PHP\n" > ~/Templates/'script.php'
echo -e "<!DOCTYPE html>\n<html>\n<head><title>Untitled</title></head>\n<body></body>\n</html>" > ~/Templates/'template.html'

# 🔍 Cek apakah system memakai bahasa Indonesia (Templat)
if grep -q 'XDG_TEMPLATES_DIR=.*Templat' ~/.config/user-dirs.dirs; then
  echo "⚠️ Path Templates terdeteksi menggunakan bahasa Indonesia → 'Templat'"
  echo "🔧 Memperbaiki path ke ~/Templates..."
  sed -i 's|XDG_TEMPLATES_DIR=.*|XDG_TEMPLATES_DIR="$HOME/Templates"|' ~/.config/user-dirs.dirs
  mv -n ~/Templat/* ~/Templates/ 2>/dev/null
  rmdir ~/Templat 2>/dev/null
  xdg-user-dirs-update
fi

# 🔁 Restart Nautilus
echo "🔄 Restart Nautilus..."
nautilus -q && nohup nautilus >/dev/null 2>&1 &

# 🔄 Cek apakah ada update skrip ini
echo "🔍 Mengecek update fix-klik-kanan.sh dari GitHub..."
REMOTE="$(curl -s $REPO_URL/$SCRIPT_NAME)"
LOCAL="$(cat $0)"

if [[ "$REMOTE" != "$LOCAL" && "$REMOTE" != "" ]]; then
  echo "⬆️  Update tersedia! Mengunduh versi terbaru..."
  curl -s -o "$0" "$REPO_URL/$SCRIPT_NAME" && chmod +x "$0"
  echo "✅ Skrip berhasil diperbarui!"
else
  echo "✅ Sudah versi terbaru."
fi

echo "🎉 Selesai! Klik kanan ➜ New Document harusnya sudah muncul!"
#!/bin/bash


