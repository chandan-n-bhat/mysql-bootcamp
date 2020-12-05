USE customers_orders;

# To display both the data from customers and orders table together we need join.
# Inner Join is Cross Join + Condition.


# Using Joins to display the orders of Boy George as per format (efficient)
SELECT 
    CONCAT(first_name," ",last_name) AS Name,
    order_date AS 'Date',
    amount AS Amount
FROM customers,orders WHERE c_id = customer_id AND CONCAT(first_name,last_name) = 'BoyGeorge';


# Using Joins to display all the orders with the customer details also.
SELECT 
    CONCAT(first_name," ",last_name) AS Name,
    order_date AS 'Date',
    amount AS Amount
FROM customers JOIN orders ON c_id = customer_id;

SELECT 
    CONCAT(first_name," ",last_name) AS Name,
    order_date AS 'Date',
    amount AS Amount
FROM customers JOIN orders ON c_id = customer_id WHERE CONCAT(first_name," ",last_name)='Boy George';

-- Getting Fancier with ORDER BY and GROUP BY

SELECT 
    CONCAT(first_name," ",last_name) AS Name,
    order_date AS 'Date',
    amount AS Amount
FROM customers JOIN orders ON c_id = customer_id
ORDER BY amount;

# Display the customers in descending order based of their spending
SELECT
    CONCAT(first_name,' ',last_name) AS Name,
    SUM(amount) AS Amount
FROM customers INNER JOIN orders ON customer_id = c_id
GROUP BY customer_id
ORDER BY amount DESC;

# Display the highest average spender in our website

SELECT
    CONCAT(first_name,' ',last_name) AS Name,
    AVG(amount) AS 'Avg Amount'
FROM customers JOIN orders ON customer_id = c_id
GROUP BY orders.c_id
ORDER BY AVG(amount) DESC LIMIT 1;