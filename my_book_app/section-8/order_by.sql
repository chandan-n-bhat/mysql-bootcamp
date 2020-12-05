-- To Sort the records in ASC or DESC order - alphanumeric
USE book_store;

SELECT DISTINCT
	author_fname AS 'First Name',
	author_lname AS 'Last Name'
FROM books
ORDER BY author_lname;

SELECT
	title AS Title
FROM books
ORDER BY title DESC;

SELECT
	title,author_fname,author_lname
FROM books
ORDER BY released_year ASC;

# 2 refers to 2nd column in our SELECT Clause.
SELECT
    title, author_fname,author_lname
FROM books
ORDER BY 2;


SELECT
    *
FROM books
ORDER BY author_lname,author_fname ASC;