USE book_store;

SELECT MIN(released_year) AS 'MIN' FROM books;

SELECT MAX(pages) AS 'MAX' FROM books;

# Problem with simple query and min max

SELECT MAX(pages), title FROM books;
SELECT title, MAX(pages) FROM books;

# The above is wrong. Also it is not that one projection happens before the other. It is quite complicated