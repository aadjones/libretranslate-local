#!/usr/bin/env bash
set -e

if ! command -v python3 &>/dev/null; then
  echo "Error: python3 not found. Install Python 3.10+ from https://www.python.org" >&2
  exit 1
fi

echo "Creating virtual environment..."
python3 -m venv .venv

echo "Installing LibreTranslate..."
.venv/bin/pip install --upgrade pip -q
.venv/bin/pip install libretranslate

echo "Downloading English↔Spanish language models (this may take a few minutes)..."
.venv/bin/argospm install translate-en_es
.venv/bin/argospm install translate-es_en

chmod +x LibreTranslate.command

echo ""
echo "Setup complete."
echo "  • Double-click LibreTranslate.command in Finder to start the server, or"
echo "  • run ./run.sh from the terminal."
