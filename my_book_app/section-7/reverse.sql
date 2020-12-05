SELECT REVERSE("Hello World") AS Reverse;

# Book App Queries
USE book_store;
SELECT REVERSE(title) AS 'Reversed Title' FROM books;

SELECT
    REVERSE(CONCAT(SUBSTRING(REPLACE(title,'e','9'),1,10),'....'))
    AS Title
FROM books;