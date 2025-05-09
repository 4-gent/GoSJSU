-- Fix the Student table to include the student_id column and other required columns

-- First modify the studentID column to be INT
ALTER TABLE Student MODIFY COLUMN studentID INT AUTO_INCREMENT;

-- Add student_id column which is used as the username for login
ALTER TABLE Student ADD COLUMN student_id VARCHAR(20) UNIQUE NOT NULL AFTER studentID;

-- Add password column which is required for authentication
ALTER TABLE Student ADD COLUMN password VARCHAR(255) NOT NULL AFTER age;

-- Add email column which is used for communication
ALTER TABLE Student ADD COLUMN email VARCHAR(100) NOT NULL AFTER lastName;

-- Add major column which is used for student details
ALTER TABLE Student ADD COLUMN major VARCHAR(50) AFTER email;

-- Add timestamp columns for created_at and updated_at
ALTER TABLE Student 
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- Insert a sample student for testing login
INSERT INTO Student (studentID, student_id, firstName, lastName, email, major, age, password)
VALUES (1, '123456789', 'Marlon', 'Burog', 'marlon.burog@sjsu.edu', 'Software Engineering', 22, 'student123');

-- Now modify the Faculty table to add employee_id column (used as username for login)
ALTER TABLE Faculty ADD COLUMN employee_id VARCHAR(20) UNIQUE NOT NULL AFTER employeeID;

-- Add email, department, password columns
ALTER TABLE Faculty 
ADD COLUMN email VARCHAR(100) NOT NULL AFTER lastName,
ADD COLUMN department VARCHAR(50) NOT NULL AFTER email, 
ADD COLUMN password VARCHAR(255) NOT NULL AFTER department;

-- Add timestamp columns for Faculty
ALTER TABLE Faculty 
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- Insert sample faculty for testing login
INSERT INTO Faculty (employeeID, employee_id, firstName, lastName, email, department, password)
VALUES 
(1, 'F001', 'Emily', 'Clark', 'emily.clark@sjsu.edu', 'Computer Science', 'faculty123'),
(2, 'F002', 'Michael', 'Wilson', 'michael.wilson@sjsu.edu', 'Mathematics', 'faculty123'); 