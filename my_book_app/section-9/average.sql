USE book_store;

# Average released year accross all books
SELECT AVG(released_year) AS 'Average Year' FROM books;

# Average pages accross all books
SELECT AVG(pages) AS 'Average Pages' FROM books;

# Average Stock quantity for the books released in the same year.
SELECT
    released_year AS 'Released Year',
    AVG(stock_quantity) AS 'Average Stock'
FROM books
GROUP BY released_year;

# Average Pages per author.
SELECT
    CONCAT(author_fname,' ',author_lname) AS Author,
    AVG(pages) AS 'Average Pages'
FROM books
GROUP BY author_fname,author_lname;