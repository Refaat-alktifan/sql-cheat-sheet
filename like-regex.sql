
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

SELECT first_name FROM student WHERE name LIKE 'Ref%'

-- LIKE + % ➔ Returns all names that start with Ref%. '%' .

SELECT last_name FROM student WHERE last_name LIKE '_L'

-- LIKE + _ ➔ The '_' wildcard specifies a single character wildcard.

SELECT first_name FROM student WHERE name REGEXP 'new'

-- REGEXP ➔ Allows for a regular expression to be used.
