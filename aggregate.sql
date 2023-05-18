
-----AVG() function 
select avg(buyprice) as average_buy_price
from products;

select avg(buyprice) as AVG(buyPrice) DISTINCT productline
from products;

select 
avg(p1_avg) 'average Price'
from(
    select avg(buyPrice)p1_avg
    from products group by product_line
) avgs;


-----count()
select count(productCode) as total
from products;

SELECT product_line, COUNT(*) AS product_count
FROM products
GROUP BY product_line
ORDER BY product_line;

-----sum()
SELECT product, SUM(order_value) AS total_order_value
FROM orders
GROUP BY product;

SELECT p.product_line, p.product, SUM(od.order_value) AS total_order_value
FROM products p
JOIN orderdetails od ON p.product_id = od.product_id
GROUP BY p.product_line, p.product;

---MAX()
SELECT MAX(buy_price) AS highest_buy_price
FROM products;

SELECT product_line, MAX(buy_price) AS highest_price
FROM products
GROUP BY product_line;

---Min()
SELECT MIN(buy_price) AS lowest_price
FROM products;

SELECT product_line, MIN(buy_price) AS lowest_price
FROM products
GROUP BY product_line;

---Group_Concat()
select
firstName,
lastName,

Group_Concat(
    DISTINCT customerName
    ORDER BY customerName
)
FROM
employees
INNER JOIN customers
 ON customers.salesRepEmployeeNumber = employeeNumber
 GROUP BY employeeNumber
 ORDER BY firstName,lastName;




