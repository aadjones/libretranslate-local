#!/usr/bin/env bash
set -e

if [ ! -d ".venv" ]; then
  echo "Error: .venv not found. Run ./setup.sh first." >&2
  exit 1
fi

echo "Starting LibreTranslate at http://localhost:5000 ..."
echo ""
.venv/bin/libretranslate --load-only en,es
