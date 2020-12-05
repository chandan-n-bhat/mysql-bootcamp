USE book_store;

# Find the year each author published their first book.
SELECT
    CONCAT(author_fname," ",author_lname) AS Author,
    MIN(released_year) AS 'Year'
FROM books
GROUP BY author_fname,author_lname;

# Find the longest page count for each author

SELECT
    CONCAT(author_fname," ",author_lname) AS Author,
    MAX(pages) AS 'Page Count'
FROM books
GROUP BY author_fname,author_lname;

# Find the longest page count for each author and sort the result based on pagecount.

SELECT
    CONCAT(author_fname," ",author_lname) AS Author,
    MAX(pages) AS 'Page Count'
FROM books
GROUP BY author_fname,author_lname
ORDER BY 2;