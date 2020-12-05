USE customers_orders;

# Cross Join
SELECT * FROM customers,orders;

# Display all orders by Boy George

# Using Sub Queries
SELECT
    order_id AS Id,
    order_date AS 'Date',
    amount AS Amount
FROM orders WHERE c_id = (SELECT customer_id FROM customers WHERE first_name='Boy' AND last_name='George');

