
-- Creating database
create database cheatsheet;

-- Viewing the databases
show databases;

-- using the database
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

create table class
(
    class_number int,
    class_name varchar(50),
    class_location varchar(50),
    st_id int,
    primary key(class_number)                -- Setting primary key(2nd method)
);

-- veiwing tables in the selected database
show tables;

-- print the structure of the table
describe student;
desc student;
show columns in student;

-- renaming of table
rename table student to student_table;
alter table student_table rename to student;

-- reanaming a column
alter table student change column student_id st_id int;

-- add a constraint to column
alter table student change column first_name first_name varchar(50) not null;

-- add column
alter table student add column salary real;

-- drop a column
alter table student drop column salary;

-- modify the datatype
alter table student modify column salary int;

-- truncate a table
truncate student;

-- drop table
drop table class;

-- drop database
drop database cheatsheet;
