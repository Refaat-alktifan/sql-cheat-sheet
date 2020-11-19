-- Query only the name and major field from table
SELECT name, major
FROM student;

-- Same principle as above and it is now sorting the name field in alphabetical order
SELECT name, major
FROM student
ORDER BY name;

-- Same principle as above but it is now sorting the name field in alphabetical descending order
SELECT name, major
FROM student
ORDER BY name DESC;

-- Here we are sorting by major first and then by student_id
SELECT *
FROM student
ORDER BY major, student_id;

-- Select and retrieve only 2 first students
SELECT *
FROM student
LIMIT 2;

-- select and retrieve the last 2 students from table
SELECT *
FROM student
ORDER BY student_id DESC
LIMIT 2;

SELECT *
FROM student
WHERE major = 'AP';

SELECT * FROM student;

-- <, >, <=, >=, =, <>, AND, OR

-- Selecting students with student_id of less than 3 and that doesn't have the name Refaat
SELECT *
FROM student
WHERE student_id < 3 AND name <> 'Refaat';

--We are selecting from table only the students that have the names 'Refaat', 'Ahmad' or 'Khaled'
SELECT *
FROM student
WHERE name IN ('Refaat', 'Ahmad', 'Khaled');
