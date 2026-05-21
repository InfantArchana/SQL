select * from students;

-- Start a transaction
START TRANSACTION;

-- Insert a new student
INSERT INTO students (first_name, last_name, email, enrollment_date) 
VALUES ('Kevin', 'John', 'kevin.john@example.com', '2026-05-16');

-- Savepoint before update
SAVEPOINT before_update;

-- Update email of a student
UPDATE students 
SET email = 'invalid.email@example.com' 
WHERE student_id = 2;

-- Rollback to the savepoint
ROLLBACK TO before_update;

SHOW ERRORs;

-- Disable autocommit
SET autocommit = 0;

-- Start a transaction
START TRANSACTION;  

-- Check original value
SELECT * FROM students WHERE student_id = 3;

-- Create savepoint
SAVEPOINT before_update;

-- Update email
UPDATE students
SET email = 'valid.email@example.com'
WHERE student_id = 3;

-- Check original value
SELECT * FROM students WHERE student_id = 3;

-- Rollback to savepoint
ROLLBACK TO before_update;

SELECT * FROM students WHERE student_id = 3;

-- Commit the remaining changes
COMMIT;

select * from students;

-- 2) set constraints
SET FOREIGN_KEY_CHECKS = 0;

-- Perform operations that violate constraints
DELETE FROM students WHERE student_id = 1;

SET FOREIGN_KEY_CHECKS = 1;


