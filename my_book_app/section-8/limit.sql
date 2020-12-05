-- Limits the no of records. Thus usually used with ORDER BY.
USE book_store;

SELECT * FROM books LIMIT 5;

# Top 3 books in terms of stock
SELECT * FROM books ORDER BY stock_quantity DESC LIMIT 3;

# Latest 5 Books
SELECT * FROM books ORDER BY released_year DESC LIMIT 5;

# Latest 8 Books FROM 2nd record
SELECT * FROM books ORDER BY released_year DESC LIMIT 2,8;

# List all books from certain offset to the end
SELECT * FROM books LIMIT 4, 1232331667679381;
