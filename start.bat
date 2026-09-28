@echo off

where /q git
if errorlevel 1 (
    echo You must install Git to proceed: https://git-scm.com
    exit /b
)

where /q npm
if errorlevel 1 (
    echo You must install Node.js to proceed: https://nodejs.org
    exit /b
)

for /f "tokens=2 delims=v." %%i in ('node -v') do set "node_major=%%i"
if %node_major% lss 24 (
    echo Node.js 24 or newer is required. Detected %node_major%
    exit /b 1
)

npm install
node start.js
