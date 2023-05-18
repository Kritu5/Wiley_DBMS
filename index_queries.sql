--- List indexes 

SHOW INDEXES FROM employees;

-- when we don't connect to any database
SHOW INDEXES FROM employees IN database_name;
SHOW INDEXES FROM database_name.table_name;


SHOW INDEXES IN employees FROM database_name
OR
SHOW KEYS FROM table_name IN database_name

-- FILTER INDEX INFORMATION 
SHOW INDEXES FROM table_name WHERE condition;


SHOW INDEXES FROM table_name WHERE visible = 'NO';
--------------


CREATE TABLE leads(
    lead_id INT AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    information_source VARCHAR(255),
    INDEX name(first_name,last_name),
    UNIQUE email(email),
    PRIMARY KEY(lead_id)
);

DROP INDEX email ON leads ALGORITHM = INPLACE LOCK = DEFAULT;


CREATE TABLE t(
    pk INT PRIMARY KEY,
    c VARCHAR(10)
);

DROP INDEX `PRIMARY` ON table_name;

CREATE TABLE contacts(
    contact_id INT AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    PRIMARY KEY(contact_id),
    UNIQUE(email),
    INDEX phone(phone) INVISIBLE,
    INDEX name(first_name, last_name) comment 'By first name and/or last name'
);

SHOW INDEXES FROM table_name WHERE visible = 'NO';
-------------------------------------------

--- PREFIX INDEXES 
column_name(length);

CREATE TABLE table_name(
    column_list,
    INDEX(column_name(length))
);

CREATE INDEX index_name ON table_name(column_name(length));

-- using products table
-- Find the products whose names start with string 

EXPLAIN FORMAT=JSON SELECT 
    productName,
    buyPrice,
    msrp
FROM 
    products
WHERE
    productName LIKE '1970%';

-- Evaluate different prefix length until I can achieve the responsible uniqueness of rows:

SELECT 
    COUNT(DISTINCT LEFT(productName, 20)) unique_rows
FROM 
    products;

CREATE INDEX idx_productName ON products(productName(20));

---------------------

---------------------------------------------------------
UNIQUE INDEX 


CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    UNIQUE KEY unique_email (email)
);


CREATE UNIQUE INDEX index_name ON table_name(col1, col2,...);

-- Add UNIQUE CONSTRAINT ON EXISTING TABLE

ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE KEY(col1, col2,...)

---------------------------
-- COMPOSITE INDEX 

CREATE TABLE table_name (
    c1 data_type PRIMARY KEY,
    c2 data_type,
    c3 data_type,
    c4 data_type,
    INDEX index_name (c2,c3,c4)
);


CREATE INDEX name ON employees(lastName, firstName);

firstName, lastName and email from employees where lastName is "Patterson"

----------------------------------
INVISIBLE 

CREATE INDEX index_name ON table_name(col1, col2) [ INVISIBLE | VISIBLE];

CREATE INDEX index_name ON table_name(col1, col2) INVISIBLE;

ALTER TABLE table_name ALTER INDEX index_name [ INVISIBLE | VISIBLE];

CREATE INDEX extension ON employees(extension) INVISIBLE;

ALTER TABLE  employees ALTER INDEX extension VISIBLE;

SELECT firstName FROM employees USE INDEX (extension) WHERE ...

-- Descending Index 

CREATE TABLE t(
    a INT NOT NULL,
    b INT NOT NULL,
    INDEX a_asc_b_desc (a ASC, b DESC)
);


DROP TABLE t;

CREATE TABLE t (
    a INT,
    b INT,
    INDEX a_asc_b_asc (a ASC , b ASC),
    INDEX a_asc_b_desc (a ASC , b DESC),
    INDEX a_desc_b_asc (a DESC , b ASC),
    INDEX a_desc_b_desc (a DESC , b DESC)
) ENGINE = InnoDB;

CREATE TABLE t (
    a INT,
    b INT,
    KEY a_asc_b_DESC (a, b DESC)
) ENGINE = InnoDB;
Because a clustered index store the rows in sorted order, each table have only one clustered index.
-------------------------------

SELECT firstName FROM employees FORCE INDEX (extension) WHERE condition;

SELECT 
    productName,
    buyPrice
FROM 
    products
WHERE 
    buyPrice BETWEEN 10 AND 80
ORDER BY buyPrice;


EXPLAIN FORMAT=JSON SELECT 
    productName,
    buyPrice
FROM 
    products
FORCE INDEX (idx_buyprice)
WHERE 
    buyPrice BETWEEN 10 AND 80
ORDER BY buyPrice;

CREATE INDEX idx_buyprice ON products(buyPrice);
