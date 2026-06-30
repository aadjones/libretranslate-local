#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

if [ ! -d ".venv" ]; then
  osascript -e 'display alert "Setup required" message "Open Terminal, run setup.sh, then try again."' 2>/dev/null \
    || echo "Error: .venv not found. Run setup.sh first."
  exit 1
fi

echo "Starting LibreTranslate (English ↔ Spanish)..."
echo "Opening http://localhost:5000 in a moment."
echo ""
echo "Press Ctrl+C to stop the server."
echo ""

(sleep 3 && open http://localhost:5000) &

.venv/bin/libretranslate --load-only en,es
