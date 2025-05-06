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