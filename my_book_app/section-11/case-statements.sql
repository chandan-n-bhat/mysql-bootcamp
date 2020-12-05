# Case Statements to add logic
USE book_store;

# Display a field Period based on the released year.
SELECT 
    title,
    released_year,
    CASE
        WHEN    released_year>=2000 THEN 'Modern Lit'
        WHEN    released_year>=1999 AND released_year<2000 THEN '20th Century'
        ELSE    'Old'
    END AS Period    
FROM books;

# Display stock graphically. 0-50 => *, 50-100 => **, >100 => ***

SELECT
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity = 0 THEN ''
        WHEN stock_quantity BETWEEN 1 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS 'Stock'
FROM books;

# The Order of execution matters. Just like the typical if-elif-else statements.
SELECT
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity = 0 THEN ''
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS 'Stock'
FROM books;