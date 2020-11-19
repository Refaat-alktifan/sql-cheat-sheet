
-- creating basic stuff to work on them
create database cheatsheet;
use cheatsheet;

create table student
(
    student_id int primary key,              -- Setting primary key(1st method)
    first_name varchar(50),
    last_name varchar(50),
    class_number int,
    age int,
    salary real
);

SELECT first_name, salary FROM student WHERE salary>(
	SELECT AVG(salary) FROM student
) ORDER BY salary DESC

-- Subqueries ➔ Wrap a query within a query in brackets. The above example retrieves all the student that salary more than the average salary (and then orders them in DESC).

SELECT first_name, MIN(salary) FROM student WHERE first_name LIKE '%refaat' AND class_number IN (
	SELECT class_number FROM student WHERE first_name LIKE '%Refaat'
)
