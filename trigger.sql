-- create log table
DROP TABLE IF EXISTS log; CREATE TABLE log (
    log_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    v_table VARCHAR(30),
    name VARCHAR(30),
    v_old VARCHAR(30),
    v_new VARCHAR(30),
    action VARCHAR(30),
    who VARCHAR(30),
    when DATE
);

-- trigger before insert

DROP TRIGGER IF EXISTS student_insert;
DELIMITER $$
CREATE TRIGGER student_insert BEFORE INSERT ON student FOR EACH ROW
BEGIN
INSERT INTO log (v_table, v_old, v_new, action, who, when) values ('student', 'empty', new.name, 'insert', CURRENT_USER, CURRENT_DATE);
END $$
DELIMITER;

-- trigger before update
DROP TRIGGER IF EXISTS student_update;
DELIMITER $$
CREATE TRIGGER student_update BEFORE UPDATE ON student FOR EACH ROW BEGIN
IF (old.name <> new.name) THEN
INSERT INTO log (v_table, name, v_old, v_new, action , who, when ) values ('student', 'name', old.name, new.name, 'update', CURRENT_USER, CURRENT_DATE);
END IF;
IF (old.vorname <> new.vorname) THEN
INSERT INTO log (v_table, name, v_old, v_new, action , who, when) values ('student', 'vorname', old.vorname, new.vorname, 'update', CURRENT_USER, CURRENT_DATE);
END IF;
IF (old.birthday <> new.birthday) THEN
INSERT INTO log (v_table, name, v_old, v_new, action , who, when) values ('student', 'birthday', old.birthday, new.birthday, 'update', CURRENT_USER, CURRENT_DATE);
END IF;
IF (old.gehalt_monatl <> new.gehalt_monatl) THEN
INSERT INTO log (v_table, name, v_old, v_new, action , who, when)
values ('student', 'gehalt_monatl', old.gehalt_monatl, new.gehalt_monatl,
'update', CURRENT_USER, CURRENT_DATE); END IF;
END $$
DELIMITER;

-- trigger before delete
DROP TRIGGER IF EXISTS student_delete;
DELIMITER $$
CREATE TRIGGER student_delete BEFORE DELETE ON student FOR EACH ROW
BEGIN
INSERT INTO log (v_table, v_new, action , who, when) values ('student', old.S_ID, 'delete', CURRENT_USER, CURRENT_DATE);
END $$
DELIMITER ;

insert into student (name, class_nr, birthday) VALUES ( 'test', 3, '2002-01-01');
update student SET name = 'test2' WHERE name = 'test';
delete FROM student WHERE name='test2';
