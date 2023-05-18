---case
CASE value
  WHEN value1 THEN result1
  WHEN value2 THEN result2
  .....
  [ELSE else_result]
END
USING JOIN 
SELECT c.customer_name, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

with cte as 
selectc.customer_name,
count(o.customerNumber) as order_count
from
customers c 
left join orders o ON c..customerNumber=o.customerNumber
group by
c.customerNumber
c.customer_name
)
select
customer_name,
order_count,
CASE order_count
WHEN 1 then 'One time customer'
when 2 then 'repeated customer'
when 3 then 'frequent customer'
else 'loyal customer'
end customerType
from cte
order by customerName;

---case and order by
SELECT customer_name, state, country
FROM customers
ORDER BY 
  CASE
    WHEN state IS NOT NULL THEN state
    ELSE country
  END;

---Null if
NullIf(expr1, expr2);
CASE WHEN expression1 = expression2
then Null
else 
expression1
end;
CREATE VIEW customer_payments_view AS
SELECT customersName, checkNumber, paymentDate, amount
FROM customers
INNER JOIN payments USING(customerNumber)

