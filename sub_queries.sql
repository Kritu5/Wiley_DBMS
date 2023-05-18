
    lastName,
    firstName
FROM
    employees
WHERE
    officeCode IN(
        SELECT
            officeCode
        FROM
            offices
        WHERE
            country = 'USA'
    );

SELECT
    customerNumber,
    checkNumber,
    amount
FROM
    payments
WHERE
    amount = (
        SELECT
            MAX(amount)
        FROM
            payments
    );

-------------------------
SELECT
    customerNumber,
    checkNumber,
    amount
FROM
    payments
WHERE
    amount > (
        SELECT
            AVG(amount)
        FROM
            payments
    );

    customerName
FROM
    customers
WHERE
    customerNumber NOT IN (
        SELECT
            DISTINCT customerNumber
        FROM
            orders
    );
SELECT
    MAX(items),
    MIN(items),
    FLOOR(AVG(items))
FROM
    (
        SELECT
            orderNumber,
            COUNT(orderNumber) AS items
        FROM
            orderdetails
        GROUP BY
            orderNumber
    ) as lineItems;

SELECT
    productName,
    buyprice
FROM
    products p1
WHERE
    buyprice > (
        SELECT
            AVG(buyprice)
        FROM
            products
        WHERE
            productline = p1.productline
    );


SELECT
    *
FROM
    table_name
WHERE
    EXISTS(subquery);
SELECT
    orderNumber,
    SUM(priceEach * quantityOrdered) total
FROM
    orderdetails
    INNER JOIN orders USING (orderNumber)
GROUP BY
    orderNumber
HAVING
    SUM(priceEach * quantityOrdered) > 60000;
SELECT
    customerNumber,
    customerName
FROM
    customers
WHERE
    EXISTS(
        SELECT
            orderNumber,
            SUM(priceEach * quantityOrdered)
        FROM
            orderdetails
            INNER JOIN orders USING (orderNumber)
        WHERE
            customerNumber = customers.customerNumber
        GROUP BY
            orderNumber
        HAVING
            SUM(priceEach * quantityOrdered) > 60000
    );
SELECT
    select_list
FROM
    (
        SELECT
            select_list
        FROM
            table_1
    ) derived_table_name
WHERE
    derived_table_name.c1 > 0;

SELECT
    productCode,
    SUM(quantityOrdered * priceEach) sales
FROM
    orderdetails
    INNER JOIN orders USING(orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY
    productCode
ORDER BY
    sales DESC
LIMIT
    5;

SELECT
    productName,
    sales
FROM
    (
        SELECT
            productCode,
            ROUND(SUM(quantityOrdered * priceEach)) sales
        FROM
            orderdetails
            INNER JOIN orders USING(orderNumber)
        WHERE
            YEAR(shippedDate) = 2003
        GROUP BY
            productCode
        ORDER BY
            sales DESC
        LIMIT
            5
    ) top5Product2003
    INNER JOIN products USING(productCode);

SELECT
    customerNumber,
    ROUND(SUM(quantityOrdered * priceEach)) sales,
    (
        CASE
            WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
            WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000
            AND 100000 THEN 'Gold'
            WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
        END
    ) customerGroup
FROM
    orderdetails
    INNER JOIN orders USING(orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY
    customerNumber;

-------------------------------------------------
SELECT
    customerGroup,
    COUNT(cg.customerGroup) AS groupCount
FROM
    ( SELECT
        customerNumber,
        ROUND(SUM(quantityOrdered * priceEach)) sales,
        (
            CASE
                WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
                WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000
                AND 100000 THEN 'Gold'
                WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
            END
        ) customerGroup
        FROM
            orderdetails
            INNER JOIN orders USING(orderNumber)
        WHERE
            YEAR(shippedDate) = 2003
        GROUP BY
            customerNumber
    ) cg
GROUP BY
    cg.customerGroup;

SELECT
    select_list
FROM
    a_table
WHERE
    [NOT] EXISTS(subquery);


SELECT 
    employeenumber,
    firstname, 
    lastName,
    extension
FROM
    employees
WHERE EXISTS(
    SELECT 1 FROM offices WHERE city = 'San Francisco' AND
    offices.officeCode = employees.officeCode
);
UPDATE employees
SET 
    extension = CONCAT(extension, '1')
WHERE EXISTS(
    SELECT 1 FROM offices WHERE city = 'San Francisco' AND
    offices.officeCode = employees.officeCode
);



CREATE TABLE customers_archive LIKE customers;

INSERT INTO customers_archive 
SELECT * FROM customers 
WHERE NOT EXISTS (
    SELECT 
        1 
    FROM 
        orders 
    WHERE 
        orders.customerNumber = customers.customerNumber
    );


DELETE FROM customers 
WHERE EXISTS(
    SELECT 1 
    FROM customers_archive a 
    WHERE a.customerNumber = customers.customerNumber
);


SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    customerNumber IN (
        SELECT 
            customerNumber
        FROM
            orders);
            
------------
SELECT 
    customerNumber,
    customerName
FROM
    customers 
WHERE 
EXISTS (
    SELECT 1 FROM orders WHERE orders.customerNumber = customers.customerNumber
);


EXPLAIN SELECT 
    customerNumber,
    customerName
FROM
    customers 
WHERE 
EXISTS (
    SELECT 1 FROM orders WHERE orders.customerNumber = customers.customerNumber
);