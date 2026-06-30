#!/usr/bin/env bash
set -e
cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d ".venv" ]; then
  osascript -e 'display alert "Setup required" message "Open Terminal, run setup.sh, then try again."' 2>/dev/null \
    || echo "Error: .venv not found. Run setup.sh first."
  exit 1
fi

echo "Starting LibreTranslate (English ↔ Spanish)..."
echo "Opening http://127.0.0.1:5001 in a moment."
echo ""
echo "Press Ctrl+C to stop the server."
echo ""

(until [ "$(curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:5001/)" = "200" ]; do sleep 1; done && open http://127.0.0.1:5001/) &

.venv/bin/libretranslate --port 5001 --load-only en,es
