-- Data Definition Language (DDL)
-- 1) CREATE A DATABASE
-- Create a database named 'school'
CREATE DATABASE school;

-- USE db_name; is used to select a database so MySQL knows which database you want to work with.
USE school;

-- Displays all databases in the MySQL server
SHOW DATABASES;

-- 2) CREATE TABLE
-- create a table named 'students'
CREATE TABLE students (
	student_id INT AUTO_INCREMENT PRIMARY KEY,               -- Unique id, student_id increases the number automatically
    first_name VARCHAR(50) NOT NULL,                         -- Cannot be null
    last_name VARCHAR(50),                                   -- Optional
    email VARCHAR(100) UNIQUE,                               -- Must be unique
    enrollment_date TIMESTAMP  DEFAULT CURRENT_TIMESTAMP     -- Default to today's date
    );
    
SELECT * from students;   -- Check the columns are added to the table 'students'

SHOW ERRORS;
    
-- 3) ALTERING TABLES
-- Add a new column 'phone_number' to the 'students' table
ALTER TABLE students
ADD phone_number VARCHAR(15);

SELECT * from student_registration;
ALTER TABLE student_registration
ADD gender ENUM ('Male', 'Female');

SHOW COLUMNS FROM student_registration;

SHOW TABLES;

DESCRIBE table_name;

-- Modify the 'last_name' column to Not Null

ALTER TABLE students
MODIFY last_name VARCHAR(50) NOT NULL;

-- Rename the 'students' table to 'student_registration'
ALTER TABLE students
RENAME TO student_registration;

SELECT * from student_registration; 

-- 4) DROPPING TABLE
-- Drop the table 'student_registration'
-- DROP TABLE university_students; (Use this, to remove the table)

-- 5) Creating Constraints
-- Create a table with constraints
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL UNIQUE,
    credits INT CHECK (credits BETWEEN 1 AND 5)    -- Ensures credits are between the values 1 and 5
);

-- 6) Create a table with a foreign key
CREATE TABLE enrollments (
	enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES student_registration(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
    );

    SHOW TABLES;
    
-- 7) Remove all rows from the 'students_registration' table
TRUNCATE TABLE student_registration;

-- 8) To delete single column
ALTER TABLE student_registration
DROP COLUMN gender;
