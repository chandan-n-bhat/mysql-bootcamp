SELECT 
    UPPER(REVERSE("Why does my cat look at me with such hatred!?"));
    
# Book App

USE book_store;

SELECT REPLACE(title,' ','->') AS Title FROM books;

SELECT author_lname AS Forwards, REVERSE(author_lname) AS Backwards FROM books;

SELECT 
    UPPER(CONCAT(author_fname," ",author_lname)) AS "Full Name in CAPS"
FROM books;

SELECT 
    CONCAT(title," was released in ",released_year) AS blurb
FROM books;

SELECT
    title AS Title,
    CHAR_LENGTH(title) AS Length
FROM books;

SELECT
    CONCAT(SUBSTRING(title,1,10),'...') AS 'Short Title',
    CONCAT_WS(',',author_lname,author_fname) AS Author,
    CONCAT(stock_quantity," in stock") AS Quantity
FROM books;
    

