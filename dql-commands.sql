
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

insert into student (student_id, first_name, last_name, dept_number, age, salary) values (1, "Refaat1", "Al Ktifan1", 1, 20, 93425.63);
insert into student values (2, "Refaat2", "Al Ktifan2", 2, 40, 83425.63);
insert into student values (3, "Refaat3", "Al Ktifan3", 3, 50, 83625.63);
insert into student values (4, "Refaat4", "Al Ktifan4", 5, 25, 83765.23);
insert into student values (5, "Refaat5", "Al Ktifan5", 4, 36, 103425.63);
insert into student values (6, "Refaat6", "Al Ktifan6", 6, 71, 113425.63);

-- display table
select * from student;

-- select only specified columns
select student_id, first_name from student;

-- select only few rows
select student_id, first_name from student where age > 25;
