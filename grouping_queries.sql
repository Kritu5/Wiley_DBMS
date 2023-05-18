
SELECT
    C1,
    C2,
    C3...CN,
    aggregate_function(ci)
FROM
    table
WHERE
    where_condition
GROUP BY
    C1,
    C2,
    C3...Cn 
SELECT
    status
FROM
    orders
GROUP BY
    status;

--
SELECT
    DISTINCT status
FROM
    orders;

---
SELECT
    status,
    COUNT(*)
FROM
    orders
GROUP BY
    status;

SELECT
    status,
    SUM(quantityOrdered * priceEach) AS amount
FROM
    orders
    INNER JOIN orderdetails USING (orderNumber)
GROUP BY
    status;
SELECT
    orderNumber,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orderdetails
GROUP BY
    orderNumber;
SELECT
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
    INNER JOIN orderdetails USING (orderNumber)
WHERE
    status = "Shipped"
GROUP BY
    YEAR(orderDate);
SELECT
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
    INNER JOIN orderdetails USING (orderNumber)
WHERE
    status = "Shipped"
GROUP BY
    year
HAVING
    year > 2003;
SELECT
    year(orderDate) as YEAR,
    COUNT(orderNumber) AS Total
FROM
    orders
GROUP BY
    YEAR;

--status count
SELECT
    status,
    COUNT(*)
FROM
    orders
GROUP BY
    status;
SELECT
    orderNumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceEach * quantityOrdered) AS total
FROM
    orderDetails
GROUP BY
    orderNumber;
SELECT
    orderNumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceEach * quantityOrdered) AS total
FROM
    orderDetails
GROUP BY
    orderNumber
HAVING
    total > 1000;
SELECT
    orderNumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceEach * quantityOrdered) AS total
FROM
    orderDetails
GROUP BY
    orderNumber
HAVING
    total > 1000
    AND itemsCount > 600;
SELECT
    a.orderNumber,
    status,
    SUM(priceEach * quantityOrdered) AS total
FROM
    orderDetails a
    INNER JOIN orders b ON b.orderNumber = a.orderNumber
GROUP BY
    orderNumber,
    status
HAVING
    status = "Shipped"
    AND total > 1500;
CREATE TABLE sales
SELECT
    productline,
    YEAR(orderDate) orderYear,
    SUM(priceEach * quantityOrdered) AS orderValue
FROM
    orderDetails
    INNER JOIN orders USING(orderNumber)
    INNER JOIN products USING (productCode)
GROUP BY
    productline,
    orderYear; 
SELECT
    productline,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY
    productline;

SELECT
    SUM(orderValue) totalOrderValue
FROM
    sales;
SELECT
    productline,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY
    productline
UNION
ALL
SELECT
    NULL,
    SUM(orderValue) totalOrderValue
FROM
    sales;

SELECT
    productline,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY
    productline WITH ROLLUP;

--
GROUP BY
    C1,
    C2,
    C3 WITH ROLLUP;

C1 > C2 > C3 
C1 > C2 > C3 C1 > C2 C1
SELECT
    productline,
    orderYear,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY
    productline,
    orderYear WITH ROLLUP;
SELECT
    orderYear,
    productline,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY
    orderYear,
    productline WITH ROLLUP;
SELECT
    IF(GROUPING(orderYear), 'All Years', orderYear) orderYear,
    IF(GROUPING(productline), 'All Product Line', productline) productline,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY
    orderYear,
    productline WITH ROLLUP;