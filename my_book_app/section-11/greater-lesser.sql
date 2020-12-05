SELECT 100 > 50;      # False - 1
SELECT -1 > 10;       # False - 0
SELECT 'a' > 'b';     # False - 0
SELECT 'a' >= 'A';    # True becoz mysql is case sensitive.
SELECT 'a' = 'A';
USE book_store;

SELECT * FROM books WHERE released_year>2004 ORDER BY released_year;
SELECT * FROM books WHERE released_year>=2004 ORDER BY released_year;

SELECT * FROM books WHERE pages<300 ORDER BY pages;
SELECT * FROM books WHERE pages<=465 ORDER BY pages;