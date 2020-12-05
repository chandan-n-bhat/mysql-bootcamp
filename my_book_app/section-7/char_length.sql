SELECT CHAR_LENGTH("Hello World!!!");

# Book App Queries
USE book_store;

SELECT author_fname AS Name, CHAR_LENGTH(books.author_fname) FROM books;

SELECT 
    CONCAT_WS(" ",author_fname,"is",CHAR_LENGTH(author_fname),"characters long.")
    AS Misc
FROM books;