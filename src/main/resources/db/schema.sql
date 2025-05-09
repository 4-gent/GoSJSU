-- Students
CREATE TABLE Student (
  studentID   INT            AUTO_INCREMENT,
  firstName   VARCHAR(50)    NOT NULL,
  lastName    VARCHAR(50)    NOT NULL,
  age         INT,
  PRIMARY KEY (studentID)
) ENGINE=InnoDB;

-- Courses
CREATE TABLE Course (
  courseID    INT            AUTO_INCREMENT,
  name        VARCHAR(100)   NOT NULL,
  PRIMARY KEY (courseID)
) ENGINE=InnoDB;

-- Faculty
CREATE TABLE Faculty (
  employeeID  INT            AUTO_INCREMENT,
  firstName   VARCHAR(50)    NOT NULL,
  lastName    VARCHAR(50)    NOT NULL,
  PRIMARY KEY (employeeID)
) ENGINE=InnoDB;

-- Enrollment: which students are in which courses
CREATE TABLE Enrollment (
  studentID   INT            NOT NULL,
  courseID    INT            NOT NULL,
  enrolledOn  TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (studentID, courseID),
  FOREIGN KEY (studentID) REFERENCES Student(studentID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (courseID) REFERENCES Course(courseID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB;

-- Grade reports per student–course
CREATE TABLE Grade_Report (
  studentID   INT            NOT NULL,
  courseID    INT            NOT NULL,
  grade       VARCHAR(5)     NOT NULL,
  reportedOn  TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (studentID, courseID),
  FOREIGN KEY (studentID) REFERENCES Student(studentID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (courseID) REFERENCES Course(courseID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB;

-- Teaches: which faculty teach which courses
CREATE TABLE Teaches (
  employeeID  INT            NOT NULL,
  courseID    INT            NOT NULL,
  assignedOn  TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (employeeID, courseID),
  FOREIGN KEY (employeeID) REFERENCES Faculty(employeeID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (courseID) REFERENCES Course(courseID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB;