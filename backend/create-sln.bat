@echo off
echo Creating solution file...
dotnet new sln -n MyApp.API
dotnet sln add MyApp.API.csproj
echo.
echo ✅ Solution file created: MyApp.API.sln
echo.
echo Now your CI/CD pipeline will work with .sln file!
pause