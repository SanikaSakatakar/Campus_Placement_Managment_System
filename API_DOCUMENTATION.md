# 📚 Complete API Documentation - Campus Placement System

## Base URL
```
http://localhost:8080/api
```

## Authentication
Most endpoints require JWT token in the header:
```
Authorization: Bearer <your_jwt_token>
```

---

## 🔐 Authentication APIs

### 1. Student Registration
```http
POST /auth/register/student
Content-Type: application/json
```

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123",
  "branch": "Computer Science",
  "cgpa": 8.5,
  "skills": "Java, Python, React",
  "projects": "E-commerce website, Chat application",
  "certifications": "AWS Certified",
  "phone": "+1234567890",
  "address": "123 Main St, City",
  "passingYear": 2024
}
```

**Response:** (200 OK)
```json
{
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "type": "Bearer",
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com",
  "role": "STUDENT"
}
```

---

### 2. Company Registration
```http
POST /auth/register/company
Content-Type: application/json
```

**Request Body:**
```json
{
  "name": "John Smith",
  "email": "recruiter@techcorp.com",
  "password": "password123",
  "companyName": "TechCorp Inc",
  "description": "Leading technology company",
  "website": "https://techcorp.com",
  "location": "San Francisco, CA",
  "industry": "Technology",
  "companySize": "501-1000"
}
```

**Response:** (200 OK)
```json
{
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "type": "Bearer",
  "id": 2,
  "name": "John Smith",
  "email": "recruiter@techcorp.com",
  "role": "COMPANY"
}
```

---

### 3. Login
```http
POST /auth/login
Content-Type: application/json
```

**Request Body:**
```json
{
  "email": "john@example.com",
  "password": "password123"
}
```

**Response:** (200 OK)
```json
{
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "type": "Bearer",
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com",
  "role": "STUDENT"
}
```

---

## 👨‍🎓 Student APIs

### 1. Get Student Profile
```http
GET /student/profile
Authorization: Bearer <student_token>
```

**Response:** (200 OK)
```json
{
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com",
  "branch": "Computer Science",
  "cgpa": 8.5,
  "skills": "Java, Python, React",
  "projects": "E-commerce website",
  "certifications": "AWS Certified",
  "phone": "+1234567890",
  "address": "123 Main St",
  "passingYear": 2024,
  "resumePath": "abc123-resume.pdf",
  "createdAt": "2024-01-01T10:00:00",
  "updatedAt": "2024-01-15T14:30:00"
}
```

---

### 2. Update Student Profile
```http
PUT /student/profile
Authorization: Bearer <student_token>
Content-Type: application/json
```

**Request Body:**
```json
{
  "name": "John Doe Updated",
  "branch": "Computer Science",
  "cgpa": 8.7,
  "skills": "Java, Python, React, Node.js",
  "projects": "E-commerce website, Chat app",
  "certifications": "AWS Certified, Oracle Java",
  "phone": "+1234567890",
  "address": "456 New St",
  "passingYear": 2024
}
```

**Response:** (200 OK) - Updated student object

---

### 3. Upload Resume
```http
POST /student/upload-resume
Authorization: Bearer <student_token>
Content-Type: multipart/form-data
```

**Form Data:**
```
file: <resume.pdf>
```

**Response:** (200 OK)
```
"Resume uploaded successfully: uuid-filename.pdf"
```

---

### 4. Apply for Job
```http
POST /student/apply/{jobId}
Authorization: Bearer <student_token>
```

**Response:** (200 OK)
```json
{
  "id": 1,
  "student": { ... },
  "job": { ... },
  "status": "APPLIED",
  "appliedDate": "2024-01-20T10:00:00",
  "notes": null
}
```

---

### 5. Get My Applications
```http
GET /student/applications
Authorization: Bearer <student_token>
```

**Response:** (200 OK)
```json
[
  {
    "id": 1,
    "job": {
      "id": 1,
      "title": "Software Engineer",
      "company": {
        "companyName": "TechCorp Inc"
      },
      "packageOffered": "10-12 LPA",
      "location": "Bangalore"
    },
    "status": "APPLIED",
    "appliedDate": "2024-01-20T10:00:00"
  }
]
```

---

## 💼 Job APIs

### 1. Get All Active Jobs
```http
GET /jobs
Authorization: Bearer <token>
```

**Response:** (200 OK)
```json
[
  {
    "id": 1,
    "title": "Software Engineer",
    "description": "We are looking for...",
    "minCgpa": 7.0,
    "branches": "Computer Science, Information Technology",
    "skillsRequired": "Java, Spring Boot, React",
    "packageOffered": "10-12 LPA",
    "location": "Bangalore",
    "jobType": "Full-time",
    "deadline": "2024-02-28",
    "active": true,
    "postedDate": "2024-01-15T09:00:00",
    "company": {
      "id": 2,
      "companyName": "TechCorp Inc"
    }
  }
]
```

---

### 2. Get Job by ID
```http
GET /jobs/{id}
Authorization: Bearer <token>
```

**Response:** (200 OK) - Single job object

---

### 3. Get Eligible Jobs (Student)
```http
GET /jobs/eligible
Authorization: Bearer <student_token>
```

**Response:** (200 OK) - Array of jobs matching student's profile

---

## 🏢 Company APIs

### 1. Get Company Profile
```http
GET /company/profile
Authorization: Bearer <company_token>
```

**Response:** (200 OK)
```json
{
  "id": 2,
  "name": "John Smith",
  "email": "recruiter@techcorp.com",
  "companyName": "TechCorp Inc",
  "description": "Leading technology company",
  "approved": true,
  "website": "https://techcorp.com",
  "location": "San Francisco",
  "industry": "Technology",
  "companySize": "501-1000"
}
```

---

### 2. Create Job Posting
```http
POST /company/jobs
Authorization: Bearer <company_token>
Content-Type: application/json
```

**Request Body:**
```json
{
  "title": "Senior Software Engineer",
  "description": "We are seeking an experienced software engineer...",
  "minCgpa": 7.5,
  "branches": "Computer Science, Information Technology, Electronics",
  "skillsRequired": "Java, Spring Boot, Microservices, AWS",
  "packageOffered": "15-20 LPA",
  "location": "Bangalore",
  "jobType": "Full-time",
  "deadline": "2024-03-31",
  "active": true
}
```

**Response:** (200 OK) - Created job object

---

### 3. Get Company's Jobs
```http
GET /company/jobs
Authorization: Bearer <company_token>
```

**Response:** (200 OK) - Array of company's job postings

---

### 4. Update Job
```http
PUT /company/jobs/{id}
Authorization: Bearer <company_token>
Content-Type: application/json
```

**Request Body:** Same as create job

**Response:** (200 OK) - Updated job object

---

### 5. Delete Job
```http
DELETE /company/jobs/{id}
Authorization: Bearer <company_token>
```

**Response:** (200 OK)
```
"Job deleted successfully"
```

---

### 6. Get Job Applicants
```http
GET /company/applications/{jobId}
Authorization: Bearer <company_token>
```

**Response:** (200 OK)
```json
[
  {
    "id": 1,
    "student": {
      "id": 1,
      "name": "John Doe",
      "email": "john@example.com",
      "branch": "Computer Science",
      "cgpa": 8.5,
      "skills": "Java, Python, React"
    },
    "job": { ... },
    "status": "APPLIED",
    "appliedDate": "2024-01-20T10:00:00"
  }
]
```

---

### 7. Update Application Status
```http
PUT /company/applications/{applicationId}/status
Authorization: Bearer <company_token>
Content-Type: application/json
```

**Request Body:**
```json
"SHORTLISTED"
```
*Possible values: APPLIED, SHORTLISTED, INTERVIEW_SCHEDULED, SELECTED, REJECTED*

**Response:** (200 OK) - Updated application object

---

## 📅 Interview APIs

### 1. Schedule Interview
```http
POST /interview/schedule/{applicationId}
Authorization: Bearer <company_token>
Content-Type: application/json
```

**Request Body:**
```json
{
  "interviewDate": "2024-02-15T14:00:00",
  "mode": "ONLINE",
  "location": null,
  "meetingLink": "https://meet.google.com/abc-defg-hij",
  "panelName": "Technical Panel",
  "instructions": "Please keep your camera on and have ID ready"
}
```
*Mode options: ONLINE, OFFLINE, HYBRID*

**Response:** (200 OK)
```json
{
  "id": 1,
  "application": { ... },
  "interviewDate": "2024-02-15T14:00:00",
  "mode": "ONLINE",
  "meetingLink": "https://meet.google.com/abc-defg-hij",
  "panelName": "Technical Panel",
  "instructions": "Please keep your camera on and have ID ready",
  "completed": false
}
```

---

### 2. Get Student's Interviews
```http
GET /interview/my
Authorization: Bearer <student_token>
```

**Response:** (200 OK) - Array of student's interviews

---

### 3. Get Job's Interviews
```http
GET /interview/job/{jobId}
Authorization: Bearer <company_token>
```

**Response:** (200 OK) - Array of interviews for the job

---

### 4. Get Interview by Application
```http
GET /interview/application/{applicationId}
Authorization: Bearer <token>
```

**Response:** (200 OK) - Interview object or 404 if not found

---

### 5. Update Interview
```http
PUT /interview/{interviewId}
Authorization: Bearer <company_token>
Content-Type: application/json
```

**Request Body:** Same as schedule interview

**Response:** (200 OK) - Updated interview object

---

### 6. Mark Interview Completed
```http
PUT /interview/{interviewId}/complete?feedback=Great performance
Authorization: Bearer <company_token>
```

**Response:** (200 OK) - Interview object with completed=true

---

## 👨‍💼 Admin APIs

### 1. Get Pending Company Approvals
```http
GET /admin/companies/pending
Authorization: Bearer <admin_token>
```

**Response:** (200 OK)
```json
[
  {
    "id": 3,
    "companyName": "NewTech Solutions",
    "email": "contact@newtech.com",
    "approved": false,
    "description": "Innovative startup",
    "createdAt": "2024-01-25T11:00:00"
  }
]
```

---

### 2. Approve Company
```http
PUT /admin/companies/{id}/approve
Authorization: Bearer <admin_token>
```

**Response:** (200 OK) - Updated company object with approved=true

---

### 3. Get System Statistics
```http
GET /admin/stats
Authorization: Bearer <admin_token>
```

**Response:** (200 OK)
```json
{
  "totalStudents": 150,
  "totalCompanies": 25,
  "approvedCompanies": 20,
  "totalPlacements": 45,
  "branchWiseStats": [
    ["Computer Science", 25],
    ["Information Technology", 15],
    ["Electronics", 5]
  ]
}
```

---

### 4. Get All Students
```http
GET /admin/students
Authorization: Bearer <admin_token>
```

**Response:** (200 OK) - Array of all students

---

### 5. Get All Companies
```http
GET /admin/companies
Authorization: Bearer <admin_token>
```

**Response:** (200 OK) - Array of all companies

---

### 6. Get Application Statistics
```http
GET /admin/application-stats
Authorization: Bearer <admin_token>
```

**Response:** (200 OK)
```json
{
  "applied": 120,
  "shortlisted": 60,
  "interviewScheduled": 35,
  "selected": 45,
  "rejected": 30
}
```

---

### 7. Get Top Recruiters
```http
GET /admin/top-recruiters
Authorization: Bearer <admin_token>
```

**Response:** (200 OK)
```json
[
  {
    "companyName": "TechCorp Inc",
    "placementCount": 15
  },
  {
    "companyName": "InnoSoft Solutions",
    "placementCount": 12
  }
]
```

---

### 8. Get Placement Metrics
```http
GET /admin/placement-metrics
Authorization: Bearer <admin_token>
```

**Response:** (200 OK)
```json
{
  "totalStudents": 150,
  "placedStudents": 45,
  "placementPercentage": "30.00",
  "branchWiseStats": {
    "Computer Science": 25,
    "Information Technology": 15,
    "Electronics": 5
  }
}
```

---

### 9. Get System Stats (Comprehensive)
```http
GET /admin/system-stats
Authorization: Bearer <admin_token>
```

**Response:** (200 OK)
```json
{
  "totalStudents": 150,
  "totalCompanies": 25,
  "approvedCompanies": 20,
  "pendingCompanies": 5,
  "totalJobs": 45,
  "activeJobs": 35,
  "totalApplications": 250,
  "totalPlacements": 45
}
```

---

## 📊 Response Codes

| Code | Description |
|------|-------------|
| 200 | Success |
| 400 | Bad Request (validation error) |
| 401 | Unauthorized (missing/invalid token) |
| 403 | Forbidden (insufficient permissions) |
| 404 | Not Found |
| 500 | Internal Server Error |

---

## 🔒 Role-Based Access

| Endpoint Pattern | Student | Company | Admin |
|-----------------|---------|---------|-------|
| `/auth/**` | ✅ | ✅ | ✅ |
| `/student/**` | ✅ | ❌ | ❌ |
| `/company/**` | ❌ | ✅ | ❌ |
| `/admin/**` | ❌ | ❌ | ✅ |
| `/jobs` (GET) | ✅ | ✅ | ✅ |
| `/interview/**` | ✅ | ✅ | ✅ |

---

## 🧪 Example Usage (cURL)

### Login:
```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"john@example.com","password":"password123"}'
```

### Get Eligible Jobs:
```bash
curl -X GET http://localhost:8080/api/jobs/eligible \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

### Apply for Job:
```bash
curl -X POST http://localhost:8080/api/student/apply/1 \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

### Upload Resume:
```bash
curl -X POST http://localhost:8080/api/student/upload-resume \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -F "file=@/path/to/resume.pdf"
```

---

## 📝 Notes

1. All dates are in ISO 8601 format: `YYYY-MM-DDTHH:mm:ss`
2. JWT tokens expire after 24 hours (configurable)
3. File uploads limited to 10MB
4. Resume uploads accept only PDF files
5. CORS enabled for `http://localhost:3000` and `http://localhost:5173`

---

## 🐛 Common Errors

### "Invalid email or password"
- Check credentials are correct
- Ensure account exists

### "Email already exists"
- Use different email for registration
- Login with existing account

### "Company not approved yet"
- Wait for admin approval
- Contact admin

### "Already applied for this job"
- Can only apply once per job
- Check application status

### "Job not found"
- Job may have been deleted
- Check job ID is correct

### "Unauthorized to update this job"
- Must be job owner to update
- Check you're logged in as correct company

---

**📚 This documentation covers all 40+ API endpoints in the system!**
