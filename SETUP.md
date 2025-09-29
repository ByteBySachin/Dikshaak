# Smart Public Transport System - Setup Guide

## 🚀 Quick Start

This comprehensive guide will help you set up and run the Smart Public Transport System on your local machine or deploy it to the cloud.

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (v18 or higher)
- **npm** (v8 or higher)
- **MongoDB** (v7.0 or higher)
- **Redis** (v7.0 or higher)
- **Docker** (optional, for containerized deployment)
- **Git**

## 🏗️ Project Structure

```
Smart Public Transport System/
├── frontend/                 # Next.js Web Application
│   ├── components/          # Reusable UI components
│   ├── pages/              # Application pages
│   ├── styles/             # Global styles and Tailwind config
│   └── package.json
├── backend/                 # Node.js API Server
│   ├── src/
│   │   ├── models/         # Database models
│   │   ├── routes/         # API routes
│   │   ├── middleware/     # Custom middleware
│   │   ├── config/         # Database and Redis config
│   │   └── utils/          # Utility functions
│   └── package.json
├── mobile/                  # React Native Mobile App
│   ├── screens/            # Mobile app screens
│   └── package.json
├── docker-compose.yml      # Docker orchestration
└── README.md
```

## 🛠️ Installation Steps

### 1. Clone the Repository

```bash
git clone <repository-url>
cd smart-transport-system
```

### 2. Install Dependencies

```bash
# Install root dependencies
npm install

# Install frontend dependencies
cd frontend
npm install

# Install backend dependencies
cd ../backend
npm install

# Install mobile dependencies (optional)
cd ../mobile
npm install
```

### 3. Environment Setup

#### Backend Environment Variables

Create a `.env` file in the `backend` directory:

```bash
cd backend
cp env.example .env
```

Edit the `.env` file with your configuration:

```env
NODE_ENV=development
PORT=5000

# Database
MONGODB_URI=mongodb://localhost:27017/smart-transport

# Redis
REDIS_URL=redis://localhost:6379

# JWT
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
JWT_EXPIRE=7d

# Frontend URL
FRONTEND_URL=http://localhost:3000

# SMS Gateway (Twilio)
TWILIO_ACCOUNT_SID=your-twilio-account-sid
TWILIO_AUTH_TOKEN=your-twilio-auth-token
TWILIO_PHONE_NUMBER=your-twilio-phone-number

# Email Service (Nodemailer)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASS=your-app-password

# Google Maps API
GOOGLE_MAPS_API_KEY=your-google-maps-api-key
```

#### Frontend Environment Variables

Create a `.env.local` file in the `frontend` directory:

```bash
cd frontend
touch .env.local
```

Add the following content:

```env
NEXT_PUBLIC_API_URL=http://localhost:5000/api
NEXT_PUBLIC_GOOGLE_MAPS_API_KEY=your-google-maps-api-key
```

### 4. Database Setup

#### MongoDB Setup

1. **Install MongoDB** (if not already installed):
   ```bash
   # macOS with Homebrew
   brew install mongodb-community
   
   # Ubuntu/Debian
   sudo apt-get install mongodb
   
   # Windows
   # Download from https://www.mongodb.com/try/download/community
   ```

2. **Start MongoDB**:
   ```bash
   # macOS/Linux
   mongod
   
   # Windows
   net start MongoDB
   ```

#### Redis Setup

1. **Install Redis** (if not already installed):
   ```bash
   # macOS with Homebrew
   brew install redis
   
   # Ubuntu/Debian
   sudo apt-get install redis-server
   
   # Windows
   # Download from https://github.com/microsoftarchive/redis/releases
   ```

2. **Start Redis**:
   ```bash
   # macOS/Linux
   redis-server
   
   # Windows
   redis-server.exe
   ```

### 5. Run the Application

#### Development Mode

Open three terminal windows and run:

**Terminal 1 - Backend:**
```bash
cd backend
npm run dev
```

**Terminal 2 - Frontend:**
```bash
cd frontend
npm run dev
```

**Terminal 3 - Mobile (Optional):**
```bash
cd mobile
npm start
```

#### Production Mode

```bash
# Build all applications
npm run build

# Start production servers
npm start
```

## 🌐 Access Points

Once running, you can access:

- **Frontend Web App**: http://localhost:3000
- **Backend API**: http://localhost:5000
- **API Documentation**: http://localhost:5000/api/docs
- **Health Check**: http://localhost:5000/health

## 🔐 Demo Credentials

Use these credentials to test the application:

### Admin Access
- **Email**: admin@example.com
- **Password**: admin123
- **Role**: Admin

### Driver Access
- **Email**: driver@example.com
- **Password**: driver123
- **Role**: Driver

### Passenger Access
- **Email**: passenger@example.com
- **Password**: passenger123
- **Role**: Passenger

## 🐳 Docker Deployment

### Using Docker Compose

1. **Build and start all services**:
   ```bash
   docker-compose up -d
   ```

2. **View logs**:
   ```bash
   docker-compose logs -f
   ```

3. **Stop services**:
   ```bash
   docker-compose down
   ```

### Individual Docker Builds

```bash
# Build backend
cd backend
docker build -t smart-transport-backend .

# Build frontend
cd ../frontend
docker build -t smart-transport-frontend .
```

## 📱 Mobile App Setup

### Prerequisites for Mobile Development

1. **Install Expo CLI**:
   ```bash
   npm install -g @expo/cli
   ```

2. **Install Expo Go app** on your mobile device from:
   - [iOS App Store](https://apps.apple.com/app/expo-go/id982107779)
   - [Google Play Store](https://play.google.com/store/apps/details?id=host.exp.exponent)

### Running the Mobile App

```bash
cd mobile
npm start
```

Scan the QR code with Expo Go to run the app on your device.

## 🔧 Configuration

### Database Configuration

The application uses MongoDB for primary data storage and Redis for caching. Key collections include:

- **Users**: Passenger, driver, conductor, and admin accounts
- **Buses**: Fleet information and real-time tracking data
- **Routes**: Bus routes, stops, and schedules
- **Trips**: Journey history and analytics

### API Endpoints

#### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/refresh` - Token refresh
- `POST /api/auth/logout` - User logout

#### Tracking
- `GET /api/tracking/buses` - Get all active buses
- `GET /api/tracking/buses/:id` - Get specific bus details
- `POST /api/tracking/buses/:id/location` - Update bus location
- `GET /api/tracking/nearby` - Get nearby buses

#### Users
- `GET /api/users/profile` - Get user profile
- `PUT /api/users/profile` - Update user profile
- `GET /api/users` - Get all users (admin only)

## 🚨 Troubleshooting

### Common Issues

1. **MongoDB Connection Error**:
   - Ensure MongoDB is running
   - Check connection string in `.env`
   - Verify MongoDB port (default: 27017)

2. **Redis Connection Error**:
   - Ensure Redis is running
   - Check Redis URL in `.env`
   - Verify Redis port (default: 6379)

3. **Port Already in Use**:
   - Change ports in `.env` files
   - Kill processes using the ports
   - Use `lsof -ti:PORT | xargs kill` (macOS/Linux)

4. **Build Errors**:
   - Clear node_modules and reinstall
   - Check Node.js version compatibility
   - Verify all dependencies are installed

### Logs and Debugging

- **Backend logs**: Check `backend/logs/` directory
- **Frontend logs**: Check browser console
- **Database logs**: Check MongoDB and Redis logs

## 🔒 Security Considerations

1. **Change default JWT secret** in production
2. **Use HTTPS** in production
3. **Implement rate limiting** for API endpoints
4. **Validate all inputs** on both client and server
5. **Use environment variables** for sensitive data
6. **Regular security updates** for dependencies

## 📊 Monitoring and Analytics

The system includes built-in monitoring for:

- **API Performance**: Response times and error rates
- **Database Performance**: Query execution times
- **Real-time Tracking**: Bus location accuracy
- **User Analytics**: Usage patterns and feedback

## 🚀 Production Deployment

### Cloud Deployment Options

1. **AWS**:
   - EC2 for application servers
   - RDS for MongoDB
   - ElastiCache for Redis
   - S3 for file storage

2. **Google Cloud**:
   - Compute Engine for servers
   - Cloud SQL for MongoDB
   - Memorystore for Redis
   - Cloud Storage for files

3. **Azure**:
   - Virtual Machines for servers
   - Cosmos DB for MongoDB
   - Redis Cache
   - Blob Storage for files

### Performance Optimization

1. **Enable compression** (gzip)
2. **Use CDN** for static assets
3. **Implement caching** strategies
4. **Database indexing** for queries
5. **Load balancing** for high traffic

## 📞 Support

For technical support or questions:

- **Email**: support@smarttransport.com
- **Documentation**: Check the `/docs` directory
- **Issues**: Create GitHub issues for bugs
- **Emergency**: Use the SOS button in the app

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

**Happy Coding! 🚌✨**

