
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

insert into student (student_id, first_name, last_name, class_number, age, salary) values (1, "Refaat0", "Al Ktifan0", 1, 18, 93425.63);
insert into student values (2, "Refaat1", "Al Ktifan1", 2, 40, 83425.63);
insert into student values (3, "Refaat2", "Al Ktifan2", 3, 50, 83625.63);
insert into student values (4, "Refaat3", "Al Ktifan3", 5, 25, 83765.23);
insert into student values (5, "Refaat4", "Al Ktifan4", 4, 36, 103425.63);
insert into student values (6, "Refaat5", "Al Ktifan5", 6, 71, 113425.63);

-- create a view
create view personal_info as select first_name, last_name, age from student;

-- displaying view
select * from personal_info;

-- updating in view
update personal_info set salary = 1.1 * salary;

-- deleting record from view
delete from personal_info where age < 40;

-- droping a view
drop view personal_info;
