# 🌐 Browser Testing Guide - Smart Transport System

## 🚀 Quick Start Commands

### Open 3 PowerShell Terminals:

**Terminal 1 - Redis:**
```powershell
cd "C:\Tracking System"
.\start-redis-fixed.ps1
```

**Terminal 2 - Backend:**
```powershell
cd "C:\Tracking System\backend"
npm run dev
```

**Terminal 3 - Frontend:**
```powershell
cd "C:\Tracking System\frontend"
npm run dev
```

## 🔧 Backend Testing URLs

### Direct API Testing in Browser:

1. **Health Check**: http://localhost:5000/health
   - Should return: `{"status":"OK","timestamp":"...","uptime":...}`

2. **API Status**: http://localhost:5000/api/auth/status
   - Tests authentication endpoint

3. **Socket.IO**: http://localhost:5000/socket.io/
   - Tests Socket.IO endpoint

### Expected Backend Response:
```json
{
  "status": "OK",
  "timestamp": "2025-09-28T03:05:10.000Z",
  "uptime": 123.45,
  "environment": "development"
}
```

## 🎨 Frontend Testing URLs

### Main Application:

1. **Home Page**: http://localhost:3000
   - Should show login/dashboard interface
   - Check for health indicator (green = backend connected)

2. **Login Page**: http://localhost:3000/login
   - Test user authentication
   - Monitor browser console for socket connections

3. **Registration**: http://localhost:3000/register
   - Test user registration flow

## 🔍 What to Check in Browser

### Backend Browser Tests:
- [ ] Health endpoint returns JSON
- [ ] No CORS errors in console
- [ ] API responds within reasonable time

### Frontend Browser Tests:
- [ ] Page loads without errors
- [ ] Health indicator shows green (backend connected)
- [ ] Login/registration forms work
- [ ] Socket connection established after login
- [ ] No JavaScript errors in console

## 🛠️ Browser Developer Tools Testing

### Console Tab (F12):
**Look for:**
- ✅ "Socket connected: [socket-id]" after login
- ✅ API requests completing successfully
- ❌ No red error messages

### Network Tab:
**Check:**
- API calls to http://localhost:5000
- Socket.IO handshake
- WebSocket connections

### Application Tab:
**Verify:**
- JWT tokens stored properly
- Local storage contains user data

## 🧪 Step-by-Step Browser Test

1. **Start all services** (Redis + Backend + Frontend)
2. **Open browser** to http://localhost:3000
3. **Check health indicator** (should be green)
4. **Open Developer Tools** (F12)
5. **Go to login page**
6. **Try to register** a new user
7. **Try to login** with credentials
8. **Monitor console** for socket connections
9. **Test logout** functionality

## 🎯 Success Indicators

### Backend Working:
- Health endpoint returns valid JSON
- Clean server logs with Redis connected
- API endpoints respond properly

### Frontend Working:
- Page loads without errors
- Authentication flow works
- Socket.IO connects after login
- Real-time features ready

### Integration Working:
- Frontend can reach backend APIs
- Socket connections establish properly
- No CORS or authentication errors

## 🚨 Troubleshooting

### If Backend not accessible:
- Check if port 5000 is free: `netstat -ano | findstr :5000`
- Restart backend server
- Check Windows Firewall settings

### If Frontend not accessible:
- Check if port 3000 is free: `netstat -ano | findstr :3000`
- Clear browser cache
- Try incognito mode

### If Socket.IO not working:
- Check browser console for errors
- Verify backend Socket.IO endpoint
- Test authentication first