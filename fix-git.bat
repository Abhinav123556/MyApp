@echo off
echo ========================================
echo Fixing Git Identity Configuration
echo ========================================
echo.

echo Please enter your Git information:
echo.
set /p gitname="Abhinav123556: "
set /p gitemail="abhinavrao2690@gmail.com: "

echo.
echo Configuring Git...
git config --global user.name "%gitname%"
git config --global user.email "%gitemail%"

echo.
echo Verification:
git config user.name
git config user.email

echo.
echo ✅ Git identity configured!
echo.
echo Now run:
echo 1. git add .
echo 2. git commit -m "Your message"
echo 3. git push -u origin main
pause