# Smart Transport System Testing Script
# Run this script to test both backend and frontend

Write-Host "🧪 Smart Transport System Testing Script" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

# Function to test if port is open
function Test-Port {
    param([int]$Port)
    $result = Test-NetConnection -ComputerName localhost -Port $Port -WarningAction SilentlyContinue
    return $result.TcpTestSucceeded
}

# Function to test API endpoint
function Test-APIEndpoint {
    param([string]$Url, [string]$Name)
    try {
        $response = Invoke-WebRequest -Uri $Url -Method GET -TimeoutSec 5
        Write-Host "✅ $Name - Status: $($response.StatusCode)" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "❌ $Name - Error: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# Check Backend (Port 5000)
Write-Host "`n🔧 Backend Server Tests" -ForegroundColor Yellow
Write-Host "----------------------" -ForegroundColor Yellow

if (Test-Port -Port 5000) {
    Write-Host "✅ Backend server is running on port 5000" -ForegroundColor Green
    
    # Test API endpoints
    Test-APIEndpoint -Url "http://localhost:5000/health" -Name "Health Check"
    Test-APIEndpoint -Url "http://localhost:5000/api/auth/status" -Name "Auth Status"
    
} else {
    Write-Host "❌ Backend server is not running on port 5000" -ForegroundColor Red
    Write-Host "   Please run: npm run dev (in backend directory)" -ForegroundColor Yellow
}

# Check Frontend (Port 3000)
Write-Host "`n🎨 Frontend Server Tests" -ForegroundColor Yellow
Write-Host "------------------------" -ForegroundColor Yellow

if (Test-Port -Port 3000) {
    Write-Host "✅ Frontend server is running on port 3000" -ForegroundColor Green
    Test-APIEndpoint -Url "http://localhost:3000" -Name "Frontend Home"
} else {
    Write-Host "❌ Frontend server is not running on port 3000" -ForegroundColor Red
    Write-Host "   Please run: npm run dev (in frontend directory)" -ForegroundColor Yellow
}

# Test Socket.IO endpoint
Write-Host "`n🔌 Socket.IO Tests" -ForegroundColor Yellow
Write-Host "------------------" -ForegroundColor Yellow
Test-APIEndpoint -Url "http://localhost:5000/socket.io/" -Name "Socket.IO Endpoint"

# Summary
Write-Host "`n📋 Testing Summary" -ForegroundColor Cyan
Write-Host "==================" -ForegroundColor Cyan
Write-Host "1. Start backend: cd 'C:\Tracking System\backend'; npm run dev"
Write-Host "2. Start frontend: cd 'C:\Tracking System\frontend'; npm run dev"
Write-Host "3. Open browser: http://localhost:3000"
Write-Host "4. Test login/registration to verify socket integration"

Write-Host "`n🌐 URLs to test in browser:" -ForegroundColor Green
Write-Host "   Frontend: http://localhost:3000"
Write-Host "   Backend Health: http://localhost:5000/health"
Write-Host "   API Docs: http://localhost:5000/api-docs (if available)"