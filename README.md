# HomeXPros - Home Services Marketplace

HomeXPros is a comprehensive web application designed as a seamless home services marketplace, connecting service providers with customers seeking various services such as electrical work, hair spa treatments, house cleaning, plumbing, and more.

## Tech Stack

### Frontend

- **Framework**: React 19.1.0 + TypeScript
- **Styling**: Tailwind CSS 3.3.0 with custom scrollbar
- **State Management**: Redux Toolkit 2.8.2
- **Form Handling**: React Hook Form 7.59.0 with Yup validation
- **UI Components**: Headless UI 2.2.4 + Heroicons 2.2.0
- **HTTP Client**: Axios 1.10.0
- **Notifications**: React Hot Toast 2.5.2
- **Payment**: Stripe React 3.7.0
- **Routing**: React Router DOM 7.6.3

### Backend

- **Runtime**: Node.js + TypeScript 5.3.3
- **Framework**: Express.js 4.18.2
- **Database**: MongoDB with Mongoose 8.0.3
- **Authentication**: JWT (jsonwebtoken 9.0.2)
- **Email Service**: Nodemailer 6.10.1 + Brevo SMTP
- **Payment Processing**: Stripe 14.9.0
- **File Upload**: Multer 1.4.5
- **Security**: Helmet 7.1.0, CORS 2.8.5, Rate Limiting
- **Logging**: Winston 3.11.0
- **Validation**: Express Validator 7.0.1
- **Development**: Nodemon 3.0.2, ts-node 10.9.2

## Project Structure

```
urban-aid-q/
├── client/                 # React frontend application
│   ├── src/
│   │   ├── components/     # Reusable UI components
│   │   ├── pages/         # Page components
│   │   ├── store/         # Redux store and slices
│   │   ├── hooks/         # Custom React hooks
│   │   ├── utils/         # Utility functions
│   │   └── types/         # TypeScript type definitions
│   ├── public/            # Static assets
│   └── build/             # Production build output
└── server/                # Node.js backend application
    ├── src/               # TypeScript source code
    │   ├── controllers/   # Request handlers
    │   ├── models/        # MongoDB schemas
    │   ├── routes/        # API route definitions
    │   ├── middleware/    # Custom middleware
    │   ├── services/      # Business logic services
    │   ├── utils/         # Utility functions
    │   ├── config/        # Configuration files
    │   ├── scripts/       # Database seeding scripts
    │   └── types/         # TypeScript type definitions
    ├── dist/              # Compiled JavaScript output
    └── uploads/           # File upload storage
```

## Core Features

### For Service Providers

- **Registration & Verification**: Multi-step provider onboarding with document verification
- **Provider Dashboard**: Comprehensive analytics and booking management
- **Service Management**: Create, update, and manage service offerings
- **OTP-Based Service Verification**: Secure service start verification system
- **Financial Management**: Stripe integration for payment processing
- **Reviews & Ratings**: Customer feedback management system
- **Transaction History**: Complete financial transaction tracking
- **Real-time Notifications**: In-app and email notifications

### For Customers

- **Service Discovery**: Location-based search with Canadian cities integration
- **Provider Profiles**: Detailed provider information with ratings and reviews
- **Smart Booking System**: Multi-step booking with priority options
- **Real-time Status Updates**: Live booking status tracking
- **Secure Payment Processing**: Stripe-powered payment system
- **User Dashboard**: Booking history and account management
- **Email Notifications**: Automated email updates for all booking stages

### Admin Panel

- **User Management**: Complete user and provider administration
- **Service Category Management**: Dynamic service category system
- **Verification System**: Provider verification approval workflow
- **Platform Analytics**: Comprehensive business intelligence dashboard
- **Content Management**: System-wide content and settings management

## Booking Flow & Status Management

### Booking Statuses

1. **requested** - Initial booking request from customer
2. **pending** - Provider accepted, OTP sent to customer
3. **ongoing** - OTP verified, service in progress
4. **request_payment** - Service completed, payment requested
5. **payment_pending** - Customer initiated payment
6. **completed** - Payment processed, booking finished
7. **rejected** - Provider declined the booking
8. **cancelled** - Booking cancelled by either party

### OTP Verification System

- **6-digit OTP** generated when provider accepts booking
- **10-minute expiry** for security
- **Email delivery** to customer with service details
- **Resend functionality** for expired OTPs
- **Secure verification** before service start

## API Endpoints

### Authentication

- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout
- `GET /api/auth/me` - Get current user

### Bookings

- `POST /api/bookings` - Create new booking
- `GET /api/bookings` - Get user bookings (with pagination)
- `GET /api/bookings/:id` - Get specific booking
- `PATCH /api/bookings/:id/status` - Update booking status
- `PUT /api/bookings/:id/accept` - Provider accepts booking (generates OTP)
- `PUT /api/bookings/:id/reject` - Provider rejects booking
- `PUT /api/bookings/:id/verify-otp-start` - Verify OTP and start service
- `PUT /api/bookings/:id/resend-otp` - Resend OTP to customer
- `PUT /api/bookings/:id/complete-service` - Complete service and request payment
- `PUT /api/bookings/:id/process-payment` - Process customer payment
- `PUT /api/bookings/:id/cancel` - Cancel booking
- `GET /api/bookings/stats` - Get booking statistics

### Services

- `GET /api/services` - Get all services
- `POST /api/services` - Create new service (Provider)
- `PUT /api/services/:id` - Update service (Provider)
- `DELETE /api/services/:id` - Delete service (Provider)

### Providers

- `POST /api/providers/register` - Provider registration
- `GET /api/providers/profile` - Get provider profile
- `PUT /api/providers/profile` - Update provider profile
- `GET /api/providers/stats` - Get provider statistics

### Notifications

- `GET /api/bookings/notifications` - Get user notifications
- `PATCH /api/bookings/notifications/:id/read` - Mark notification as read
- `PATCH /api/bookings/notifications/read-all` - Mark all notifications as read

## Email System

### Automated Email Notifications

- **Booking Confirmation** - Sent to customer upon booking creation
- **Booking Accepted** - Sent when provider accepts booking
- **Service Start OTP** - Contains 6-digit verification code
- **Payment Request** - Sent when provider requests payment
- **Service Completed** - Final confirmation email
- **Status Updates** - Real-time booking status changes

### Email Configuration (Brevo SMTP)

- **SMTP Host**: smtp-relay.brevo.com
- **Port**: 587 (TLS)
- **Authentication**: Username/Password based
- **Templates**: HTML email templates with responsive design

## Development Setup

### Prerequisites

- Node.js 18+ and npm
- MongoDB 6.0+
- TypeScript 5.3+

### Backend Setup

1. **Navigate to server directory**:

   ```bash
   cd server
   ```

2. **Install dependencies**:

   ```bash
   npm install
   ```

3. **Environment Configuration**:

   ```bash
   cp .env.example .env
   # Update the values in .env file
   ```

4. **Database Seeding** (Optional):

   ```bash
   npm run seed:categories
   npm run seed
   ```

5. **Development Server**:

   ```bash
   npm run dev
   ```

6. **Production Build**:
   ```bash
   npm run build
   npm start
   ```

### Frontend Setup

1. **Navigate to client directory**:

   ```bash
   cd client
   ```

2. **Install dependencies**:

   ```bash
   npm install
   ```

3. **Environment Configuration**:

   ```bash
   cp .env.example .env
   # Update the values in .env file
   ```

4. **Development Server**:

   ```bash
   npm start
   ```

5. **Production Build**:
   ```bash
   npm run build
   ```

## Environment Variables

### Server (.env)

```env
# Server Configuration
PORT=5000
NODE_ENV=development

# Database
MONGODB_URI=mongodb://localhost:27017/urban-aid

# JWT Authentication
JWT_SECRET=your-super-secret-jwt-key-here
JWT_EXPIRES_IN=7d

# Stripe Payment Processing
STRIPE_SECRET_KEY=sk_test_your_stripe_secret_key
STRIPE_PUBLISHABLE_KEY=pk_test_your_stripe_publishable_key
STRIPE_WEBHOOK_SECRET=whsec_your_webhook_secret

# Email Configuration (Brevo)
EMAIL_HOST=smtp-relay.brevo.com
EMAIL_PORT=587
EMAIL_USER=your-brevo-email@example.com
EMAIL_PASS=your-brevo-api-key
FROM_EMAIL=noreply@urbanaid.com

# File Upload
MAX_FILE_SIZE=5242880
UPLOAD_PATH=uploads/

# Rate Limiting
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100

# Platform Configuration
PLATFORM_COMMISSION_RATE=0.10
CLIENT_URL=http://localhost:3000
```

### Client (.env)

```env
REACT_APP_API_URL=http://localhost:5000/api
REACT_APP_STRIPE_PUBLISHABLE_KEY=pk_test_your_stripe_publishable_key
```

## Available Scripts

### Backend Scripts

- `npm run dev` - Start development server with hot reload
- `npm run build` - Build TypeScript to JavaScript
- `npm start` - Start production server
- `npm run clean` - Clean build directory
- `npm test` - Run test suite
- `npm run lint` - Run ESLint
- `npm run lint:fix` - Fix ESLint issues
- `npm run seed` - Seed database with sample data
- `npm run seed:categories` - Seed service categories

### Frontend Scripts

- `npm start` - Start development server
- `npm run build` - Create production build
- `npm test` - Run test suite
- `npm run eject` - Eject from Create React App

## Security Features

- **JWT Authentication** with secure token management
- **Rate Limiting** to prevent API abuse
- **Input Validation** using Express Validator
- **CORS Configuration** for cross-origin requests
- **Helmet.js** for security headers
- **Password Hashing** using bcryptjs
- **File Upload Security** with size and type restrictions
- **OTP Verification** for service start security

## Database Models

### Core Models

- **User** - Customer and provider user accounts
- **Provider** - Extended provider profiles with business information
- **Service** - Service offerings with pricing and details
- **Booking** - Complete booking lifecycle with OTP verification
- **Payment** - Payment transaction records
- **Review** - Customer reviews and ratings
- **ServiceCategory** - Service categorization system

### Key Features

- **MongoDB Indexes** for optimized queries
- **Virtual Population** for related data
- **Schema Validation** with custom validators
- **Timestamps** for audit trails

## Deployment

### Production Considerations

- **Environment Variables** properly configured
- **Database Connection** with connection pooling
- **File Storage** configured for production
- **Email Service** with production SMTP settings
- **Payment Gateway** with live Stripe keys
- **SSL/TLS** certificates for HTTPS
- **Process Management** with PM2 or similar
- **Monitoring** and logging setup

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Run linting and tests
6. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please contact the HomeXPros development team.
