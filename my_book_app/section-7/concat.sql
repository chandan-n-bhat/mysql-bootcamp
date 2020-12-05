USE book_store;

DESC books;

SELECT * FROM books;

SELECT book_id AS Id, title AS Titles, CONCAT(author_fname,' ',author_lname) AS Authors FROM books;

# With Separator
SELECT CONCAT_WS(' - ',title,author_fname,author_lname) AS Summary FROM books;