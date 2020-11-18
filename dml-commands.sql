
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

-- complete insert (1st method)
insert into student (student_id, first_name, last_name, class_number, age, salary) values (1, "Anurag", "Peddi", 1, 20, 93425.63);

-- complete insert (2nd method)
insert into student values (2, "Anuhya", "Peddi", 2, 20, 83425.63);

-- insert partially
insert into student (student_id, first_name) values (3, "Vageesh");

-- updating all rows
update student set salary = 1.1 * salary;

-- updating a specified row
update student set salary = 1.2 * salary where student_id = 1;

-- delete a specified row
delete from student where student_id = 2;

-- delete all rows
delete from student;
