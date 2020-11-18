
-- creating basic stuff to work on them
create database cheatsheet;
use cheatsheet;

create table city
(
    id int primary key,
    name varchar(17),
    countrycode varchar(3),
    district varchar(20),
    population int
);

insert into city values (6, "test1", "TST1", "test-test1", 593321);
insert into city values (1, "test2", "TST2", "test-test2", 202705);
insert into city values (3, "test3", "TST3", "test-test3", 124966);
insert into city values (7, "test4", "TST4", "test-test4", 121780);
insert into city values (8, "test5", "TST5", "test-test5", 120758);
insert into city values (11, "test6", "TST6", "test-test6", 117549);
insert into city values (22, "test7", "TST7", "test-test7", 92256);
insert into city values (34, "test8", "TST8", "test-test8", 91238);
insert into city values (66, "test9", "TST9", "test-test8", 90555);

-- sum function
select sum(population) from city group by population;

-- average function
select avg(population) from city group by population;

-- count function
select district, count(district) from city group by district;

-- maximum function
select max(population) from city group by population;

-- minimum function
select min(population) from city group by population;

-- standard deviation function
select stddev(population) from city group by population;

-- group concat function
select group_concat(population) from city group by population;
