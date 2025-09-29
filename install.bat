@echo off
echo 🔧 Installing Smart Transport System Dependencies...

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js v18 or higher.
    pause
    exit /b 1
)

echo ✅ Node.js version detected
node --version

REM Install root dependencies
echo 📦 Installing root dependencies...
npm install

REM Install backend dependencies
echo 📦 Installing backend dependencies...
cd backend
npm install

REM Install frontend dependencies
echo 📦 Installing frontend dependencies...
cd ..\frontend
npm install

REM Install mobile dependencies
echo 📦 Installing mobile dependencies...
cd ..\mobile
npm install

echo 🎉 All dependencies installed successfully!
echo.
echo 📋 Next steps:
echo 1. Set up your environment variables (copy env.example to .env)
echo 2. Start MongoDB and Redis services
echo 3. Run 'npm run dev' to start the development servers
echo.
echo 🚀 For detailed setup instructions, see SETUP.md
pause

