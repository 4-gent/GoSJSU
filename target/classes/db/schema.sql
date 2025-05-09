-- Students
CREATE TABLE Student (
  studentID INT AUTO_INCREMENT,
  student_id VARCHAR(20) UNIQUE NOT NULL,
  firstName VARCHAR(50) NOT NULL,
  lastName VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  major VARCHAR(50) NOT NULL,
  gender VARCHAR(10),
  date_of_birth DATE,
  city VARCHAR(50),
  postal_address TEXT,
  mobile_number VARCHAR(20),
  alternate_mobile_number VARCHAR(20),
  password VARCHAR(255) NOT NULL,
  role ENUM('student', 'faculty') DEFAULT 'student',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (studentID)
) ENGINE=InnoDB;

-- Courses
CREATE TABLE Course (
  courseID INT AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  department VARCHAR(50) NOT NULL,
  credits INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (courseID)
) ENGINE=InnoDB;

-- Faculty
CREATE TABLE Faculty (
  employeeID INT AUTO_INCREMENT,
  employee_id VARCHAR(20) UNIQUE NOT NULL,
  firstName VARCHAR(50) NOT NULL,
  lastName VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  department VARCHAR(50) NOT NULL,
  gender VARCHAR(10),
  date_of_birth DATE,
  city VARCHAR(50),
  postal_address TEXT,
  mobile_number VARCHAR(20),
  alternate_mobile_number VARCHAR(20),
  password VARCHAR(255) NOT NULL,
  role ENUM('student', 'faculty') DEFAULT 'faculty',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (employeeID)
) ENGINE=InnoDB;

-- Enrollment: which students are in which courses
CREATE TABLE Enrollment (
  studentID INT NOT NULL,
  courseID INT NOT NULL,
  semester VARCHAR(20) NOT NULL,
  enrolledOn DATE DEFAULT (CURRENT_DATE),
  PRIMARY KEY (studentID, courseID, semester),
  FOREIGN KEY (studentID) REFERENCES Student(studentID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (courseID) REFERENCES Course(courseID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB;

-- Grade reports per student–course
CREATE TABLE Grade_Report (
  studentID INT NOT NULL,
  courseID INT NOT NULL,
  semester VARCHAR(20) NOT NULL,
  grade VARCHAR(5) NOT NULL,
  reportedOn DATE DEFAULT (CURRENT_DATE),
  PRIMARY KEY (studentID, courseID, semester),
  FOREIGN KEY (studentID) REFERENCES Student(studentID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (courseID) REFERENCES Course(courseID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB;

-- Teaches: which faculty teach which courses
CREATE TABLE Teaches (
  employeeID INT NOT NULL,
  courseID INT NOT NULL,
  semester VARCHAR(20) NOT NULL,
  assignedOn DATE DEFAULT (CURRENT_DATE),
  PRIMARY KEY (employeeID, courseID, semester),
  FOREIGN KEY (employeeID) REFERENCES Faculty(employeeID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (courseID) REFERENCES Course(courseID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB;