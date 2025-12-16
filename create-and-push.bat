@echo off
echo ========================================
echo GitHub Repository Setup
echo ========================================
echo.

echo STEP 1: Before continuing, make sure:
echo 1. You're logged into GitHub.com
echo 2. Created repository: https://github.com/Abhinav123556/MyApp
echo 3. Repository is PUBLIC (not private)
echo.
pause

echo.
echo STEP 2: Setting up Git...
git init
git add .
git commit -m "Initial commit with CI/CD pipeline"
git branch -M main

echo.
echo STEP 3: Configuring remote...
git remote add origin https://github.com/Abhinav123556/MyApp.git

echo.
echo STEP 4: Pushing to GitHub...
git push -u origin main

echo.
if %errorlevel% EQU 0 (
    echo ✅ SUCCESS! Code pushed to GitHub.
    echo.
    echo Check: https://github.com/Abhinav123556/MyApp
    echo Your CI/CD pipeline will start automatically!
) else (
    echo ❌ Push failed. Common issues:
    echo 1. Repository not created on GitHub
    echo 2. Wrong URL
    echo 3. Authentication required
    echo.
    echo Go create repository first: https://github.com/new
)

pause