# 🎓 GoSJSU - Student Management System

<div align="center">
  

[![Java](https://img.shields.io/badge/Java-11-orange.svg)](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
[![Maven](https://img.shields.io/badge/Maven-3.8.1-blue.svg)](https://maven.apache.org/download.cgi)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-blue.svg)](https://dev.mysql.com/downloads/mysql/)
[![Tomcat](https://img.shields.io/badge/Tomcat-7-red.svg)](https://tomcat.apache.org/download-70.cgi)

</div>

## 📋 Project Overview

GoSJSU is a comprehensive student management system designed for San Jose State University. It provides a web-based interface for students, faculty, and administrators to manage academic records, enrollment, grades, and course offerings.

### Key Features

- **🧑‍🎓 For Students**
  - View and update personal profile
  - Register for courses
  - View grades and transcripts
  - Access class schedules and timetables

- **👨‍🏫 For Faculty**
  - Manage course rosters
  - Record and update grades
  - Generate course reports
  - View teaching assignments

- **👨‍💼 For Administrators**
  - Manage student and faculty accounts
  - Generate institutional reports
  - Monitor system performance

## 🚀 Getting Started

### Prerequisites

- [Java 11 or higher](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
- [Maven 3.6+](https://maven.apache.org/download.cgi)
- [MySQL 8.0+](https://dev.mysql.com/downloads/mysql/)
- [Git](https://git-scm.com/downloads) (optional)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/GoSJSU.git
   cd GoSJSU
   ```

2. **Database Setup**
   ```bash
   # Create MySQL database
   mysql -u root -p < fix_student_table.sql
   ```

3. **Build the project**
   ```bash
   mvn clean package
   ```

4. **Run the application**
   ```bash
   mvn tomcat7:run
   ```

5. **Access the application**
   - Open your browser and navigate to: [http://localhost:8080/GoSJSU](http://localhost:8080/GoSJSU)

### Default Credentials

| Role     | Username   | Password    |
|----------|------------|-------------|
| Student  | 123456789  | student123  |
| Faculty  | F001       | faculty123  |
| Admin    | admin      | admin123    |

## 📂 Project Structure

```
gosjsu/                    <- Root directory
├── pom.xml                <- Maven configuration file
├── src/
│   ├── main/
│   │   ├── java/com/gosjsu/
│   │   │   ├── admin/        <- Admin functionalities
│   │   │   ├── auth/         <- Authentication & authorization
│   │   │   ├── faculty/      <- Faculty features
│   │   │   ├── report/       <- Reporting services
│   │   │   ├── shared/       <- Shared utilities
│   │   │   ├── student/      <- Student features
│   │   │   └── utils/        <- Utility classes
│   │   ├── resources/        <- Configuration files
│   │   ├── tomcat/           <- Tomcat configuration
│   │   └── webapp/           <- Web resources & JSP files
│   └── test/                 <- Unit tests
├── target/                   <- Compiled files
├── sql/                      <- SQL scripts
└── README.md                 <- Project documentation
```

## 🛠️ Development

### Building the Project

```bash
# Clean and build
mvn clean package

# Run tests
mvn test
```

### Deploying to Tomcat

```bash
# Option 1: Run embedded Tomcat
mvn tomcat7:run

# Option 2: Deploy to external Tomcat
cp target/GoSJSU-1.0-SNAPSHOT.war $TOMCAT_HOME/webapps/
```

## 📚 Dependencies

- **Web Framework**
  - Servlet API 4.0.1
  - JSP API 2.3.3
  - JSTL 1.2

- **Database**
  - MySQL Connector/J 8.0.33

- **PDF Generation**
  - Apache PDFBox 2.0.24
  - iText PDF 5.5.13.3

- **Build & Deployment**
  - Maven
  - Tomcat 7

## 🔧 Configuration

### Database Configuration

The database connection settings are located in:
```
src/main/resources/config/database.properties
```

Default settings:
```properties
jdbc.url=jdbc:mysql://localhost:3306/gosjsu
jdbc.username=root
jdbc.password=root
jdbc.driver=com.mysql.cj.jdbc.Driver
```

### Application Properties

Application-specific settings are located in:
```
src/main/resources/config/application.properties
```




---

<div align="center">
  <p>Made with ❤️ for San Jose State University</p>
</div>
