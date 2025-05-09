-- Insert sample courses
INSERT INTO Course (courseID, name)
VALUES 
    (1, 'Introduction to Software Engineering'),
    (2, 'Data Structures and Algorithms'),
    (3, 'Database Management Systems'),
    (4, 'Operating Systems'),
    (5, 'Web Development');

-- Insert sample faculty
INSERT INTO Faculty (employeeID, firstName, lastName, email, department)
VALUES 
    (1, 'John', 'Doe', 'john.doe@sjsu.edu', 'Computer Science'),
    (2, 'Jane', 'Smith', 'jane.smith@sjsu.edu', 'Software Engineering');

-- Insert sample teaches relationships (faculty teaching courses)
INSERT INTO Teaches (employeeID, courseID)
VALUES 
    (1, 1), -- John Doe teaches Introduction to Software Engineering
    (1, 2), -- John Doe teaches Data Structures and Algorithms
    (2, 3), -- Jane Smith teaches Database Management Systems
    (2, 4), -- Jane Smith teaches Operating Systems
    (2, 5); -- Jane Smith teaches Web Development

-- Insert sample enrollments (students enrolled in courses)
INSERT INTO Enrollment (studentID, courseID)
VALUES 
    (1, 1), -- Student S123456789 enrolled in Introduction to Software Engineering
    (1, 2), -- Student S123456789 enrolled in Data Structures and Algorithms
    (1, 3), -- Student S123456789 enrolled in Database Management Systems
    (1, 4), -- Student S123456789 enrolled in Operating Systems
    (1, 5); -- Student S123456789 enrolled in Web Development

-- Insert sample grade reports
INSERT INTO Grade_Report (studentID, courseID, grade, reportedOn)
VALUES 
    (1, 1, 'A', '2025-05-01 10:00:00'), -- Grade for Introduction to Software Engineering
    (1, 2, 'B+', '2025-05-02 11:00:00'), -- Grade for Data Structures and Algorithms
    (1, 3, 'A-', '2025-05-03 12:00:00'), -- Grade for Database Management Systems
    (1, 4, 'B', '2025-05-04 13:00:00'), -- Grade for Operating Systems
    (1, 5, 'A', '2025-05-05 14:00:00'); -- Grade for Web Development