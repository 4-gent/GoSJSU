-- init and schema weren't consistent. run schema.sql then run fix.sql

-- Alter Student table to add additional fields
ALTER TABLE Student
ADD COLUMN student_id VARCHAR(20) UNIQUE NOT NULL AFTER studentID, -- Unique student identifier
ADD COLUMN email VARCHAR(100) NOT NULL AFTER lastName,
ADD COLUMN major VARCHAR(50) NOT NULL AFTER email,
ADD COLUMN gender VARCHAR(10) AFTER major,
ADD COLUMN date_of_birth DATE AFTER gender,
ADD COLUMN city VARCHAR(50) AFTER date_of_birth,
ADD COLUMN postal_address TEXT AFTER city,
ADD COLUMN mobile_number VARCHAR(20) AFTER postal_address,
ADD COLUMN alternate_mobile_number VARCHAR(20) AFTER mobile_number,
ADD COLUMN password VARCHAR(255) NOT NULL AFTER alternate_mobile_number, -- Password for authentication
ADD COLUMN role ENUM('student', 'faculty') DEFAULT 'student' AFTER password, -- Role for differentiation
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP AFTER role,
ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER created_at;

-- Alter Faculty table to add additional fields
ALTER TABLE Faculty
ADD COLUMN employee_id VARCHAR(20) UNIQUE NOT NULL AFTER employeeID, -- Unique faculty identifier
ADD COLUMN email VARCHAR(100) NOT NULL AFTER lastName,
ADD COLUMN department VARCHAR(50) NOT NULL AFTER email,
ADD COLUMN gender VARCHAR(10) AFTER department,
ADD COLUMN date_of_birth DATE AFTER gender,
ADD COLUMN city VARCHAR(50) AFTER date_of_birth,
ADD COLUMN postal_address TEXT AFTER city,
ADD COLUMN mobile_number VARCHAR(20) AFTER postal_address,
ADD COLUMN alternate_mobile_number VARCHAR(20) AFTER mobile_number,
ADD COLUMN password VARCHAR(255) NOT NULL AFTER alternate_mobile_number, -- Password for authentication
ADD COLUMN role ENUM('student', 'faculty') DEFAULT 'faculty' AFTER password, -- Role for differentiation
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP AFTER role,
ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER created_at;

-- Update existing Student table with sample data
INSERT INTO Student (student_id, firstName, lastName, email, major, gender, date_of_birth, city, postal_address, mobile_number, alternate_mobile_number, password, role)
VALUES 
('S123456789', 'Marlon', 'Burog', 'marlon.burog@sjsu.edu', 'Software Engineering', 'Male', '2001-01-01', 'San Jose', '6969 Farpost CT, San Jose, CA 95121', '0234567891', '0509876543', 'student123', 'student')
ON DUPLICATE KEY UPDATE student_id = student_id;

-- Update existing Faculty table with sample data
INSERT INTO Faculty (employee_id, firstName, lastName, email, department, gender, date_of_birth, city, postal_address, mobile_number, alternate_mobile_number, password, role)
VALUES 
('F001', 'Emily', 'Clark', 'emily.clark@sjsu.edu', 'Computer Science', 'Female', '1980-05-15', 'San Jose', '123 Faculty Lane, San Jose, CA 95112', '4081234567', '4089876543', 'faculty123', 'faculty'),
('F002', 'Michael', 'Wilson', 'michael.wilson@sjsu.edu', 'Mathematics', 'Male', '1975-08-20', 'Santa Clara', '456 Faculty Drive, Santa Clara, CA 95050', '4082345678', '4088765432', 'faculty123', 'faculty')
ON DUPLICATE KEY UPDATE employee_id = employee_id;