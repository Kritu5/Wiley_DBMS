
mysql -u root -p
show databases;
source path\yourdb.sql
create database database_name;
drop database database_name
use database_name
create table course_list (
    course_id INT NOT NULL AUTO_INCREMENT,
    course_title VARCHAR(100) NOT NULL,
    course_author VARCHAR(40) NOT NULL,
    creation_date DATE,
    PRIMARY KEY (course_id)
);
drop table course_list;
INSERT INTO course_list (course_title, course_author, creation_date) 
    VALUES
    ("Java", "Venkat", NOW()),
    ("Python", "Trupthi", NOW()),
    ("MySQL", "Deepak", NOW());
SELECT select_list FROM table_name;
SELECT lastName
FROM employees;
SELECT 
    lastName, 
    firstName, 
    jobTitle
FROM
    employees;
    
SELECT * 
FROM employees;

SELECT 1 + 1;    

SELECT NOW();

SELECT CONCAT('John',' ','Doe');
SELECT expression AS column_alias;
SELECT CONCAT('John',' ','Doe') AS name;
SELECT CONCAT('Jane',' ','Doe') AS 'Full name';

