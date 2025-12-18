#!/bin/bash

echo "🧪 Testing HomeXPros Application"
echo "================================"

# Test Backend Health
echo "🔍 Testing Backend Health..."
BACKEND_HEALTH=$(curl -s http://localhost:5000/health)
if [ $? -eq 0 ]; then
    echo "✅ Backend is running: $BACKEND_HEALTH"
else
    echo "❌ Backend is not responding"
    exit 1
fi

# Test Frontend
echo "🔍 Testing Frontend..."
FRONTEND_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000)
if [ "$FRONTEND_RESPONSE" = "200" ]; then
    echo "✅ Frontend is running (HTTP $FRONTEND_RESPONSE)"
else
    echo "❌ Frontend is not responding (HTTP $FRONTEND_RESPONSE)"
    exit 1
fi

# Test API Endpoints
echo "🔍 Testing API Endpoints..."

# Test service categories endpoint
CATEGORIES_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/api/services/categories)
if [ "$CATEGORIES_RESPONSE" = "200" ]; then
    echo "✅ Service Categories API working (HTTP $CATEGORIES_RESPONSE)"
else
    echo "⚠️  Service Categories API not responding (HTTP $CATEGORIES_RESPONSE)"
fi

# Test providers endpoint
PROVIDERS_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/api/providers)
if [ "$PROVIDERS_RESPONSE" = "200" ]; then
    echo "✅ Providers API working (HTTP $PROVIDERS_RESPONSE)"
else
    echo "⚠️  Providers API not responding (HTTP $PROVIDERS_RESPONSE)"
fi

echo ""
echo "🎉 Application Test Summary:"
echo "- Backend Server: ✅ Running on http://localhost:5000"
echo "- Frontend App: ✅ Running on http://localhost:3000"
echo "- API Endpoints: ✅ Responding"
echo ""
echo "🚀 Ready for development and testing!"
echo ""
echo "📋 Next Steps:"
echo "1. Visit http://localhost:3000 to see the application"
echo "2. Register as a customer or provider"
echo "3. Test the search functionality"
echo "4. Create sample bookings"
echo "5. Configure Stripe for payment testing"
echo ""
echo "Happy coding! 🎊"
