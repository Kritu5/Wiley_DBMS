

CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    priority TINYINT NOT NULL DEFAULT 3,
    description TEXT,
    PRIMARY KEY (task_id)
);

INSERT INTO 
	tasks(title, priority, start_date)
VALUES("TASK1", DEFAULT, CURRENT_DATE() ); --YYYY-MM-DD



CREATE TABLE projects(
	project_id INT AUTO_INCREMENT, 
	name VARCHAR(100) NOT NULL,
	start_date DATE,
	end_date DATE,
	PRIMARY KEY(project_id)
);


INSERT INTO 
	projects(name, start_date, end_date)
VALUES
	('AI for Marketing','2019-08-01','2023-02-31'),
	('ML for Sales','2019-05-15','2023-01-20');

SHOW VARIABLES LIKE 'max_allowed_packet';

SET GLOBAL max_allowed_packet=size;



CREATE TABLE devices(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
)

INSERT INTO devices(name)
VALUES('Rourter F1'),('Switch 1'),('Switch 2');


INSERT INTO devices(id, name)
VALUES(4,'Printer')
ON DUPLICATE KEY UPDATE name = "My Printer";

CREATE TABLE subscribers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE
)

INSERT INTO subscribers(email)
VALUES('venkat.bvs@gmail.com')

INSERT INTO subscribers(email)
VALUES('venkat.bvs@gmail.com'), ('venkat.s@gmail.com');

INSERT IGNORE INTO subscribers(email)
VALUES('venkat.bvs@gmail.com'), ('venkat.s@gmail.com');

select firstname, lastname, email from employees where employeeNumber = 1056;

UPDATE employees 
SET email = "mary@gmail.com"
where employeeNumber = 1056;

-- update multiple values
UPDATE employees 
SET 
    email = "mary@gmail.com",
    lastName = "Paterson"
where employeeNumber = 1056;

UPDATE employees 
SET 
    email = REPLACE(email,'@classicmodelcars.com', '@wileyedge.com')
where 
    jobTitle = 'Sales Rep' AND 
    officeCode = 0;


-------------------------------------------------
CREATE TABLE suppliers (
    supplierNumber INT AUTO_INCREMENT,
    supplierName VARCHAR(50) NOT NULL,
    phone VARCHAR(50),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(50),
    country VARCHAR(50),
    customerNumber INT,
    PRIMARY KEY (supplierNumber)
);

SELECT 
    customerNumber,
    customerName,
    phone,
    addressLine1,
    addressLine2,
    city,
    state,
    postalCode,
    country
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA';

CREATE DATABASE IF NOT EXISTS empdb;

USE empdb;

CREATE TABLE merits (
    performance INT(11) NOT NULL,
    percentage FLOAT NOT NULL,
    PRIMARY KEY (performance)
);

CREATE TABLE employees (
    emp_id INT(11) NOT NULL AUTO_INCREMENT,
    emp_name VARCHAR(255) NOT NULL,
    performance INT(11) DEFAULT NULL,
    salary FLOAT DEFAULT NULL,
    PRIMARY KEY (emp_id),
    CONSTRAINT fk_performance FOREIGN KEY (performance)
        REFERENCES merits (performance)
);

INSERT INTO merits(performance,percentage)
VALUES(1,0),
      (2,0.01),
      (3,0.03),
      (4,0.05),
      (5,0.08);

INSERT INTO employees(emp_name,performance,salary)      
VALUES('Venkat', 1, 50000),
      ('Rishav Raj', 3, 65000),
      ('Steve Fernandes', 4, 75000),
      ('Swati Jha', 5, 125000),
      ('Jahnavi T', 3, 85000),
      ('Riti Rathore', 2, 45000),
      ('Sachin Kumar', 3, 55000);


UPDATE employees
    INNER JOIN 
        merits ON employees.per = merits.performance
SET
    salary = salary + salary * percentage

DROP TABLE IF EXISTS t1, t2;

CREATE TABLE t1 (
    id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE t2 (
    id VARCHAR(20) PRIMARY KEY,
    ref INT NOT NULL
);

INSERT INTO t1 VALUES (1),(2),(3);

INSERT INTO t2(id,ref) VALUES('A',1),('B',2),('C',3);

CREATE TABLE buildings (
    building_no INT PRIMARY KEY AUTO_INCREMENT,
    building_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE rooms (
    room_no INT PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(255) NOT NULL,
    building_no INT NOT NULL,
    FOREIGN KEY (building_no)
        REFERENCES buildings (building_no)
        ON DELETE CASCADE
);

INSERT INTO buildings(building_name,address)
VALUES('ACME Headquaters','3950 North 1st Street CA 95134'),
      ('ACME Sales','5000 North 1st Street CA 95134');

INSERT INTO rooms(room_name,building_no)
VALUES('Amazon',1),
      ('War Room',1),
      ('Office of CEO',1),
      ('Marketing',2),
      ('Showroom',2);

REPLACE [INTO] table_name(column_list)
VALUES(value_list);

CREATE TABLE cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    population INT NOT NULL
);


INSERT INTO cities(name,population)
VALUES('New York',8008278),
	  ('Los Angeles',3694825),
	  ('San Diego',1223405);

SELECT * 
FROM products 
WHERE productCode = ?;
    PREPARE -> EXECUTE -> DEALLOCATE PREPARE








