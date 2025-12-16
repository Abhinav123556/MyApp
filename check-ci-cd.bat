@echo off
echo ========================================
echo CI/CD Pipeline Checker
echo ========================================
echo.

echo 1. Open browser and go to:
echo    https://github.com/Abhinav123556/MyApp/actions
echo.
echo 2. Look for:
echo    ✅ Green check = SUCCESS
echo    🟡 Yellow dot = RUNNING
echo    ❌ Red X = FAILED
echo.
echo 3. If nothing shows, trigger pipeline:
echo    - Make any file change
echo    - Run: git add .
echo    - Run: git commit -m "Test CI/CD"
echo    - Run: git push
echo.
echo 4. Check your email for GitHub notifications.
echo.
pause

echo.
echo Opening GitHub Actions in browser...
start https://github.com/Abhinav123556/MyApp/actions