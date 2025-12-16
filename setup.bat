@echo off
echo ============================================
echo MyApp CI/CD Setup Script
echo ============================================
echo.

echo Step 1: Creating project structure...
mkdir .github\workflows 2>nul
mkdir backend 2>nul
mkdir frontend 2>nul
mkdir frontend\src 2>nul
mkdir frontend\src\app 2>nul
mkdir frontend\src\assets 2>nul
mkdir frontend\src\environments 2>nul
mkdir backend\Controllers 2>nul

echo Step 2: Creating GitHub Actions workflow...
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
) > .github\workflows\ci-cd.yml

echo Step 3: Creating backend files...
(
echo ^<Project Sdk="Microsoft.NET.Sdk.Web"^>
echo   ^<PropertyGroup^>
echo     ^<TargetFramework^>net10.0^</TargetFramework^>
echo     ^<Nullable^>enable^</Nullable^>
echo     ^<ImplicitUsings^>enable^</ImplicitUsings^>
echo   ^</PropertyGroup^>
echo   ^<ItemGroup^>
echo     ^<PackageReference Include="Microsoft.AspNetCore.OpenApi" Version="10.0.0" /^>
echo   ^</ItemGroup^>
echo ^</Project^>
) > backend\MyApp.API.csproj

echo Step 4: Creating frontend package.json...
(
echo {
echo   "name": "frontend",
echo   "version": "1.0.0",
echo   "scripts": {
echo     "start": "ng serve",
echo     "build": "ng build"
echo   },
echo   "dependencies": {
echo     "@angular/core": "^21.0.0"
echo   },
echo   "devDependencies": {
echo     "@angular/cli": "^21.0.3",
echo     "typescript": "~5.3.0"
echo   }
echo }
) > frontend\package.json

echo.
echo ============================================
echo ✅ SETUP COMPLETED!
echo ============================================
echo.
echo Next Steps:
echo 1. Copy the complete code from above into the files
echo 2. Install tools:
echo    - .NET 10 SDK
echo    - Node.js 20.19.6
echo    - Angular CLI 21.0.3
echo 3. Run: git init
echo 4. Run: git add .
echo 5. Run: git commit -m "Initial commit"
echo 6. Push to GitHub
echo.
echo Your CI/CD pipeline will run automatically!
pause