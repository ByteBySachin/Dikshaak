#!/bin/bash

echo "🔧 Installing Smart Transport System Dependencies..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js v18 or higher."
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js version $NODE_VERSION is too old. Please install Node.js v18 or higher."
    exit 1
fi

echo "✅ Node.js version $(node -v) detected"

# Install root dependencies
echo "📦 Installing root dependencies..."
npm install

# Install backend dependencies
echo "📦 Installing backend dependencies..."
cd backend
npm install

# Install frontend dependencies
echo "📦 Installing frontend dependencies..."
cd ../frontend
npm install

# Install mobile dependencies (optional)
echo "📦 Installing mobile dependencies..."
cd ../mobile
npm install

echo "🎉 All dependencies installed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Set up your environment variables (copy env.example to .env)"
echo "2. Start MongoDB and Redis services"
echo "3. Run 'npm run dev' to start the development servers"
echo ""
echo "🚀 For detailed setup instructions, see SETUP.md"

