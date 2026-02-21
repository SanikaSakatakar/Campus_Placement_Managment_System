# 🚀 Quick Start Guide - Campus Placement System

## 📦 What You Have

A complete full-stack Campus Placement Management System with:
- ✅ 56 files total
- ✅ Spring Boot backend (Java)
- ✅ React frontend (Modern UI)
- ✅ MySQL database schema
- ✅ Complete documentation

## ⚡ 5-Minute Setup

### Step 1: Database Setup (2 minutes)
```bash
# Login to MySQL
mysql -u root -p

# Create database
CREATE DATABASE campus_placement_db;
exit;
```

### Step 2: Backend Setup (2 minutes)
```bash
# Navigate to backend
cd backend

# Update database credentials in:
# src/main/resources/application.properties
# Change username and password to match your MySQL

# Build and run
mvn clean install
mvn spring-boot:run
```
✅ Backend running at http://localhost:8080

### Step 3: Frontend Setup (1 minute)
```bash
# In a new terminal
cd frontend

# Install and run
npm install
npm run dev
```
✅ Frontend running at http://localhost:3000

## 🎯 First Steps After Setup

1. **Open browser** → http://localhost:3000
2. **Register as Student** → Fill the form
3. **Register as Company** → In another tab/incognito
4. **Create Admin** (Optional) → Via MySQL:
   ```sql
   -- Insert admin user (password will be 'admin123' after bcrypt)
   INSERT INTO students (name, email, password, branch, cgpa, role, created_at, updated_at)
   VALUES ('Admin', 'admin@campus.com', 
   '$2a$10$dXJ3SW6G7P2aQE7pLh8laeXo.mVQmP3p.3JVvQKYzVvGbRYNvNwUC', 
   'Admin', 10.0, 'ADMIN', NOW(), NOW());
   ```
5. **Login as Admin** → Approve the company
6. **Company posts job** → Create a job posting
7. **Student applies** → View and apply to jobs
8. **Company manages** → Shortlist, schedule interviews

## 📂 Project Structure Quick Reference

```
campus-placement-system/
├── backend/              # Spring Boot API
│   ├── src/main/java/
│   │   └── com/placement/
│   │       ├── controller/   # API endpoints
│   │       ├── service/      # Business logic
│   │       ├── model/        # Database entities
│   │       └── config/       # Security setup
│   └── pom.xml              # Dependencies
│
├── frontend/             # React UI
│   ├── src/
│   │   ├── pages/        # All pages (12 total)
│   │   ├── components/   # Navbar, etc.
│   │   ├── services/     # API calls
│   │   └── assets/       # CSS
│   └── package.json
│
├── README.md            # Full documentation
├── PROJECT_SUMMARY.md   # Feature overview
└── setup.sh            # Automated setup script
```

## 🎨 Main Features Available

### Students Can:
- Register and create detailed profiles
- View jobs they're eligible for
- Apply to jobs with one click
- Track application status
- View interview schedules

### Companies Can:
- Register (needs admin approval)
- Post job openings
- View applicants
- Shortlist candidates
- Schedule interviews
- Select final candidates

### Admins Can:
- Approve company registrations
- View all students
- See placement statistics
- Monitor the system

## 🌈 UI Pages You'll See

1. **Landing Page** - Beautiful gradient hero section
2. **Login** - Single login for all user types
3. **Student/Company Registration** - Detailed forms
4. **Dashboards** - Role-specific with stats
5. **Job Listings** - Filtered eligible jobs
6. **Application Tracking** - Status monitoring
7. **Job Management** - For companies
8. **Admin Panel** - Approvals and stats

## 🎯 Test Flow

```
1. Student registers → john@test.com
2. Company registers → tech@company.com
3. Admin approves company
4. Company posts job (Min CGPA: 7.0, Branch: Computer Science)
5. Student applies to job
6. Company sees application
7. Company shortlists/schedules interview
8. Company selects candidate
9. Student sees "SELECTED" status
```

## 🔐 Security Features

- ✅ JWT token authentication
- ✅ Password encryption (BCrypt)
- ✅ Role-based access control
- ✅ Protected API endpoints
- ✅ CORS configuration

## 📱 Responsive Design

Works perfectly on:
- 💻 Desktop (1920px+)
- 💻 Laptop (1366px+)
- 📱 Tablet (768px+)
- 📱 Mobile (375px+)

## 🐛 Common Issues & Solutions

### Backend won't start
- Check MySQL is running: `sudo systemctl status mysql`
- Verify database credentials in application.properties
- Ensure Java 17+ is installed: `java -version`

### Frontend won't start
- Delete node_modules and reinstall: `rm -rf node_modules && npm install`
- Check Node.js version: `node -v` (should be 16+)

### Can't login
- Check backend is running on port 8080
- Clear browser cache and localStorage
- Verify user exists in database

### Jobs not showing
- Make sure company is approved (admin)
- Check job is marked as active
- Verify student meets eligibility criteria

## 📊 Database Tables

- `students` - Student profiles
- `companies` - Company profiles
- `jobs` - Job postings
- `applications` - Student applications
- `interviews` - Interview schedules

## 🎉 You're Ready!

Your complete campus placement system is ready to use. Enjoy exploring all the features!

**Need Help?** Check README.md for detailed documentation.

**Want to Customize?** All code is well-organized and commented.

**Ready to Deploy?** See deployment section in README.md.

---

Made with ❤️ using Spring Boot + React + MySQL
