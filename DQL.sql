-- DATA QUERY LANGUAGE
-- SELECT, WHERE CLAUSE, LOGICAL OPERATORS, ORDER BY, LIMIT, AGGREGATION WITH GROUP BY, 

USE school;
-- 1) Basic SELECT query
-- Fetch all columns from 'students' table.
SELECT * from students;

-- 2) SELECT specific columns.
-- Fetch only first_name and email columns
SELECT first_name, email
FROM students;

-- 3) WHERE Clause 
-- Fetch students enrolled after a specific date
SELECT first_name, last_name, enrollment_date
FROM students
WHERE enrollment_date > '2026-05-01';

select * from students;

-- 4) LOGICAL OPERATORS
-- Fetch students enrolled in 2026 with a specific last_name
SELECT first_name, last_name, enrollment_date
FROM students
WHERE enrollment_date BETWEEN '2026-01-01' AND '2026-05-16'
AND last_name = 'wong'

-- 5) ORDER BY
-- Fetch students ordered ny enrollment_date in descending order.
SELECT first_name, last_name, enrollment_date
FROM students
ORDER BY enrollment_date DESC; 

-- 6) LIMIT
-- Fetch the first five rows
SELECT first_name, last_name
FROM students
LIMIT 5;

-- 7) Aggregation with GROUP BY
-- Perform calculations on groups of rows using aggregate fucntions
-- Common Aggregate Functions
-- COUNT() - Counts the number of rows
-- SUM() - Adds up values
-- AVG() - Calculates the average
-- MAX() - Finds the maximum values
-- MIN() - Finds the minimum value

ALTER TABLE students
ADD marks VARCHAR(3);

ALTER TABLE students
MODIFY marks int;

DELETE FROM students WHERE student_id is null;

select * from students;

UPDATE students
SET marks = CASE
	WHEN student_id = 2 THEN 35
    WHEN student_id = 3 THEN 45
    WHEN student_id = 4 THEN 55
	WHEN student_id = 5 THEN 60
	WHEN student_id = 6 THEN 80
    ELSE marks
END
WHERE student_id IN (2,3,4,5,6);

-- Count the number of students by enrollment_date
SELECT enrollment_date, COUNT(*) AS total_students
FROM students 
GROUP BY enrollment_date;

-- Calculate the total marks of all students
SELECT sum(marks) AS total_marks
FROM students;

-- Calculate the average marks of all students
SELECT avg(marks) AS averageMark
FROM students;

-- Calculate the Minimum mark
SELECT min(marks) AS minMark
FROM students;

-- Calculate the Maximum mark
SELECT max(marks) AS maxMark
FROM students;

-- Combined Aggregations
SELECT 
	SUM(marks) AS total_mark,
    AVG(marks) AS avg_mark,
    MIN(marks) AS min_mark,
    MAX(marks) AS max_mark
FROM students;

SELECT 
	SUM(marks) AS total_mark,
    AVG(marks) AS avg_mark,
    MIN(marks) AS min_mark,
    MAX(marks) AS max_mark
FROM students
GROUP BY student_id; 

-- HAVING Clause
-- Fetch enrollment dates with more than 5 students
SELECT enrollment_date, COUNT(*) AS total_students 
FROM students 
GROUP BY enrollment_date 
HAVING total_students > 0;

SHOW TABLES;

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;
SELECT * FROM student_registration;

INSERT INTO courses(course_id, Course_name, credits)
VALUES 
(101, 'AI', 3),
(102, 'SQL', 2),
(103, 'ML', 4),    
(104, 'DS', 5),
(105, 'NLP', 2);

SHOW CREATE TABLE enrollments;

ALTER TABLE enrollments
DROP FOREIGN KEY enrollments_ibfk_1;

ALTER TABLE enrollments
ADD CONSTRAINT fk_student
FOREIGN KEY (student_id)
REFERENCES students(student_id);

INSERT INTO enrollments(enrollment_id, student_id, course_id)
VALUES 
(1, 2, 101),
(2, 2, 102),
(3, 3, 103),
(4, 4, 104),
(5, 5, 105);



-- INNER JOINS
-- Fetch students and their associated course name
SELECT students.student_id, students.first_name, students.last_name, courses.course_name, courses.course_id
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id;

-- LEFT JOIN
-- Fetch all students, including those not enrolled in any course
SELECT students.first_name, courses.course_name
FROM students
LEFT JOIN enrollments ON students.student_id = enrollments.student_id
LEFT JOIN courses ON enrollments.course_id = courses.course_id;


-- RIGHT JOIN
SELECT students.student_id, students.first_name
FROM students
RIGHT JOIN enrollments ON students.student_id = enrollments.student_id;














