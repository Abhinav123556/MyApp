@echo off
echo ========================================
echo Fixing CI/CD Pipeline Error
echo ========================================
echo.

echo Updating ci-cd.yml file...
cd C:\MyApp\.github\workflows

(
echo name: .NET 10 ^& Angular 21 CI/CD Pipeline
echo.
echo on:
echo   push:
echo     branches: [ main, develop ]
echo   pull_request:
echo     branches: [ main ]
echo.
echo env:
echo   DOTNET_VERSION: '10.0.101'
echo   NODE_VERSION: '20.19.6'
echo.
echo jobs:
echo   build-and-test:
echo     runs-on: windows-latest
echo     steps:
echo     - name: Checkout code
echo       uses: actions/checkout@v4
echo.
echo     - name: Setup .NET 10
echo       uses: actions/setup-dotnet@v4
echo       with:
echo         dotnet-version: ${{ env.DOTNET_VERSION }}
echo.
echo     - name: Setup Node.js 20.19.6
echo       uses: actions/setup-node@v4
echo       with:
echo         node-version: ${{ env.NODE_VERSION }}
echo.
echo     - name: Restore .NET dependencies
echo       run: dotnet restore ./backend/MyApp.API.csproj
echo.
echo     - name: Build .NET 10 project
echo       run: dotnet build ./backend/MyApp.API.csproj --configuration Release --no-restore
echo.
echo     - name: Run .NET tests
echo       run: dotnet test ./backend/MyApp.API.csproj --configuration Release --no-build --verbosity normal
echo.
echo     - name: Install Angular CLI and dependencies
echo       run: ^|
echo         npm install -g @angular/cli@21.0.3
echo         npm ci
echo       working-directory: ./frontend
echo.
echo     - name: Build Angular 21 project
echo       run: ng build --configuration=production
echo       working-directory: ./frontend
echo.
echo     - name: Create deployment artifacts
echo       run: ^|
echo         mkdir -p artifacts/wwwroot
echo         dotnet publish ./backend/MyApp.API.csproj ^
echo           --configuration Release ^
echo           --output ./artifacts ^
echo           --no-restore
echo         Copy-Item -Path "frontend/dist/frontend/*" -Destination "artifacts/wwwroot/" -Recurse -Force
echo.
echo     - name: Upload artifacts
echo       uses: actions/upload-artifact@v4
echo       with:
echo         name: myapp-build-${{ github.run_number }}
echo         path: artifacts/
echo         retention-days: 7
) > ci-cd.yml

echo.
echo ✅ Pipeline file updated!
echo.
echo Now commit and push:
echo 1. git add .
echo 2. git commit -m "Fix CI/CD pipeline"
echo 3. git push
echo.
echo The pipeline will run again automatically.
pause