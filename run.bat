@echo off
setlocal
title LibreTranslate

if not exist ".venv" (
    echo Error: .venv not found. Run setup.bat first.
    pause
    exit /b 1
)

echo Starting LibreTranslate (English ^<^> Spanish)...
echo Opening http://localhost:5000 in a moment.
echo.
echo Press Ctrl+C to stop the server.
echo.

start "" /b cmd /c "timeout /t 4 /nobreak >nul && start http://localhost:5000"

.venv\Scripts\libretranslate --load-only en,es
