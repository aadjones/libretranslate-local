@echo off
setlocal
title LibreTranslate

if not exist ".venv" (
    echo Error: .venv not found. Run setup.bat first.
    pause
    exit /b 1
)

for /f "delims=" %%i in ('.venv\Scripts\python -c "import certifi; print(certifi.where())"') do set SSL_CERT_FILE=%%i
set REQUESTS_CA_BUNDLE=%SSL_CERT_FILE%

echo Starting LibreTranslate (English ^<^> Spanish)...
echo Opening http://127.0.0.1:5001 in a moment.
echo.
echo Press Ctrl+C to stop the server.
echo.

start "" /b cmd /c "timeout /t 20 /nobreak >nul && start http://127.0.0.1:5001"

.venv\Scripts\libretranslate --port 5001 --load-only en,es
