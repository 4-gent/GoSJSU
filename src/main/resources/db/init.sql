-- Database initialization script

-- Create students table if it doesn't exist
CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    major VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    city VARCHAR(50),
    postal_address TEXT,
    mobile_number VARCHAR(20),
    alternate_mobile_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert some sample data if table is empty
INSERT INTO students (student_id, first_name, last_name, email, major, gender, date_of_birth, city, postal_address, mobile_number, alternate_mobile_number)
SELECT '123456789', 'Marlon', 'Burog', 'marlon.burog@sjsu.edu', 'Software Engineer', 'Male', '2001-01-01', 'San Jose', '6969 Farpost CT, San Jose, CA 95121', '0234567891', '0509876543'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM students WHERE student_id = '123456789');

-- Sample data for GoSJSU system

-- Insert sample student data
INSERT INTO Student (student_id, firstName, lastName, email, major, gender, date_of_birth, city, postal_address, mobile_number, alternate_mobile_number, password, role) VALUES
('123456789', 'Marlon', 'Burog', 'marlon.burog@sjsu.edu', 'Software Engineering', 'Male', '2001-01-01', 'San Jose', '6969 Farpost CT, San Jose, CA 95121', '0234567891', '0509876543', 'student123', 'student'),
('234567890', 'Nick', 'Tran', 'nick.tran@sjsu.edu', 'Computer Science', 'Male', '2000-05-15', 'Santa Clara', '123 Main St, Santa Clara, CA 95050', '4081234567', '4087654321', 'student123', 'student'),
('345678901', 'Anh', 'Nguyen', 'anh.h.nguyen01@sjsu.edu', 'Computer Science', 'Female', '2002-03-20', 'San Jose', '456 Park Ave, San Jose, CA 95110', '4082345678', '4088765432', 'student123', 'student'),
('456789012', 'John', 'Smith', 'john.smith@sjsu.edu', 'Business', 'Male', '1999-07-12', 'Campbell', '789 Campbell Ave, Campbell, CA 95008', '4083456789', '4089876543', 'student123', 'student'),
('567890123', 'Jane', 'Doe', 'jane.doe@sjsu.edu', 'Psychology', 'Female', '2001-09-28', 'Milpitas', '321 Milpitas Blvd, Milpitas, CA 95035', '4084567890', '4080987654', 'student123', 'student');

-- Insert sample course data
INSERT INTO Course (name, department, credits) VALUES
('Introduction to Programming', 'Computer Science', 3),
('Data Structures', 'Computer Science', 4),
('Database Systems', 'Computer Science', 3),
('Web Development', 'Computer Science', 3),
('Calculus I', 'Mathematics', 4),
('Introduction to Psychology', 'Psychology', 3),
('Business Management', 'Business', 3),
('Introduction to Economics', 'Economics', 3),
('English Composition', 'English', 3),
('Software Engineering', 'Computer Science', 4);

-- Insert sample faculty data
INSERT INTO Faculty (employee_id, firstName, lastName, email, department, gender, date_of_birth, city, postal_address, mobile_number, alternate_mobile_number, password, role) VALUES
('F001', 'Emily', 'Clark', 'emily.clark@sjsu.edu', 'Computer Science', 'Female', '1980-05-15', 'San Jose', '123 Faculty Lane, San Jose, CA 95112', '4081234567', '4089876543', 'faculty123', 'faculty'),
('F002', 'Michael', 'Wilson', 'michael.wilson@sjsu.edu', 'Mathematics', 'Male', '1975-08-20', 'Santa Clara', '456 Faculty Drive, Santa Clara, CA 95050', '4082345678', '4088765432', 'faculty123', 'faculty'),
('F003', 'Sarah', 'Johnson', 'sarah.johnson@sjsu.edu', 'Psychology', 'Female', '1985-03-10', 'Campbell', '789 Professor Road, Campbell, CA 95008', '4083456789', '4089876543', 'faculty123', 'faculty'),
('F004', 'Robert', 'Brown', 'robert.brown@sjsu.edu', 'Business', 'Male', '1970-11-25', 'Milpitas', '321 Instructor Street, Milpitas, CA 95035', '4084567890', '4080987654', 'faculty123', 'faculty'),
('F005', 'Jennifer', 'Davis', 'jennifer.davis@sjsu.edu', 'English', 'Female', '1982-07-08', 'San Jose', '654 Teacher Circle, San Jose, CA 95120', '4085678901', '4081098765', 'faculty123', 'faculty');

-- Insert sample enrollment data (Fall 2025 semester)
INSERT INTO Enrollment (studentID, courseID, semester, enrolledOn) VALUES
(1, 1, 'Fall 2025', '2025-05-01'),
(1, 2, 'Fall 2025', '2025-05-01'),
(1, 3, 'Fall 2025', '2025-05-01'),
(2, 1, 'Fall 2025', '2025-05-01'),
(2, 3, 'Fall 2025', '2025-05-01'),
(2, 5, 'Fall 2025', '2025-05-01'),
(3, 2, 'Fall 2025', '2025-05-01'),
(3, 4, 'Fall 2025', '2025-05-01'),
(3, 10, 'Fall 2025', '2025-05-01'),
(4, 6, 'Fall 2025', '2025-05-01'),
(4, 7, 'Fall 2025', '2025-05-01'),
(4, 9, 'Fall 2025', '2025-05-01'),
(5, 5, 'Fall 2025', '2025-05-01'),
(5, 6, 'Fall 2025', '2025-05-01'),
(5, 8, 'Fall 2025', '2025-05-01');

-- Insert sample Spring 2025 enrollment data (previous semester)
INSERT INTO Enrollment (studentID, courseID, semester, enrolledOn) VALUES
(1, 5, 'Spring 2025', '2025-01-15'),
(1, 9, 'Spring 2025', '2025-01-15'),
(2, 2, 'Spring 2025', '2025-01-15'),
(2, 4, 'Spring 2025', '2025-01-15'),
(3, 1, 'Spring 2025', '2025-01-15'),
(3, 5, 'Spring 2025', '2025-01-15'),
(4, 5, 'Spring 2025', '2025-01-15'),
(4, 8, 'Spring 2025', '2025-01-15'),
(5, 1, 'Spring 2025', '2025-01-15'),
(5, 3, 'Spring 2025', '2025-01-15');

-- Insert sample grade data for Spring 2025
INSERT INTO Grade_Report (studentID, courseID, semester, grade, reportedOn) VALUES
(1, 5, 'Spring 2025', 'A', '2025-05-20'),
(1, 9, 'Spring 2025', 'B+', '2025-05-20'),
(2, 2, 'Spring 2025', 'A-', '2025-05-20'),
(2, 4, 'Spring 2025', 'B', '2025-05-20'),
(3, 1, 'Spring 2025', 'A', '2025-05-20'),
(3, 5, 'Spring 2025', 'B-', '2025-05-20'),
(4, 5, 'Spring 2025', 'C+', '2025-05-20'),
(4, 8, 'Spring 2025', 'B', '2025-05-20'),
(5, 1, 'Spring 2025', 'A', '2025-05-20'),
(5, 3, 'Spring 2025', 'A-', '2025-05-20');

-- Insert sample faculty teaching assignments
INSERT INTO Teaches (employeeID, courseID, semester, assignedOn) VALUES
(1, 1, 'Fall 2025', '2025-05-01'),
(1, 2, 'Fall 2025', '2025-05-01'),
(1, 3, 'Fall 2025', '2025-05-01'),
(2, 5, 'Fall 2025', '2025-05-01'),
(3, 6, 'Fall 2025', '2025-05-01'),
(4, 7, 'Fall 2025', '2025-05-01'),
(4, 8, 'Fall 2025', '2025-05-01'),
(5, 9, 'Fall 2025', '2025-05-01'),
(1, 4, 'Fall 2025', '2025-05-01'),
(1, 10, 'Fall 2025', '2025-05-01');

-- Insert previous semester teaching assignments
INSERT INTO Teaches (employeeID, courseID, semester, assignedOn) VALUES
(1, 1, 'Spring 2025', '2024-12-01'),
(1, 3, 'Spring 2025', '2024-12-01'),
(1, 4, 'Spring 2025', '2024-12-01'),
(2, 5, 'Spring 2025', '2024-12-01'),
(5, 9, 'Spring 2025', '2024-12-01'),
(4, 8, 'Spring 2025', '2024-12-01'); 