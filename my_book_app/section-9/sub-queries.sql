# SUBQUERIES

# Find the title of the book with maximum pages?
# SELECT MAX(pages), title FROM books;
# SELECT title, MAX(pages) FROM books;
# The above two queries are logically wrong and dont work as we expect.

USE book_store;

# Solution 1
SELECT title AS Title, CONCAT(author_fname," ",author_lname) AS Author, pages as Pages
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

# The above approach is quite slower as there are two queries being executed.
# For very large data the above method can be very inefficient.

# Solution 2

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;