
SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition;
     FROM -> WHERE -> SELECT -> ORDER BY
SELECT
    lastName,
    firstName,
    jobTitle
FROM
    employees
WHERE
    jobTitle = "Sales Rep";
SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    jobTitle = "Sales Rep"
    AND officeCode = 1;
 the office with office code 1
SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    jobTitle = "Sales Rep"
    AND officeCode = 1
ORDER BY
    officeCode,
    jobTitle;
SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1
    AND 3
ORDER BY
    officeCode;
SELECT
    lastName,
    firstName
FROM
    employees
WHERE
    lastName LIKE "%son"
ORDER BY
    firstName;
    value IN (value1, value2,...)

SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode IN (1 , 2, 3)
ORDER BY 
    officeCode;

    value IS NULL   
SELECT
    firstName,
    lastName,
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NULL; 
SELECT
    firstName,
    lastName,
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NOT NULL;
SELECT
    firstName,
    lastName,
    jobTitle
FROM
    employees
WHERE
    jobTitle <> 'Sales Rep';
SELECT
    firstName,
    lastName,
    jobTitle
FROM
    employees
WHERE
    officeCode > 5;
SELECT
    firstName,
    lastName,
    jobTitle
FROM
    employees
WHERE
    officeCode <= 4;
SELECT DISTINCT
    select_list
FROM
    table_name
WHERE 
    search_condition
ORDER BY 
    sort_expression;
    FROM -> WHERE -> SELECT -> DISTINCT -> ORDER BY

SELECT
    DISTINCT lastName
FROM
    employees
ORDER BY
    lastName;
SELECT
    state
FROM
    customers;

--
SELECT
    DISTINCT state
FROM
    customers;

--
SELECT
    DISTINCT state,
    city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY
    state,
    city;

SELECT
    customerName,
    country
FROM
    customers
WHERE
    country = "USA"
    AND state = "CA"
    AND creditLimit > 100000;
--
SELECT
    customerName,
    country
FROM
    customers
WHERE
    country = "USA"
    OR country = "France"
    AND creditLimit > 100000;