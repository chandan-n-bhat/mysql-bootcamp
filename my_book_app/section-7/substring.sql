SELECT SUBSTRING( 'Hello World', 1, 5);

SELECT SUBSTRING('Hello World', 6) AS 'Greet';

SELECT SUBSTRING('Hello World',-5) AS Greet;

# Book Queries
USE book_store;

SELECT SUBSTRING(title,1,10) AS 'Short Title' FROM books;

SELECT 
    CONCAT(
        SUBSTRING(title,1,10),
        "...."
    ) AS 'Short Title'
FROM books;

# SUBSTRING and SUBSTR can be used interchangably

SELECT 
    CONCAT(
        SUBSTR(title,1,10),
        "...."
    ) AS 'Short Title'
FROM books;

