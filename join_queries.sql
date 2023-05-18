
SELECT 
   [column_1 | expression] AS descriptive_name
FROM table_name;

SELECT 
   [column_1 | expression] AS `descriptive name`
FROM 
   table_name;

SELECT 
    CONCAT_WS(', ', lastName, firstname)
FROM
    employees;

   CONCAT_WS(', ', lastName, firstname) AS `Full name`
FROM
   employees;


SELECT
	orderNumber `Order no.`,
	SUM(priceEach * quantityOrdered) total
FROM
	orderDetails
GROUP BY
	`Order no.`
HAVING
	total > 60000;

SELECT
	customerName,
	COUNT(o.orderNumber) total
FROM
	customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY
	customerName
ORDER BY
	total DESC;


-- MySQL supports the following types of joins:

-- Inner join
-- Left join
-- Right join
-- Cross join

-- Setting up sample tables

CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);

CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);

-- insert some rows into the tables members and committees
INSERT INTO members(name)
VALUES('Venkat'),('Jahnavi'),('Rishav'),('Sachin'),('Anjali');

INSERT INTO committees(name)
VALUES('Venkat'),('Rishav'),('Anjali'),('Steve');

-- Verify the data
SELECT * FROM members;
SELECT * FROM committees;

-- MySQL INNER JOIN clause
-- The following shows the basic syntax of the inner join clause that joins two tables table_1 and table_2:
SELECT column_list
FROM table_1
INNER JOIN table_2 ON join_condition;

-- Inner join clause to find members who are also the committee members:
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
INNER JOIN committees c ON c.name = m.name;


SELECT column_list 
FROM table_1 
LEFT JOIN table_2 ON join_condition;



SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
LEFT JOIN committees c USING(name);




SELECT column_list 
FROM table_1 
RIGHT JOIN table_2 ON join_condition;

SELECT column_list 
FROM table_1 
RIGHT JOIN table_2 USING (column_name);


SELECT column_list 
FROM table_1 
RIGHT JOIN table_2 USING (column_name)
WHERE column_table_1 IS NULL;

SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
RIGHT JOIN committees c on c.name = m.name;



SELECT select_list
FROM table_1
CROSS JOIN table_2;
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
CROSS JOIN committees c;

