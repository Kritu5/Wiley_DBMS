
SELECT 
   select_list
FROM 
   table_name
ORDER BY 
   column1 [ASC|DESC], 
   column2 [ASC|DESC],
   ...;

    
    FROM -> SELECT -> ORDER BY

SELECT
    contactLastname,
    contactFirstname
FROM
    customers
ORDER BY
    contactLastname;
SELECT
    contactLastname,
    contactFirstname
FROM
    customers
ORDER BY
    contactLastname DESC;
    contactLastname,
    contactFirstname
FROM
    customers
ORDER BY
    contactLastname DESC,
    contactFirstname ASC;

SELECT
    orderNumber,
    orderlinenumber,
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER by
    quantityOrdered * priceEach DESC;

SELECT
    orderNumber,
    orderlinenumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER by
    subtotal DESC;

    FIELD(str, str1, str2, ...)
SELECT
    FIELD('A', 'B', 'C');

+--------------------------+
| FIELD('A', 'A', 'B','C') |
+--------------------------+
|                        1 |
+--------------------------+

SELECT
    orderNumber,
    status
FROM
    orders
ORDER BY
    FIELD(
        status,
        "In Process",
        "On Hold",
        "Cancelled",
        "Resolved",
        "Disputed",
        "Shipped"
    );


SELECT
    firstName, lastName, reportsTo
FROM
    employees
ORDER BY reportsTo;
SELECT 
    firstName, lastName, reportsTo
FROM
    employees
ORDER BY reportsTo DESC;