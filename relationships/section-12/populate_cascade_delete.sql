-- ON DELETE CASCADE
USE customers_orders;

DROP TABLE IF EXISTS orders3;
DROP TABLE IF EXISTS customers3;

CREATE TABLE customers3(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders3(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    c_id INT,
    FOREIGN KEY(c_id) REFERENCES customers3(customer_id) ON DELETE CASCADE
);

INSERT INTO customers3 (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders3 (order_date, amount, c_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
-- Display customers3 and orders3 table

SELECT * FROM customers3;
SELECT * FROM orders3;

-- Delete Customer Boy George(id=1) and observe the orders of the customer in orders3 table
SELECT * FROM customers3 WHERE customer_id = 1;
DELETE FROM customers3 WHERE customer_id = 1;

-- Display customers3 and orders3 table

SELECT * FROM customers3;
SELECT * FROM orders3;