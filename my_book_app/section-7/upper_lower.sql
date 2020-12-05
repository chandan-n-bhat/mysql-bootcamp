SELECT UPPER("hELLO wORLD!!");
SELECT LOWER("hELLO wORLD!!");

# Book App Queries
USE book_store;
SELECT 
	UPPER(CONCAT(author_fname," ",author_lname)) AS Name
FROM books;