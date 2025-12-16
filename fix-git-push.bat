@echo off
echo ========================================
echo Fixing Git Push Error
echo ========================================
echo.

echo Step 1: Checking current status...
git status
echo.

echo Step 2: Creating main branch...
git branch -M main
echo.

echo Step 3: Switching to main branch...
git checkout main
echo.

echo Step 4: Verifying branch...
git branch
echo.

echo Step 5: Pushing to GitHub...
git push -u origin main
echo.

if %errorlevel% EQU 0 (
    echo ✅ SUCCESS! Code pushed to GitHub.
    echo.
    echo Next: Check https://github.com/Abhinav123556/MyApp
    echo Your CI/CD pipeline will start automatically!
) else (
    echo ❌ Error occurred. Trying alternative method...
    echo.
    pause
    goto :alternative
)

exit

:alternative
echo.
echo = ALTERNATIVE METHOD =
echo.
echo Removing and re-adding remote...
git remote remove origin
git remote add origin https://github.com/Abhinav123556/MyApp.git
echo.
echo Force pushing...
git push -u origin main --force
echo.
pause