USE book_store;

# Sum of all pages in the entire database.
SELECT SUM(pages) AS 'Total Pages in Database' FROM books;

# Sum of all released_year in the entire database. PS: Doesn't make sense.
SELECT SUM(released_year) AS 'Sum of Years' FROM books;

# Summ of all the pages the author has written. Total pages written by the author.
SELECT 
    CONCAT(author_fname," ",author_lname) AS 'Author',
    SUM(pages)
FROM books
GROUP BY author_fname,author_lname;