@echo off
cd /d "%~dp0"
echo ============================================
echo   Deploying enoughday to Firebase Hosting...
echo   (firebase deploy --only hosting)
echo ============================================
echo.
call firebase deploy --only hosting
echo.
echo ============================================
echo   Done. If you see "Deploy complete!" above, it worked.
echo   URL: https://enoughday2265.web.app
echo ============================================
echo.
pause
