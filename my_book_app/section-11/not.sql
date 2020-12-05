# NOT equal and NOT LIKE
USE book_store;

SELECT * FROM books;

SELECT * FROM books WHERE released_year=2017;
SELECT * FROM books WHERE released_year != 2017;

# NOT LIKE
SELECT * FROM books WHERE title LIKE '%THE%';
SELECT * FROM books WHERE title NOT LIKE '%the%';