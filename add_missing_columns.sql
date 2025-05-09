-- Add the missing columns needed by the ProfileService

-- Add additional columns to the Student table
ALTER TABLE Student
ADD COLUMN date_of_birth DATE AFTER major,
ADD COLUMN gender VARCHAR(10) AFTER date_of_birth,
ADD COLUMN city VARCHAR(50) AFTER gender,
ADD COLUMN postal_address TEXT AFTER city,
ADD COLUMN mobile_number VARCHAR(20) AFTER postal_address,
ADD COLUMN alternate_mobile_number VARCHAR(20) AFTER mobile_number;

-- Update our sample student with additional data
UPDATE Student
SET 
    date_of_birth = '2001-01-01',
    gender = 'Male',
    city = 'San Jose',
    postal_address = '6969 Farpost CT, San Jose, CA 95121',
    mobile_number = '0234567891',
    alternate_mobile_number = '0509876543'
WHERE student_id = '123456789';

-- Create some sample course data if not exists
INSERT IGNORE INTO Course (courseID, name)
VALUES 
    (1, 'Introduction to Programming'),
    (2, 'Data Structures'),
    (3, 'Database Systems'),
    (4, 'Web Development');

-- Create some sample enrollments
INSERT IGNORE INTO Enrollment (studentID, courseID, enrolledOn)
VALUES 
    (1, 1, CURRENT_DATE),
    (1, 2, CURRENT_DATE),
    (1, 3, CURRENT_DATE);

-- Add some sample grades
INSERT IGNORE INTO Grade_Report (studentID, courseID, grade, reportedOn)
VALUES 
    (1, 1, 'A', CURRENT_DATE),
    (1, 2, 'B+', CURRENT_DATE),
    (1, 3, 'A-', CURRENT_DATE); 