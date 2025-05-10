-- Script to add additional data to ensure at least 15 entries per table

-- Additional Student data
INSERT INTO Student (student_id, firstName, lastName, email, major, gender, date_of_birth, city, postal_address, mobile_number, alternate_mobile_number, password, role) VALUES
('678901234', 'Emma', 'Wilson', 'emma.wilson@sjsu.edu', 'Computer Science', 'Female', '2000-02-15', 'San Jose', '222 Campus Way, San Jose, CA 95112', '4085551111', '4085552222', 'student123', 'student'),
('789012345', 'Michael', 'Johnson', 'michael.johnson@sjsu.edu', 'Electrical Engineering', 'Male', '1999-07-22', 'Santa Clara', '333 Engineering Dr, Santa Clara, CA 95051', '4085553333', '4085554444', 'student123', 'student'),
('890123456', 'Sophia', 'Martinez', 'sophia.martinez@sjsu.edu', 'Business Administration', 'Female', '2001-11-08', 'Sunnyvale', '444 Business Ave, Sunnyvale, CA 94086', '4085555555', '4085556666', 'student123', 'student'),
('901234567', 'Daniel', 'Lopez', 'daniel.lopez@sjsu.edu', 'Mathematics', 'Male', '2000-05-30', 'Cupertino', '555 Math Blvd, Cupertino, CA 95014', '4085557777', '4085558888', 'student123', 'student'),
('123789456', 'Olivia', 'Garcia', 'olivia.garcia@sjsu.edu', 'Psychology', 'Female', '1998-09-12', 'Campbell', '666 Psych St, Campbell, CA 95008', '4085559999', '4085550000', 'student123', 'student'),
('234890567', 'William', 'Rodriguez', 'william.rodriguez@sjsu.edu', 'Mechanical Engineering', 'Male', '2002-03-24', 'San Jose', '777 Mech Lane, San Jose, CA 95120', '4085551234', '4085555678', 'student123', 'student'),
('345901678', 'Ava', 'Hernandez', 'ava.hernandez@sjsu.edu', 'Nursing', 'Female', '2001-08-17', 'Milpitas', '888 Health Rd, Milpitas, CA 95035', '4085559876', '4085553456', 'student123', 'student'),
('456012789', 'James', 'Nguyen', 'james.nguyen@sjsu.edu', 'Computer Engineering', 'Male', '1999-12-05', 'San Jose', '999 Tech Circle, San Jose, CA 95131', '4085557890', '4085551234', 'student123', 'student'),
('567123890', 'Isabella', 'Kim', 'isabella.kim@sjsu.edu', 'Biology', 'Female', '2000-06-29', 'Santa Clara', '111 Science Way, Santa Clara, CA 95054', '4085552345', '4085556789', 'student123', 'student'),
('678234901', 'Alexander', 'Patel', 'alexander.patel@sjsu.edu', 'Physics', 'Male', '1998-04-11', 'San Jose', '222 Physics Dr, San Jose, CA 95134', '4085558901', '4085554567', 'student123', 'student');

-- Additional Faculty data
INSERT INTO Faculty (employee_id, firstName, lastName, email, department, gender, date_of_birth, city, postal_address, mobile_number, alternate_mobile_number, password, role) VALUES
('F006', 'David', 'Smith', 'david.smith@sjsu.edu', 'Computer Science', 'Male', '1975-06-14', 'San Jose', '123 Professor St, San Jose, CA 95112', '4085551122', '4085552233', 'faculty123', 'faculty'),
('F007', 'Nancy', 'Taylor', 'nancy.taylor@sjsu.edu', 'Electrical Engineering', 'Female', '1980-09-22', 'Santa Clara', '234 Faculty Ave, Santa Clara, CA 95051', '4085553344', '4085554455', 'faculty123', 'faculty'),
('F008', 'Thomas', 'Anderson', 'thomas.anderson@sjsu.edu', 'Mathematics', 'Male', '1972-03-17', 'Sunnyvale', '345 Instructor Dr, Sunnyvale, CA 94087', '4085555566', '4085556677', 'faculty123', 'faculty'),
('F009', 'Elizabeth', 'White', 'elizabeth.white@sjsu.edu', 'Psychology', 'Female', '1983-11-29', 'Cupertino', '456 Teacher Lane, Cupertino, CA 95014', '4085557788', '4085558899', 'faculty123', 'faculty'),
('F010', 'James', 'Harris', 'james.harris@sjsu.edu', 'Business', 'Male', '1970-08-05', 'San Jose', '567 Professor Rd, San Jose, CA 95120', '4085559900', '4085550011', 'faculty123', 'faculty'),
('F011', 'Susan', 'Lee', 'susan.lee@sjsu.edu', 'Physics', 'Female', '1978-04-12', 'Campbell', '678 Faculty St, Campbell, CA 95008', '4085551177', '4085552288', 'faculty123', 'faculty'),
('F012', 'Robert', 'Garcia', 'robert.garcia@sjsu.edu', 'Mechanical Engineering', 'Male', '1982-01-23', 'Milpitas', '789 Instructor Ave, Milpitas, CA 95035', '4085553399', '4085554400', 'faculty123', 'faculty'),
('F013', 'Patricia', 'Martinez', 'patricia.martinez@sjsu.edu', 'Biology', 'Female', '1976-09-07', 'San Jose', '890 Teacher Blvd, San Jose, CA 95131', '4085555511', '4085556622', 'faculty123', 'faculty'),
('F014', 'John', 'Wang', 'john.wang@sjsu.edu', 'Computer Engineering', 'Male', '1981-05-18', 'Santa Clara', '901 Professor Dr, Santa Clara, CA 95054', '4085557733', '4085558844', 'faculty123', 'faculty'),
('F015', 'Barbara', 'Chen', 'barbara.chen@sjsu.edu', 'Chemistry', 'Female', '1973-12-25', 'San Jose', '012 Faculty Lane, San Jose, CA 95134', '4085559955', '4085550066', 'faculty123', 'faculty');

-- Additional Course data
INSERT INTO Course (name, department, credits) VALUES
('Advanced Programming', 'Computer Science', 4),
('Computer Networks', 'Computer Science', 3),
('Machine Learning', 'Computer Science', 4),
('Artificial Intelligence', 'Computer Science', 3),
('Operating Systems', 'Computer Science', 4),
('Computer Architecture', 'Computer Engineering', 3),
('Calculus II', 'Mathematics', 4),
('Linear Algebra', 'Mathematics', 3),
('Quantum Physics', 'Physics', 4),
('Organic Chemistry', 'Chemistry', 4),
('Molecular Biology', 'Biology', 3),
('Anatomy and Physiology', 'Biology', 4),
('Microeconomics', 'Economics', 3),
('Financial Accounting', 'Business', 3),
('Marketing Management', 'Business', 3);

-- Additional Enrollment data (Fall 2025 semester)
INSERT INTO Enrollment (studentID, courseID, semester, enrolledOn) VALUES
(6, 7, 'Fall 2025', '2025-05-01'),
(6, 11, 'Fall 2025', '2025-05-01'),
(7, 13, 'Fall 2025', '2025-05-01'),
(7, 14, 'Fall 2025', '2025-05-01'),
(8, 15, 'Fall 2025', '2025-05-01'),
(8, 7, 'Fall 2025', '2025-05-01'),
(9, 6, 'Fall 2025', '2025-05-01'),
(9, 8, 'Fall 2025', '2025-05-01'),
(10, 9, 'Fall 2025', '2025-05-01'),
(10, 10, 'Fall 2025', '2025-05-01'),
(11, 11, 'Fall 2025', '2025-05-01'),
(11, 12, 'Fall 2025', '2025-05-01'),
(12, 13, 'Fall 2025', '2025-05-01'),
(12, 14, 'Fall 2025', '2025-05-01'),
(13, 15, 'Fall 2025', '2025-05-01'),
(13, 6, 'Fall 2025', '2025-05-01'),
(14, 7, 'Fall 2025', '2025-05-01'),
(14, 8, 'Fall 2025', '2025-05-01'),
(15, 9, 'Fall 2025', '2025-05-01'),
(15, 10, 'Fall 2025', '2025-05-01');

-- Additional Enrollment data (Spring 2025 semester)
INSERT INTO Enrollment (studentID, courseID, semester, enrolledOn) VALUES
(6, 6, 'Spring 2025', '2025-01-15'),
(6, 8, 'Spring 2025', '2025-01-15'),
(7, 9, 'Spring 2025', '2025-01-15'),
(7, 10, 'Spring 2025', '2025-01-15'),
(8, 11, 'Spring 2025', '2025-01-15'),
(8, 12, 'Spring 2025', '2025-01-15'),
(9, 13, 'Spring 2025', '2025-01-15'),
(9, 14, 'Spring 2025', '2025-01-15'),
(10, 15, 'Spring 2025', '2025-01-15'),
(10, 6, 'Spring 2025', '2025-01-15'),
(11, 7, 'Spring 2025', '2025-01-15'),
(11, 8, 'Spring 2025', '2025-01-15'),
(12, 9, 'Spring 2025', '2025-01-15'),
(12, 10, 'Spring 2025', '2025-01-15'),
(13, 11, 'Spring 2025', '2025-01-15'),
(13, 12, 'Spring 2025', '2025-01-15'),
(14, 13, 'Spring 2025', '2025-01-15'),
(14, 14, 'Spring 2025', '2025-01-15'),
(15, 15, 'Spring 2025', '2025-01-15'),
(15, 6, 'Spring 2025', '2025-01-15');

-- Additional Grade_Report data for Spring 2025
INSERT INTO Grade_Report (studentID, courseID, semester, grade, reportedOn) VALUES
(6, 6, 'Spring 2025', 'A-', '2025-05-20'),
(6, 8, 'Spring 2025', 'B+', '2025-05-20'),
(7, 9, 'Spring 2025', 'A', '2025-05-20'),
(7, 10, 'Spring 2025', 'B', '2025-05-20'),
(8, 11, 'Spring 2025', 'B+', '2025-05-20'),
(8, 12, 'Spring 2025', 'A-', '2025-05-20'),
(9, 13, 'Spring 2025', 'B', '2025-05-20'),
(9, 14, 'Spring 2025', 'C+', '2025-05-20'),
(10, 15, 'Spring 2025', 'A', '2025-05-20'),
(10, 6, 'Spring 2025', 'B-', '2025-05-20'),
(11, 7, 'Spring 2025', 'A-', '2025-05-20'),
(11, 8, 'Spring 2025', 'B+', '2025-05-20'),
(12, 9, 'Spring 2025', 'A', '2025-05-20'),
(12, 10, 'Spring 2025', 'B', '2025-05-20'),
(13, 11, 'Spring 2025', 'B-', '2025-05-20'),
(13, 12, 'Spring 2025', 'C+', '2025-05-20'),
(14, 13, 'Spring 2025', 'A', '2025-05-20'),
(14, 14, 'Spring 2025', 'A-', '2025-05-20'),
(15, 15, 'Spring 2025', 'B+', '2025-05-20'),
(15, 6, 'Spring 2025', 'B', '2025-05-20');

-- Additional Teaches assignments for Fall 2025
INSERT INTO Teaches (employeeID, courseID, semester, assignedOn) VALUES
(6, 11, 'Fall 2025', '2025-05-01'),
(6, 12, 'Fall 2025', '2025-05-01'),
(7, 13, 'Fall 2025', '2025-05-01'),
(7, 14, 'Fall 2025', '2025-05-01'),
(8, 15, 'Fall 2025', '2025-05-01'),
(8, 6, 'Fall 2025', '2025-05-01'),
(9, 7, 'Fall 2025', '2025-05-01'),
(9, 8, 'Fall 2025', '2025-05-01'),
(10, 9, 'Fall 2025', '2025-05-01'),
(10, 10, 'Fall 2025', '2025-05-01'),
(11, 11, 'Fall 2025', '2025-05-01'),
(11, 12, 'Fall 2025', '2025-05-01'),
(12, 13, 'Fall 2025', '2025-05-01'),
(12, 14, 'Fall 2025', '2025-05-01'),
(13, 15, 'Fall 2025', '2025-05-01');

-- Additional Teaches assignments for Spring 2025
INSERT INTO Teaches (employeeID, courseID, semester, assignedOn) VALUES
(6, 6, 'Spring 2025', '2024-12-01'),
(7, 7, 'Spring 2025', '2024-12-01'),
(8, 8, 'Spring 2025', '2024-12-01'),
(9, 9, 'Spring 2025', '2024-12-01'),
(10, 10, 'Spring 2025', '2024-12-01'),
(11, 11, 'Spring 2025', '2024-12-01'),
(12, 12, 'Spring 2025', '2024-12-01'),
(13, 13, 'Spring 2025', '2024-12-01'),
(14, 14, 'Spring 2025', '2024-12-01'),
(15, 15, 'Spring 2025', '2024-12-01'); 