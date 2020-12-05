USE book_store;

SELECT
	author_fname,author_lname
FROM books;

SELECT DISTINCT
	author_fname,author_lname
FROM books;

SELECT DISTINCT
	CONCAT(author_fname,' ',author_lname)
FROM books;

SELECT
	released_year AS 'Date'
FROM books;

SELECT DISTINCT
	released_year AS 'Date'
FROM books;
