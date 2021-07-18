# SQL cheat sheet

## Data Definition Language (DDL)

#### Create Database
```sql
create database cheatsheet;
```

#### Use Database
```sql
use cheatsheet;
```

#### Show Databases
```sql
show databases;
```

#### Create Table
```sql
create table student
(
    student_id int primary key,              -- Setting primary key(first method)
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
    primary key(class_number)                -- Setting primary key(secund method)
);
```

#### Show Tables
```sql
show tables;
```

#### Describe Table
```sql
describe student;
desc student;
show columns in student;
```

#### Rename Table
```sql
# rename table student to student_table;
alter table student_table rename to student;
```

#### Renaming Column
```sql
alter table student change column student_id st_id int;
```

#### Add Constraint to Column
```sql
alter table student change column first_name first_name varchar(50) not null;
```

#### Add Column
```sql
alter table student add column salary real;
```

#### Drop Column
```sql
alter table student drop column salary;
```

#### Modify the Datatype of column
```sql
alter table student modify column salary int;
```

#### Truncate Table
```sql
truncate student;
```

#### Drop Table
```sql
drop table student;
```

#### Drop Database
```sql
drop database student;
```
## Data Manipulation Language (DML)

#### Insertion (Complete)
```sql
insert into student (student_id, first_name, last_name, class_number, age, salary) values (1, "Refaat", "AL Ktifan", 1, 18, 100000.00);

insert into student values (2, "Mohammad", "Mohammad", 2, 20, 50000.22);
```
#### Insertion (Partial)
```sql
insert into student (student_id, first_name) values (3, "Khaled");
```

#### Updating all rows
```sql
update student set salary = 1.1 * salary;
```

#### Updating a specified row
```sql
update student set salary = 1.2 * salary where student_id = 1;
```

#### Delete a specified row
```sql
delete from student where student_id = 2;
```

#### Delete all rows
```sql
delete from student;
```

#### Enabling foreign key checks
```sql
set foreign_key_checks = 1;
```

#### Disabling foreign key checks
```sql
set foreign_key_checks = 0;
```

## Data Query Language (DQL)

#### Display Table
```sql
select * from student;
```

#### Select only specified columns
```sql
select student_id, first_name from student;
```

#### Select only few rows
```sql
select student_id, first_name from student where age > 25;
```

#### Greater than(>)
```sql
select * from student where salary > 3100;
```

#### Greater than equal to(>=)
```sql
select * from student where salary >= 3100;
```

#### Less than(<)
```sql
select * from student where salary < 4500;
```

#### Less than equal to(<=)
```sql
select * from student where salary <= 4350;
```

#### Range
```sql
select * from student where salary > 3000 and salary < 4000;
```

#### BETWEEN and AND
```sql
select * from student where salary between 3000 and 4000;
```

#### NOT BETWEEN
```sql
select * from student where salary not between 3000 and 4000;
```

#### NOW
```sql
select now();
```

#### ORDER BY
```sql
select * from  student order by salary;

# Explanation: orders the rows from ACS = alphabetic or numeric order, or DESC the reverse

select * from  student order by age DESC/ASC
```

#### Like Operator
```sql
select * from student where name like '%Re%';          -- Similar to *Re* in regrex
```
```sql
select * from student where name like 'Re_';           -- Similar to Re. in regrex
```

#### CASE
```sql
select first_name , age, (case when age > 20 then 1 else 0 end ) as boolean from student;
```
#### concat function
```sql
select concat(first_name, " ", last_name) as name from student;
```

#### COALESCE
```sql
select last_name , coalesce(age,class_number) as result from student;
```

#### FORMAT
```sql
select last_name , format(salary, 3) as salary from student;
```

#### IF
```sql
select  last_name , if(salary < 50, 'salary is < 50', salary) as salary from student limit 5;
```

#### ELSE
```sql
select first_name as name , (if age > 18 then "under 18" else "over") as age from student;
```

#### IFNULL
```sql
select first_name , ifnull(age, salary) from student limit 5;
```

## Views

#### Create a view
```sql
create view personal_info as select first_name, last_name, age from student;
```

#### Displaying view
```sql
select * from personal_info;
```

#### Updating in view
```sql
update personal_info set salary = 1.1 * salary;
```

#### Deleting record from view
```sql
delete from personal_info where age < 40;
```

#### Droping a view
```sql
drop view personal_info;
```

## Joins
#### Inner join
```sql
select e.fname, p.pname from student as e inner join project as p on e.eid = p.eid;

-- or

select e.fname, p.pname from student as e join project as p on e.eid = p.eid;
```

#### Full outer join
```sql
select e.fname, p.pname from student as e left outer join project as p on e.eid = p.eid
union
select e.fname, p.pname from student as e right outer join project as p on e.eid = p.eid;
```

#### Left outer join
```sql
select e.fname, p.pname from student as e left outer join project as p on e.eid = p.eid;
```

#### Right outer join
```sql
select e.fname, p.pname from student as e right outer join project as p on e.eid = p.eid;
```

#### Left outer join - inner join
```sql
select e.fname, p.pname from student as e left outer join project as p on e.eid = p.eid where p.pname is null;
```

#### Right outer join - inner join
```sql
select e.fname, p.pname from student as e right outer join project as p on e.eid = p.eid where e.fname is null;
```

## TRIGGER

#### THE TRIGGER STRUCTURE
```sql
    DELIMITER $$
    CREATE TRIGGER  trigger_name
    [BEFORE|AFTER] [INSERT|UPDATE|DELETE] ON table_name
    FOR EACH ROW [FOLLOWS|PRECEDES] existing_trigger_name
    BEGIN
    …
    END$$
    DELIMITER ;
```

#### AFTER INSERT
```sql
create table student (id serial, name varchar(100), account decimal(5,2));

insert into student (name,account) values ('Refaat',500.28);

create table orders (id serial, name varchar(40), amount decimal(5,2) );

delimeter $
	create trigger trigger_exchange
		after insert on orders
		 for each row
		 	begin
		 		update student
				set account = account - new.amount
				where cust_id = new.cust_id;
			end $

insert into student (name,amount) values ('Mohammed', 10.28);
```

## Functions

#### Sum function
```sql
select sum(population) from city group by population;
```

#### Average function
```sql
select avg(population) from city group by population;
```

#### Count function
```sql
select district, count(district) from city group by district;
```

#### Maximum function
```sql
select max(population) from city group by population;
```

#### Minimum function
```sql
select min(population) from city group by population;
```

#### Standard deviation function
```sql
select stddev(population) from city group by population;
```

#### Group concat function
```sql
select group_concat(population) from city group by population;
```

#### Format function
```sql
FORMAT(number, decimal_places)
```

#### UPPER
```sql
UPPER(name);
```

#### length function
```sql
LENGTH(string)
```

#### substr function
```sql
SUBSTR(string, start, length)
```

#### time function
```sql
select student_id, first_name, time(student_registered) from student;
```

#### date function
```sql
select id, first_name, date(student_registered) from student ;
```

#### MD5
```sql
select md5("hello new world");    -- result: 6dc422ea4e83e014c4456706c72730f6
```

#### MD5
```sql
select sha1("test");    -- result: a94a8fe5ccb19ba61c4c0873d391e987982fbbd3
```
## Procedure

#### Creating procedure
```sql
create procedure display_dbs()
show databases;
```

#### Calling procedure
```sql
call display_dbs();
```

#### Drop procedure
```sql
drop procedure display_dbs;
```

## Transaction

#### Begin transaction
```sql
start transaction;
```

#### Create savepoint
```sql
savepoint sv_pt;
```

```sql
delete from city;       -- changing data in table
```

#### Rollback
```sql
rollback to sv_pt;
```

#### Releasing savepoint
```sql
release savepoint sv_pt;
```

#### Commiting changes
```sql
commit;
```

## Cloning

#### Duplicate a Table Schema
```sql
create table emp_dup like student;
```

#### Duplicate a Table
```sql
create table emp_dup select * from student;
```

## Programming

#### Declare variables
```sql
set @num = 10;
set @name = 'Anurag';
```

#### Print them
```sql
select @name;
```

#### For loop
```sql
set @n = 21;
select repeat("* ", @n := @n - 1) from information_schema.tables where @n > 0;
```

## Miscellaneous

#### Round
```sql
select round(3.141596, 3);
```

#### Repeated concatenation
```sql
select repeat("* ", 20);
```

#### Random float
```sql
select rand();
```

#### Typecast to Int
```sql
select cast(23.01245 as signed);
```

#### Concatenation
```sql
select concat("Mahesh", " ", "Chandra", " ", "Duddu", "!");
```

#### Extract Month
```sql
select month("1998-12-30");
```

#### Extract Year
```sql
select year("1998-12-30");
```

## Access Controls

#### Creating New User
```sql
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
```
the hostname part is set to `localhost`, so the user will be able to connect to the MySQL server only from the localhost.  
To grant access from another host, change the hostname part with the remote machine IP.  
```sql
CREATE USER 'username'@'172.8.10.5' IDENTIFIED BY 'user_password';
```
To create a user that can connect from any host, '%' is used in the hostname part:
```sql
CREATE USER 'username'@'%' IDENTIFIED BY 'user_password';
```

#### Grant All Permissions
```sql
GRANT ALL PRIVILEGES ON * . * TO 'username'@'localhost';
```
Asterisks(\*) refers to the database and table names respectively.  
By using asterisks we can give access of all the databases **or** tables to the user. 

#### Flush Privileges
```sql
FLUSH PRIVILEGES
```
All the changes won't be in effect unless this query is fired.

#### Specific User Permissions
```sql
GRANT type_of_permission ON database_name.table_name TO 'username'@'localhost';
```
`type_of_permission` may have one of these value: 
* **ALL PRIVILEGES** - Allows user full access to a designated database (or if no database is selected, global access across the system).
* **CREATE** - allows them to create new tables or databases.
* **DROP** - allows them to them to delete tables or databases.
* **DELETE** - allows them to delete rows from tables.
* **INSERT** - allows them to insert rows into tables.
* **SELECT** - allows them to use the `SELECT` command to read through databases.
* **UPDATE** - allow them to update table rows.
* **GRANT OPTION** - allows them to grant or remove other users’ privileges.  
Multiple permissions are given with commas.

#### Revoking permissions
```sql
REVOKE type_of_permission ON database_name.table_name FROM 'username'@'localhost';
```

#### Show User's Current Permissions
```sql
SHOW GRANTS FOR 'username'@'localhost';
```

#### Delete a User
```sql
DROP USER 'username'@'localhost';
```

#### Set new password to a user
```sql
use mysql;
update user set authentication_string=PASSWORD("<new2-password>") where User='<user>';
flush privileges;
```

## Reset Root Password
Stop MySQL service 
```
sudo systemctl stop mysql
```
Restart MySQL service without loading grant tables
```bash
sudo mysqld_safe --skip-grant-tables &
```
The apersand (&) will cause the program to run in the background and `--skip-grant-tables` enables everyone to to connect to the database server without a password and with all privileges granted.
Login to shell
```
mysql -u root
```
Set new password for root
```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MY_NEW_PASSWORD';
FLUSH PRIVILEGES;
```
Stop and start the server once again
```
mysqladmin -u root -p shutdown
sudo systemctl start mysql
```

## HOW TO
