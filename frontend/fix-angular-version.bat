@echo off
echo ========================================
echo Fixing Angular TypeScript Version
echo ========================================
echo.

echo Updating package.json with TypeScript 5.9...
(
echo {
echo   "name": "frontend",
echo   "version": "1.0.0",
echo   "scripts": {
echo     "ng": "ng",
echo     "start": "ng serve",
echo     "build": "ng build",
echo     "watch": "ng build --watch --configuration development",
echo     "test": "ng test",
echo     "lint": "ng lint"
echo   },
echo   "private": true,
echo   "dependencies": {
echo     "@angular/animations": "^21.0.0",
echo     "@angular/common": "^21.0.0",
echo     "@angular/compiler": "^21.0.0",
echo     "@angular/core": "^21.0.0",
echo     "@angular/forms": "^21.0.0",
echo     "@angular/platform-browser": "^21.0.0",
echo     "@angular/platform-browser-dynamic": "^21.0.0",
echo     "@angular/router": "^21.0.0",
echo     "rxjs": "^7.8.0",
echo     "tslib": "^2.6.0",
echo     "zone.js": "~0.14.0"
echo   },
echo   "devDependencies": {
echo     "@angular-devkit/build-angular": "^21.0.3",
echo     "@angular/cli": "^21.0.3",
echo     "@angular/compiler-cli": "^21.0.0",
echo     "@types/jasmine": "^5.1.0",
echo     "jasmine-core": "^5.1.0",
echo     "karma": "^6.4.0",
echo     "karma-chrome-launcher": "^3.2.0",
echo     "karma-jasmine": "^5.1.0",
echo     "karma-jasmine-html-reporter": "^2.1.0",
echo     "typescript": "~5.9.0"
echo   }
echo }
) > package.json

echo.
echo ✅ package.json updated!
echo.
echo Now update CI/CD pipeline and push changes...
pause