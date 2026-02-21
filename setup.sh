#!/bin/bash

echo "🎓 Campus Placement System - Setup Script"
echo "=========================================="
echo ""

# Check for MySQL
echo "📊 Checking MySQL..."
if ! command -v mysql &> /dev/null; then
    echo "❌ MySQL not found. Please install MySQL 8.0+"
    exit 1
fi
echo "✅ MySQL found"

# Check for Java
echo "☕ Checking Java..."
if ! command -v java &> /dev/null; then
    echo "❌ Java not found. Please install Java 17+"
    exit 1
fi
echo "✅ Java found"

# Check for Node.js
echo "📦 Checking Node.js..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js 16+"
    exit 1
fi
echo "✅ Node.js found"

# Create database
echo ""
echo "🗄️  Creating MySQL database..."
echo "Please enter your MySQL root password when prompted."
mysql -u root -p << EOF
CREATE DATABASE IF NOT EXISTS campus_placement_db;
SHOW DATABASES LIKE 'campus_placement_db';
EOF

if [ $? -eq 0 ]; then
    echo "✅ Database created successfully"
else
    echo "❌ Database creation failed"
    exit 1
fi

# Setup backend
echo ""
echo "🔧 Setting up backend..."
cd backend
if [ -f "pom.xml" ]; then
    echo "Building backend..."
    mvn clean install -DskipTests
    if [ $? -eq 0 ]; then
        echo "✅ Backend built successfully"
    else
        echo "❌ Backend build failed"
        exit 1
    fi
else
    echo "❌ pom.xml not found"
    exit 1
fi
cd ..

# Setup frontend
echo ""
echo "🎨 Setting up frontend..."
cd frontend
if [ -f "package.json" ]; then
    echo "Installing frontend dependencies..."
    npm install
    if [ $? -eq 0 ]; then
        echo "✅ Frontend dependencies installed"
    else
        echo "❌ Frontend installation failed"
        exit 1
    fi
else
    echo "❌ package.json not found"
    exit 1
fi
cd ..

echo ""
echo "✅ Setup completed successfully!"
echo ""
echo "📝 Next steps:"
echo "1. Update database credentials in backend/src/main/resources/application.properties"
echo "2. Start backend: cd backend && mvn spring-boot:run"
echo "3. Start frontend: cd frontend && npm run dev"
echo "4. Access the application at http://localhost:3000"
echo ""
echo "🎉 Happy coding!"
