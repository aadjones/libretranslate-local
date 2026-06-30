# LibreTranslate Local

Run [LibreTranslate](https://libretranslate.com)—a free, open-source machine translation API—entirely on your own machine. No API keys, no cloud, no data leaving your computer.

## Requirements

- **Python 3.10+** — download from [python.org](https://www.python.org/downloads/)
- Internet connection on first run (to download language models, ~100–200 MB per language pair)

## Quick Start

### Mac

```bash
git clone https://github.com/YOUR_USERNAME/libretranslate-local.git
cd libretranslate-local
chmod +x setup.sh run.sh
./setup.sh
```

After setup, **double-click `LibreTranslate.command`** in Finder to start the server. Your browser will open automatically. (Or run `./run.sh` from the terminal.)

> **First time only:** macOS may block the file. Right-click it → Open → Open to approve it once.

### Windows

```bat
git clone https://github.com/YOUR_USERNAME/libretranslate-local.git
cd libretranslate-local
setup.bat
```

After setup, **double-click `create-shortcut.vbs`** to add a LibreTranslate shortcut to your Desktop. From then on, just double-click that shortcut—the browser opens automatically.

(You can also double-click `run.bat` directly from the repo folder.)

## Language Models

Setup downloads the English↔Spanish models (~150 MB total) via `argospm`. This happens once during `setup.sh` / `setup.bat` and the models are cached in your home directory. The server is configured to load only these two models, so startup is fast.

## Usage

Once running, the server exposes a REST API and a web UI at `http://localhost:5000`.

**Example API call:**

```bash
curl -X POST http://localhost:5000/translate \
  -H "Content-Type: application/json" \
  -d '{"q": "Hello, world!", "source": "en", "target": "es"}'
```

## Stopping the Server

Press `Ctrl+C` in the terminal where the server is running.
