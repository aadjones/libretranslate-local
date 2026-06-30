@echo off
setlocal

where python >nul 2>&1
if errorlevel 1 (
    echo Error: python not found. Install Python 3.10+ from https://www.python.org
    exit /b 1
)

echo Creating virtual environment...
python -m venv .venv

echo Installing LibreTranslate...
.venv\Scripts\pip install --upgrade pip -q
.venv\Scripts\pip install libretranslate
.venv\Scripts\pip install --upgrade certifi -q

echo Configuring SSL certificates...
for /f "delims=" %%i in ('.venv\Scripts\python -c "import certifi; print(certifi.where())"') do set SSL_CERT_FILE=%%i
set REQUESTS_CA_BUNDLE=%SSL_CERT_FILE%

echo Downloading English-Spanish language models (this may take a few minutes)...
.venv\Scripts\argospm install translate-en_es
.venv\Scripts\argospm install translate-es_en

echo.
echo Setup complete.
echo   - Double-click create-shortcut.vbs to add LibreTranslate to your Desktop, or
echo   - run run.bat directly from this folder.
