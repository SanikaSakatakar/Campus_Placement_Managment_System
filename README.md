# Campus Placement Management System project

A complete full-stack web application for managing campus placements with an attractive, modern UI.

## 🎯 Features 

### For Students
- ✅ Register and create profile with skills, projects, certifications
- 📄 **Upload and manage resume (PDF)**
- 📋 View eligible jobs based on CGPA, branch, and skills
- 🎯 Smart eligibility matching algorithm
- 📝 One-click job applications
- 📊 Track application status in real-time
- 📅 **View and manage interview schedules**
- 🔔 See upcoming and past interviews
- 📍 Access interview location/meeting links

### For Companies
- 🏢 Company registration with approval workflow
- 📝 Post job openings with detailed criteria
- 👥 View and manage applicants
- ✅ Shortlist, schedule interviews, and select candidates
- 📅 **Schedule interviews with date, time, and mode (Online/Offline/Hybrid)**
- 💬 Add interview instructions for candidates
- 📊 Dashboard with recruitment analytics

### For Admin
- 👨‍💼 Approve/reject company registrations
- 📊 View comprehensive placement statistics
- 👥 Manage students and companies
- 📈 Generate branch-wise placement reports
- 🏆 **View top recruiting companies**
- 📉 **Application status breakdown analytics**

## 🛠️ Tech Stack

### Backend
- **Framework:** Spring Boot 3.2.0
- **Language:** Java 17
- **Database:** MySQL 8.0
- **Security:** Spring Security + JWT
- **ORM:** JPA/Hibernate
- **Build Tool:** Maven

### Frontend of project
- **Framework:** React 18
- **Build Tool:** Vite
- **Routing:** React Router v6
- **HTTP Client:** Axios
- **Styling:** Custom CSS (Modern gradient design)

## 📁 a complete Project Structure

```
campus-placement-system/
├── backend/
│   ├── src/main/java/com/placement/
│   │   ├── config/          # Security & App configuration
│   │   ├── controller/      # REST API controllers
│   │   ├── dto/            # Data Transfer Objects
│   │   ├── model/          # JPA Entities
│   │   ├── repository/     # Database repositories
│   │   ├── security/       # JWT filters
│   │   ├── service/        # Business logic
│   │   └── util/           # Utility classes
│   ├── src/main/resources/
│   │   └── application.properties
│   └── pom.xml
│
└── frontend/
    ├── src/
    │   ├── assets/styles/  # CSS files
    │   ├── components/     # Reusable components
    │   ├── pages/         # Page components
    │   ├── services/      # API services
    │   ├── App.jsx        # Main app component
    │   └── main.jsx       # Entry point
    ├── index.html
    ├── package.json
    └── vite.config.js
```

## 🚀 Installation & Setup of project

### Prerequisites
- Java 17 or higher
- Node.js 16+ and npm
- MySQL 8.0
- Git

### Backend Setup of project

1. **Create MySQL Database**
```sql
CREATE DATABASE campus_placement_db;
```

2. **Configure Database**
Edit `backend/src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/campus_placement_db
spring.datasource.username=YOUR_MYSQL_USERNAME
spring.datasource.password=YOUR_MYSQL_PASSWORD
```

3. **Build and Run Backend**
```bash
cd backend
mvn clean install
mvn spring-boot:run
```

Backend will start at: `http://localhost:8080`

### Frontend Setup

1. **Install Dependencies**
```bash
cd frontend
npm install
```

2. **Run Development Server**
```bash
npm run dev
```

Frontend will start at: `http://localhost:3000`

## 📝 API Endpoints

### Authentication
- `POST /api/auth/register/student` - Student registration
- `POST /api/auth/register/company` - Company registration
- `POST /api/auth/login` - User login

### Student APIs
- `GET /api/student/profile` - Get student profile
- `PUT /api/student/profile` - Update profile
- `POST /api/student/apply/{jobId}` - Apply to job
- `GET /api/student/applications` - View applications

### Job APIs
- `GET /api/jobs` - List all active jobs
- `GET /api/jobs/{id}` - Get job details
- `GET /api/jobs/eligible` - Get eligible jobs for student

### Company APIs
- `GET /api/company/profile` - Get company profile
- `POST /api/company/jobs` - Create job posting
- `GET /api/company/jobs` - Get company's jobs
- `PUT /api/company/jobs/{id}` - Update job
- `DELETE /api/company/jobs/{id}` - Delete job
- `GET /api/company/applications/{jobId}` - Get job applicants
- `PUT /api/company/applications/{id}/status` - Update application status

### Admin APIs
- `GET /api/admin/companies/pending` - Get pending approvals
- `PUT /api/admin/companies/{id}/approve` - Approve company
- `GET /api/admin/stats` - Get placement statistics
- `GET /api/admin/students` - Get all students
- `GET /api/admin/companies` - Get all companies

## 🎨 UI Features

- **Modern Gradient Design** - Beautiful purple gradient theme
- **Responsive Layout** - Works on all screen sizes
- **Card-based UI** - Clean, organized information display
- **Interactive Dashboards** - Real-time stats and analytics
- **Status Badges** - Color-coded application status
- **Smooth Animations** - Hover effects and transitions

## 🔐 Security Features

- **JWT Authentication** - Secure token-based authentication
- **Password Encryption** - BCrypt password hashing
- **Role-based Access Control** - Different permissions for Student/Company/Admin
- **CORS Configuration** - Secure cross-origin requests
- **Protected Routes** - Frontend route guards

## 👥 Default Users (For Testing)

After setting up, you can create users through the registration forms.

### Create Admin User (via MySQL)
```sql
INSERT INTO students (name, email, password, branch, cgpa, role, created_at, updated_at)
VALUES ('Admin', 'admin@campus.com', '$2a$10$encoded_password_here', 'Admin', 10.0, 'ADMIN', NOW(), NOW());
```

## 📊 Database Schema

### Main Tables
- **students** - Student information and profiles
- **companies** - Company information and approval status
- **jobs** - Job postings with eligibility criteria
- **applications** - Student job applications
- **interviews** - Interview schedules

### Key Relationships
- Company → Jobs (One-to-Many)
- Student → Applications (One-to-Many)
- Job → Applications (One-to-Many)
- Application → Interview (One-to-One)

## ✨ Latest Features (v1.1.0)

### 📄 Resume Management
- Upload PDF resumes (max 5MB)
- Automatic file storage with UUID naming
- Resume auto-attached to applications
- Old resume automatic deletion

### 📅 Interview Scheduling
- Schedule interviews with date/time
- Support for Online, Offline, Hybrid modes
- Meeting links for online interviews
- Venue details for offline interviews
- Panel name and interview instructions
- Interview completion tracking with feedback
- Separate views for upcoming vs past interviews

### 📊 Enhanced Analytics
- Application status breakdown (Applied, Shortlisted, Interview, Selected, Rejected)
- Top 5 recruiting companies ranking
- Branch-wise placement statistics
- Placement percentage calculation
- System-wide metrics dashboard

### 🎨 UI Enhancements
- Resume upload component with progress
- Interview scheduling modal
- Beautiful interview cards with mode-specific details
- Color-coded interview modes
- Responsive date/time display
- Enhanced admin analytics dashboard

## 🧪 Testing

### Backend Testing
```bash
cd backend
mvn test
```

### Frontend Testing
Test manually by:
1. Registering as student and company
2. Admin approving the company
3. Company posting jobs
4. Student viewing and applying to jobs
5. Company managing applications

## 🚀 Deployment

### Backend Deployment (Heroku/Railway)
```bash
mvn clean package
# Deploy the generated JAR file
```

### Frontend Deployment (Vercel/Netlify)
```bash
npm run build
# Deploy the dist folder
```

### Environment Variables
Backend:
- `SPRING_DATASOURCE_URL`
- `SPRING_DATASOURCE_USERNAME`
- `SPRING_DATASOURCE_PASSWORD`
- `JWT_SECRET`

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📧 Contact

For any queries or support, please contact the development team.

## 📄 License

This project is licensed under the MIT License.

---

## 📚 Additional Documentation

- **[API Documentation](API_DOCUMENTATION.md)** - Complete API reference with examples
- **[Changelog](CHANGELOG.md)** - Latest features and updates
- **[Quick Start Guide](QUICK_START.md)** - 5-minute setup guide
- **[Project Summary](PROJECT_SUMMARY.md)** - Complete feature overview

---

**Version:** 1.1.0  
**Total Files:** 65+  
**API Endpoints:** 40+  
**Status:** ✅ Production Ready

**Note:** This is a complete, production-ready campus placement management system with modern architecture and best practices. All features are fully functional and tested.
