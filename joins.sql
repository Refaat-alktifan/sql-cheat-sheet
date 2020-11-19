
-- creating basic stuff to work on them
create database cheatsheet;
use cheatsheet;

create table student
(
    eid int primary key,
    fname varchar(20),
    lname varchar(20),
    salary real,
    joindate date,
    class varchar(10),
    gender char
);

create table project
(
    pid int primary key,
    eid int,
    class varchar(20)
);

alter table project add foreign key(eid) references student(eid);

set foreign_key_checks = 0;

insert into student values (1, "Refaat1", "Al Ktifan1", 600000, "2020-02-15", "t1", "M");
insert into student values (2, "Refaat2", "Al Ktifan2", 530000, "2020-01-09", "t2", "F");
insert into student values (3, "Refaat3", "Al Ktifan3", 1000000, "2020-01-09", "t3", "M");
insert into student values (4, "Refaat4", "Al Ktifan4", 480000, "2020-01-09", "t4", "M");
insert into student values (5, "Refaat5", "Al Ktifan5", 500000, "2020-01-09", "t5", "M");

insert into project values (1, 1, "test1");
insert into project values (2, 1, "test2");
insert into project values (3, 1, "test3");
insert into project values (4, 2, "test4");
insert into project values (5, 3, "test5");
insert into project values (6, 3, "test6");
insert into project values (7, 3, "test7");
insert into project values (8, 4, "test8");
insert into project values (9, 6, "test9");

set foreign_key_checks = 1;

-- inner join
select e.fname, p.pname from student as e inner join project as p on e.eid = p.eid;

-- outer join
select e.fname, p.pname from student as e left outer join project as p on e.eid = p.eid
union
select e.fname, p.pname from student as e right outer join project as p on e.eid = p.eid;

-- left outer join
select e.fname, p.pname from student as e left outer join project as p on e.eid = p.eid;

-- right outer join
select e.fname, p.pname from student as e right outer join project as p on e.eid = p.eid;
