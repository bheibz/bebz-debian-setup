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
