🏥 HealthEase - Online Health Consultation Platform

A robust web-based application designed to facilitate virtual medical consultations. Built using core Java technologies (Servlet, JSP, JDBC) without external frameworks, demonstrating a deep understanding of the MVC architecture and database management.
Glassmorphism design with animated elements

Analytics-driven dashboard (HealthEase Style)

(Note: Replace the paths above with your actual screenshots)

✨ Features

👨‍⚕️ Admin Module

Analytics Dashboard: View real-time stats (Total Doctors, Patients, Appointments, Earnings) with visual charts.

Doctor Management: Add new doctors, view doctor lists, and manage specializations.

User Management: Monitor registered patients.

Appointment Oversight: View all scheduled consultations.

👤 Patient Module

Secure Registration/Login: Password encryption and session management.

Book Appointments: Select doctor by specialization and available slots.

My Dashboard: View appointment history and status (Confirmed/Pending).

Support System: Submit queries regarding login or booking issues.

🩺 Doctor Module

View Schedule: Check upcoming appointments.

Consultation: (Future Scope) Video link integration and prescription generation.

🛠️ Tech Stack

Frontend: JSP (JavaServer Pages), HTML5, CSS3 (Modern UI/Glassmorphism), JavaScript, Chart.js.

Backend: Java Servlets (Controller Logic).

Database: MySQL (Relational Data Management).

Connectivity: JDBC (Java Database Connectivity).

Server: Apache Tomcat (v9.0 or v10.0).

🚀 Setup & Installation

1. Prerequisites

Java Development Kit (JDK 8 or higher)

Apache Tomcat Server

MySQL Workbench / Command Line

Eclipse IDE / IntelliJ IDEA (Enterprise Edition)

2. Database Configuration

Create a database named health_consultation_db and run the following SQL script:

CREATE DATABASE health_consultation_db;
USE health_consultation_db;

-- Users Table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    role VARCHAR(20) DEFAULT 'PATIENT' -- Roles: PATIENT, ADMIN, DOCTOR
);

-- Doctors Table
CREATE TABLE doctors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialization VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Appointments Table
CREATE TABLE appointments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    doctor_id INT,
    appt_date DATE,
    appt_time VARCHAR(20),
    status VARCHAR(20) DEFAULT 'PENDING',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);

-- Insert Default Admin
INSERT INTO users (name, email, password, role) VALUES ('Super Admin', 'admin@health.com', 'admin123', 'ADMIN');


3. Project Configuration

Clone this repository or extract the zip file.

Import the project into your IDE as a "Dynamic Web Project".

Open src/main/java/dao/DBConnection.java (or your DB config file) and update your MySQL credentials:

String url = "jdbc:mysql://localhost:3306/health_consultation_db";
String username = "root"; 
String password = "your_password";


Add the mysql-connector-java.jar to your WEB-INF/lib folder.

4. Running the App

Right-click the project -> Run As -> Run on Server.

Navigate to http://localhost:8080/ProjectName/.

🔑 Demo Credentials

Role

Email

Password

Admin

admin@health.com

admin123

Patient

(Register a new account)

(Any)

📂 Project Structure

HealthConsultation/
├── src/main/java/
│   ├── controller/      # Servlets (LoginServlet, AppointmentServlet, etc.)
│   ├── dao/             # Database Access Objects (UserDAO, DoctorDAO)
│   ├── model/           # Java Beans (User.java, Doctor.java)
│   └── util/            # DB Connection Helper
├── src/main/webapp/
│   ├── css/             # Stylesheets
│   ├── images/          # Assets (Doctor illustrations, Logos)
│   ├── admin_dashboard.jsp
│   ├── login.jsp
│   ├── register.jsp
│   └── index.jsp
└── pom.xml (if Maven)


🤝 Contribution

This is an academic project. Suggestions for improvements are welcome!

Fork the repository.

Create your feature branch (git checkout -b feature/AmazingFeature).

Commit your changes (git commit -m 'Add some AmazingFeature').

Push to the branch (git push origin feature/AmazingFeature).

Open a Pull Request.
