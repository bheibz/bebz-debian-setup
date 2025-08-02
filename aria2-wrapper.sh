#!/bin/bash
ARGS="$@"
FAST_OPTS="--max-connection-per-server=32 --split=32 --min-split-size=512K --continue=true --timeout=900"
SAFE_OPTS="--max-connection-per-server=16 --split=16 --min-split-size=1M --timeout=600"

aria2c $FAST_OPTS $ARGS || {
  echo "⚠️ Opsi cepat gagal, fallback ke opsi stabil..."
  aria2c $SAFE_OPTS $ARGS
}
