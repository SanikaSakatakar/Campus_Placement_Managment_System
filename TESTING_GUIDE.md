# 🧪 Complete Testing Guide - Campus Placement System

## Overview
This guide provides step-by-step testing procedures for all features in the system.

---

## 🚀 Initial Setup for Testing

### 1. Start the Application
```bash
# Terminal 1 - Backend
cd backend
mvn spring-boot:run

# Terminal 2 - Frontend
cd frontend
npm run dev
```

### 2. Access the Application
- Open browser: `http://localhost:3000`
- Backend API: `http://localhost:8080`

---

## 👤 User Creation for Testing

### Create Test Users

#### 1. Student Account
```
Name: Test Student
Email: student@test.com
Password: student123
Branch: Computer Science
CGPA: 8.5
Skills: Java, Python, React
```

#### 2. Company Account
```
Name: HR Manager
Email: company@test.com
Password: company123
Company Name: TechTest Corp
Description: Test company for placement
Industry: Technology
```

#### 3. Admin Account (via MySQL)
```sql
INSERT INTO students (name, email, password, branch, cgpa, role, created_at, updated_at)
VALUES ('Admin User', 'admin@test.com', 
'$2a$10$dXJ3SW6G7P2aQE7pLh8laeXo.mVQmP3p.3JVvQKYzVvGbRYNvNwUC',
'Admin', 10.0, 'ADMIN', NOW(), NOW());
```
Password: admin123

---

## 🧪 Feature Testing Procedures

### Test 1: Student Registration & Login ✅

**Steps:**
1. Go to homepage (http://localhost:3000)
2. Click "Register as Student"
3. Fill in all required fields:
   - Name: Test Student
   - Email: student@test.com
   - Password: student123
   - Branch: Computer Science
   - CGPA: 8.5
   - Skills: Java, Python, React
4. Click "Register"

**Expected Result:**
- ✅ Registration successful
- ✅ Automatically logged in
- ✅ Redirected to Student Dashboard
- ✅ Token stored in localStorage
- ✅ Welcome message shows student name

**Verify:**
```javascript
// Browser Console
localStorage.getItem('token') // Should show JWT token
localStorage.getItem('user') // Should show user data
```

---

### Test 2: Company Registration & Approval ✅

**Steps:**
1. Logout from student account
2. Click "Register as Company"
3. Fill in company details:
   - Contact Name: HR Manager
   - Email: company@test.com
   - Password: company123
   - Company Name: TechTest Corp
   - Description: Leading tech company
   - Industry: Technology
4. Click "Register Company"
5. Login as Admin (admin@test.com / admin123)
6. Go to Admin Dashboard
7. See pending company approval
8. Click "Approve"

**Expected Result:**
- ✅ Company registered successfully
- ✅ Initially not approved (approved: false)
- ✅ Visible in admin pending approvals
- ✅ After approval, approved: true
- ✅ Company can now post jobs

---

### Test 3: Resume Upload 📄

**Steps:**
1. Login as student (student@test.com)
2. Go to "Profile" page
3. Scroll to "Resume Upload" section
4. Click "Choose File"
5. Select a PDF resume (< 5MB)
6. Click "Upload Resume"

**Expected Result:**
- ✅ File validation (only PDF accepted)
- ✅ Size validation (max 5MB)
- ✅ Upload progress shown
- ✅ Success message displayed
- ✅ Resume filename shown
- ✅ File saved in backend/uploads/

**Verify:**
```bash
# Check uploads folder
ls backend/uploads/
# Should see: uuid-filename.pdf
```

---

### Test 4: Job Posting 📝

**Steps:**
1. Login as company (company@test.com)
2. Go to "Post Job" page
3. Fill in job details:
   - Title: Software Engineer
   - Description: We are looking for talented developers...
   - Min CGPA: 7.0
   - Branches: Computer Science, Information Technology
   - Skills Required: Java, Spring Boot, React
   - Package Offered: 10-12 LPA
   - Location: Bangalore
   - Job Type: Full-time
   - Deadline: [Future date]
   - Active: ✅
4. Click "Post Job"

**Expected Result:**
- ✅ Job created successfully
- ✅ Redirected to Company Jobs page
- ✅ Job visible in company's job list
- ✅ Job appears in active jobs for students

---

### Test 5: Eligibility Matching 🎯

**Test Case 1: Eligible Student**
```
Student Profile:
- CGPA: 8.5 (>= 7.0) ✅
- Branch: Computer Science (in list) ✅
- Skills: Java, React (50% match) ✅

Result: JOB SHOWS IN ELIGIBLE JOBS ✅
```

**Test Case 2: Ineligible Student**
```
Create another student with:
- CGPA: 6.5 (< 7.0) ❌
- Branch: Mechanical (not in list) ❌

Result: JOB DOES NOT SHOW ✅
```

**Steps to Verify:**
1. Login as student@test.com
2. Go to "Jobs" page
3. Should see "Software Engineer" job
4. Register another student with lower CGPA
5. Login as new student
6. Go to "Jobs" page
7. Should NOT see the job

---

### Test 6: Job Application 📋

**Steps:**
1. Login as eligible student
2. Go to "Jobs" page
3. Find "Software Engineer" job
4. Click "Apply Now"

**Expected Result:**
- ✅ Application submitted successfully
- ✅ Success message shown
- ✅ Job removed from eligible jobs list
- ✅ Application appears in "My Applications"
- ✅ Status: APPLIED
- ✅ Resume automatically attached

**Verify:**
1. Go to "Applications" page
2. See application with status: APPLIED
3. Company can see application in applicant list

---

### Test 7: Interview Scheduling 📅

**Steps:**
1. Login as company (company@test.com)
2. Go to "My Jobs"
3. Click on "Software Engineer" job
4. See list of applicants
5. For Test Student, click "Schedule Interview"
6. Fill in interview details:
   - Date: [Tomorrow's date]
   - Time: 14:00
   - Mode: ONLINE
   - Meeting Link: https://meet.google.com/test-link
   - Panel Name: Technical Panel
   - Instructions: Please keep camera on
7. Click "Schedule Interview"

**Expected Result:**
- ✅ Interview modal appears
- ✅ All fields validated
- ✅ Interview scheduled successfully
- ✅ Application status → INTERVIEW_SCHEDULED
- ✅ Student can see interview details

**Verify Student Side:**
1. Login as student@test.com
2. Click "Interviews" in navbar
3. See scheduled interview with:
   - ✅ Job title
   - ✅ Company name
   - ✅ Date and time
   - ✅ Meeting link (clickable)
   - ✅ Panel name
   - ✅ Instructions

---

### Test 8: Interview Modes 💻🏢

**Test Online Mode:**
```
Mode: ONLINE
Required: Meeting Link
Optional: Location
Displayed: Meeting link is clickable
```

**Test Offline Mode:**
```
Mode: OFFLINE
Required: Location
Optional: Meeting Link
Displayed: Venue address shown
```

**Test Hybrid Mode:**
```
Mode: HYBRID
Required: Both Meeting Link and Location
Displayed: Both shown to student
```

**Steps for Each:**
1. Schedule interview with specific mode
2. Verify required fields enforce validation
3. Check student sees correct information

---

### Test 9: Application Status Updates ✅

**Status Flow Test:**
```
APPLIED → SHORTLISTED → INTERVIEW_SCHEDULED → SELECTED
```

**Steps:**
1. Login as company
2. Go to applicant for a job
3. Click "Shortlist" button
4. Verify status changes to SHORTLISTED
5. Click "Schedule Interview"
6. Schedule interview
7. Verify status changes to INTERVIEW_SCHEDULED
8. Click "Select" button
9. Verify status changes to SELECTED

**Verify Student Side:**
1. Login as student
2. Go to "Applications"
3. See status updated in real-time
4. Check color-coded badges

---

### Test 10: Admin Analytics Dashboard 📊

**Steps:**
1. Login as admin (admin@test.com)
2. View dashboard

**Verify Statistics:**
- ✅ Total Students count
- ✅ Total Companies count
- ✅ Approved Companies count
- ✅ Pending Approvals count
- ✅ Total Jobs count
- ✅ Active Jobs count
- ✅ Total Applications count
- ✅ Total Placements count

**Test Analytics Endpoints:**
```bash
# Using token from admin login
TOKEN="your_admin_jwt_token"

# Application Stats
curl -H "Authorization: Bearer $TOKEN" \
  http://localhost:8080/api/admin/application-stats

# Top Recruiters
curl -H "Authorization: Bearer $TOKEN" \
  http://localhost:8080/api/admin/top-recruiters

# Placement Metrics
curl -H "Authorization: Bearer $TOKEN" \
  http://localhost:8080/api/admin/placement-metrics
```

---

### Test 11: Profile Management ✏️

**Update Student Profile:**
1. Login as student
2. Go to Profile
3. Click "Edit Profile"
4. Update fields:
   - CGPA: 8.7 (increased)
   - Skills: Add "Node.js, MongoDB"
   - Projects: Add new project
5. Click "Save Changes"

**Expected Result:**
- ✅ Profile updated successfully
- ✅ Changes reflected immediately
- ✅ Eligibility recalculated for jobs
- ✅ View mode shows updated data

---

### Test 12: File Upload Validation 🔒

**Test Invalid File Type:**
1. Try uploading .docx file
2. Should show error: "Please select a PDF file"

**Test File Size Limit:**
1. Try uploading 6MB file
2. Should show error: "File size must be less than 5MB"

**Test Valid Upload:**
1. Upload 2MB PDF
2. Should succeed

---

### Test 13: Role-Based Access Control 🔐

**Test Student Access:**
```bash
# Login as student, get token
# Try accessing company endpoint
curl -H "Authorization: Bearer $STUDENT_TOKEN" \
  http://localhost:8080/api/company/jobs

# Expected: 403 Forbidden
```

**Test Company Access:**
```bash
# Login as company, get token
# Try accessing student endpoint
curl -H "Authorization: Bearer $COMPANY_TOKEN" \
  http://localhost:8080/api/student/profile

# Expected: 403 Forbidden
```

**Test Unauthenticated Access:**
```bash
# No token
curl http://localhost:8080/api/jobs/eligible

# Expected: 401 Unauthorized
```

---

### Test 14: Search and Filter 🔍

**Test Job Filtering:**
1. Create multiple jobs with different criteria
2. Register students with different profiles
3. Verify each student sees only eligible jobs

**Example:**
```
Job 1: Min CGPA 8.0, CS only
Job 2: Min CGPA 7.0, CS + IT
Job 3: Min CGPA 6.0, All branches

Student A (CGPA 8.5, CS): Sees all 3 jobs
Student B (CGPA 7.5, IT): Sees jobs 2 and 3
Student C (CGPA 6.5, ME): Sees only job 3
```

---

### Test 15: Edge Cases & Error Handling 🐛

**Test Duplicate Application:**
1. Apply to a job
2. Try applying again
3. Should show: "Already applied for this job"

**Test Expired Job:**
1. Create job with past deadline
2. Student should not see it

**Test Inactive Job:**
1. Create job with active = false
2. Student should not see it

**Test Unapproved Company:**
1. Login as unapproved company
2. Try to post job
3. Should show: "Company is not approved yet"

---

## 📊 Complete Test Checklist

### Authentication ✅
- [ ] Student registration
- [ ] Company registration
- [ ] Admin creation
- [ ] Student login
- [ ] Company login
- [ ] Admin login
- [ ] JWT token generation
- [ ] Token expiration
- [ ] Logout functionality

### Student Features ✅
- [ ] View dashboard
- [ ] Update profile
- [ ] Upload resume (PDF)
- [ ] View eligible jobs
- [ ] Apply for jobs
- [ ] View applications
- [ ] Track application status
- [ ] View interview schedule
- [ ] Access meeting links

### Company Features ✅
- [ ] Post new job
- [ ] View posted jobs
- [ ] Update job details
- [ ] Delete job
- [ ] View applicants
- [ ] Shortlist candidates
- [ ] Schedule interviews (Online/Offline/Hybrid)
- [ ] Update application status
- [ ] Mark interview completed
- [ ] View recruitment stats

### Admin Features ✅
- [ ] View all students
- [ ] View all companies
- [ ] Approve companies
- [ ] View system statistics
- [ ] View application breakdown
- [ ] View top recruiters
- [ ] View placement metrics
- [ ] Monitor pending approvals

### Interview System ✅
- [ ] Schedule online interview
- [ ] Schedule offline interview
- [ ] Schedule hybrid interview
- [ ] View upcoming interviews
- [ ] View past interviews
- [ ] Access meeting links
- [ ] See venue details
- [ ] Read interview instructions
- [ ] Interview completion
- [ ] Feedback mechanism

### File Management ✅
- [ ] Upload PDF resume
- [ ] File size validation (5MB)
- [ ] File type validation (PDF only)
- [ ] UUID filename generation
- [ ] Old file deletion
- [ ] File retrieval
- [ ] Resume auto-attach to applications

### Security ✅
- [ ] Password encryption (BCrypt)
- [ ] JWT authentication
- [ ] Role-based access control
- [ ] Protected routes (frontend)
- [ ] Protected endpoints (backend)
- [ ] CORS configuration
- [ ] Input validation
- [ ] SQL injection prevention

### UI/UX ✅
- [ ] Responsive design (mobile/tablet/desktop)
- [ ] Loading indicators
- [ ] Error messages
- [ ] Success notifications
- [ ] Form validation
- [ ] Navigation menu
- [ ] Color-coded status badges
- [ ] Smooth animations
- [ ] Modal dialogs

---

## 🎯 Performance Testing

### Load Testing
```bash
# Create multiple users
for i in {1..50}
do
  # Register student
  # Upload resume
  # Apply to jobs
done

# Monitor:
- Response times
- Database connections
- Memory usage
- API latency
```

---

## 🐛 Bug Reporting Template

```markdown
## Bug Report

**Title:** [Brief description]

**Steps to Reproduce:**
1. [First step]
2. [Second step]
3. [...]

**Expected Result:**
[What should happen]

**Actual Result:**
[What actually happened]

**Environment:**
- Browser: [Chrome/Firefox/etc.]
- OS: [Windows/Mac/Linux]
- User Role: [Student/Company/Admin]

**Screenshots:**
[If applicable]

**Console Errors:**
[Browser console or backend logs]
```

---

## ✅ Final Verification

Before considering testing complete:

1. ✅ All 15 test scenarios passed
2. ✅ No console errors
3. ✅ All API endpoints working
4. ✅ Data persisting correctly
5. ✅ File uploads functioning
6. ✅ Interview scheduling working
7. ✅ Analytics showing correct data
8. ✅ Role-based access enforced
9. ✅ UI responsive on all devices
10. ✅ No breaking errors

---

## 📝 Test Results Document Template

```
# Test Results - Campus Placement System
Date: [DD/MM/YYYY]
Tester: [Name]
Version: 1.1.0

## Summary
- Total Tests: 15
- Passed: XX
- Failed: XX
- Success Rate: XX%

## Detailed Results
[Test Name] - ✅ PASS / ❌ FAIL
Notes: [Any observations]

## Issues Found
1. [Issue description]
   - Severity: High/Medium/Low
   - Status: Open/Fixed

## Recommendations
[Suggestions for improvements]
```

---

**🎉 Complete this testing guide to ensure the system is production-ready!**

**Questions? Check:**
- API_DOCUMENTATION.md for endpoint details
- README.md for setup instructions
- CHANGELOG.md for feature information
