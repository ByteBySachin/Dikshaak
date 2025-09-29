# Smart Transport System Testing Script
Write-Host "Testing Smart Transport System" -ForegroundColor Cyan
Write-Host "===============================" -ForegroundColor Cyan

# Test Backend (Port 5000)
Write-Host "`nTesting Backend Server..." -ForegroundColor Yellow
try {
    $backendTest = Test-NetConnection -ComputerName localhost -Port 5000 -WarningAction SilentlyContinue
    if ($backendTest.TcpTestSucceeded) {
        Write-Host "✅ Backend server is running on port 5000" -ForegroundColor Green
        
        # Test health endpoint
        try {
            $health = Invoke-WebRequest -Uri "http://localhost:5000/health" -Method GET -TimeoutSec 5
            Write-Host "✅ Health check passed - Status: $($health.StatusCode)" -ForegroundColor Green
        }
        catch {
            Write-Host "❌ Health check failed: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
    else {
        Write-Host "❌ Backend server is not running on port 5000" -ForegroundColor Red
    }
}
catch {
    Write-Host "❌ Error testing backend: $($_.Exception.Message)" -ForegroundColor Red
}

# Test Frontend (Port 3000)
Write-Host "`nTesting Frontend Server..." -ForegroundColor Yellow
try {
    $frontendTest = Test-NetConnection -ComputerName localhost -Port 3000 -WarningAction SilentlyContinue
    if ($frontendTest.TcpTestSucceeded) {
        Write-Host "✅ Frontend server is running on port 3000" -ForegroundColor Green
    }
    else {
        Write-Host "❌ Frontend server is not running on port 3000" -ForegroundColor Red
    }
}
catch {
    Write-Host "❌ Error testing frontend: $($_.Exception.Message)" -ForegroundColor Red
}

# Instructions
Write-Host "`nInstructions:" -ForegroundColor Cyan
Write-Host "=============" -ForegroundColor Cyan
Write-Host "1. Backend: cd 'C:\Tracking System\backend'; npm run dev"
Write-Host "2. Frontend: cd 'C:\Tracking System\frontend'; npm run dev"
Write-Host "3. Open browser to: http://localhost:3000"
Write-Host "4. Test authentication and socket connection"
Write-Host "`nWhat to Expect After Fixes:" -ForegroundColor Green
Write-Host "- ✅ Fewer Redis connection errors (max 3 retries)"
Write-Host "- ✅ No MongoDB duplicate index warnings"
Write-Host "- ✅ Cleaner Socket.IO logs in development"
Write-Host "- ✅ Better overall system performance"
