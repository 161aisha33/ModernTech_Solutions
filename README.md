# ModernTech HR System

A full-stack HR management system built with Vue.js (front-end), Node.js (back-end), and MySQL (database). This app simulates employee data handling, payroll processing, attendance tracking, and secure login with hashed passwords.

---

## Features

- Secure user login with hashed passwords (bcrypt)
- Role-based access structure (HR, manager, employee)
- Centralized employee profile management
- Submit and manage time-off requests
- Automated payroll calculations
- Track employee attendance
- Responsive front-end interface (mobile/tablet friendly)
- RESTful API integration using Express

---

## Technologies Used

### Front-End
- Vue.js (Vue CLI)
- Vue Router
- Vuex (State Management)
- Axios
- Bootstrap
- Animate.css
- Font Awesome

### Back-End
- Node.js
- Express.js
- MySQL (via mysql2/promise)
- bcrypt (for password hashing)
- dotenv (for environment variables)
- CORS (for cross-origin API access)

---

## Database Structure

Key tables include:
- `employee_info`
- `departments`
- `login`
- `attendance`
- `payroll`
- `performance_review`
- `leave_requests`

Each table is normalized up to 3NF and uses foreign keys to maintain relational integrity.

---

## Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/OwethuV/ModernTech_Solutions.git
```
```bash
cd ModernTech_Solutions
```
### 2. Install back-end dependencies

```bash
cd frontend
```
```bash
npm install
```

### 3. Install back-end dependencies

```bash
cd ../backend
```
```
npm install
```

### 4. Import the Database
Before running the system, you need to import the provided MySQL database:

1. Open **phpMyAdmin**, **MySQL Workbench**, or any MySQL client.

2. Create a new database named:
```sql
project2_
```
3. Import the provided SQL dump file
   If you're using the terminal:
```bash
mysql -u root -p project2_ < database.sql
```

### 5. Configure .env for backend
Create a .env file inside the /backend folder:
```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=moderntech_db
```

### 6. Start servers
Back-End (Node)
```bash
cd backend
```
```bash
npm run dev
```
Front-End (Vue)
```bash
cd frontend
```
```bash
npm run serve
```

## Login Credentials
- Email: `fatima.patel@moderntech.com` (Or any hr email in database)
- Password: `ModernTech@2025`

## Usage
1. Log in using provided credentials.

2. View employees and performance records.

3. Submit attendance or leave requests.

4. View payroll summaries.

5. Manage users and departments.

## Team
- Aisha Kabanga
- Siphokazi Limba
- Hanaa Richards
- Owethu Valantiya

## License
This project is for educational purposes only.
