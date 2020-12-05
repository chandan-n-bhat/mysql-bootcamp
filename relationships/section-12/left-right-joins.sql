-- Left and Right Joins

USE customer_orders;

# What and Why do we use left joins?
# We may need to find how frequenty the cutomer orders in our website
# and make useful decisions and insights from it. Using Inner Join we get details of those
# customers who have placed the orders only. Customers without an order are never considered
# which is an important data to push offers to such users to shop more. In case of left join
# we get all customers with orders and also those without orders with null as the values.

SELECT
    customer_id AS Id,
    CONCAT(first_name,' ',last_name) AS Name,
    order_id AS 'Order Id',
    amount AS Amount
FROM customers LEFT JOIN orders ON customer_id = c_id;

# We were successful to get all customers but null values may not be that useful or readable
# Two possible solns are i) Case Statements ii) IFNULL(column,value)

SELECT
    CONCAT(first_name,' ',last_name) AS Name,
    order_id AS 'Order Id',
    CASE
        WHEN amount > 0 THEN amount
        ELSE 0
    END AS Amount
FROM customers LEFT JOIN orders ON customer_id = c_id
ORDER BY amount;

SELECT
    CONCAT(first_name,' ',last_name) AS Name,
    IFNULL(amount,0) AS Amount
FROM customers LEFT JOIN orders ON customer_id = c_id
ORDER BY amount;

SELECT
    customer_id AS 'Customer Id',
    CONCAT(first_name,' ',last_name) AS Name,
    IFNULL(SUM(amount),0) AS 'Total Spent'
FROM customers LEFT JOIN orders ON customer_id=c_id
GROUP BY customers.customer_id
ORDER BY SUM(amount) DESC;

# Right Joins work similar to left join, all rows from the latter table are considered.
# In the current case right join is same as inner join as we dont have an order without customer.
# One use case of right join could be to find if any order doent have a customer.
# Say we deleted a customer, but his orders were not deleted. Using a right join could help 
# us find those order entries which donot have a customer entry.

# For the current tables we have a foreign key constraint that prevents such insertions and deletion.
# To try out it, remove the foreign key constraint and insert two orders with invalid c_id and 
# perform right join.

-- Right Join : tables : orders2 and customers2 which dont have the foreign key constraint.

SELECT
    order_id AS 'Order Id',
    order_date AS 'Order Date',
    amount AS Amount,
    CONCAT(first_name,' ',last_name) AS Name
FROM customers2 RIGHT JOIN orders2 ON customer_id=c_id;

# Lets format the NULL as Missing User
SELECT
    order_id AS 'Order Id',
    order_date AS 'Order Date',
    amount AS Amount,
    IFNULL(CONCAT(first_name,' ',last_name),'Missing User') AS 'Customer'
FROM customers2 RIGHT JOIN orders2 ON customer_id=c_id;

# Find total amount of all users who are missing
SELECT 
    IFNULL(CONCAT(first_name,' ',last_name),'Missing User') AS 'Customer',
    SUM(amount) AS 'Total Amount'
FROM customers2 RIGHT JOIN orders2 ON customer_id=c_id
GROUP BY first_name,last_name;