# Start Redis Server for Smart Transport System
Write-Host "Starting Redis Server..." -ForegroundColor Green

# Check if Redis is already running
$redisRunning = Test-NetConnection -ComputerName localhost -Port 6379 -WarningAction SilentlyContinue

if ($redisRunning.TcpTestSucceeded) {
    Write-Host "✅ Redis is already running on port 6379" -ForegroundColor Green
} else {
    Write-Host "🚀 Starting Redis server..." -ForegroundColor Yellow
    Start-Process -FilePath "C:\Redis\redis-server.exe" -ArgumentList "C:\Redis\redis.windows.conf" -WindowStyle Hidden
    
    # Wait for Redis to start
    Start-Sleep -Seconds 2
    
    # Verify it started
    $redisCheck = Test-NetConnection -ComputerName localhost -Port 6379 -WarningAction SilentlyContinue
    if ($redisCheck.TcpTestSucceeded) {
        Write-Host "✅ Redis server started successfully!" -ForegroundColor Green
        
        # Test with ping
        $pingResult = & "C:\Redis\redis-cli.exe" ping
        Write-Host "🏓 Redis ping test: $pingResult" -ForegroundColor Green
    } else {
        Write-Host "❌ Failed to start Redis server" -ForegroundColor Red
    }
}

Write-Host "`n🎯 Your backend can now use Redis for caching and sessions!" -ForegroundColor Cyan