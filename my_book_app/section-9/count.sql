USE book_store;

# No of records in books
SELECT COUNT(*) FROM books;

# No of author_first names in books
SELECT COUNT(author_fname) FROM books;

# Is the above legit?
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;

# Unique Authors?
SELECT COUNT(DISTINCT CONCAT(author_fname," ",author_lname)) AS 'UNIQUE Authors Count' FROM books;
SELECT COUNT(DISTINCT author_fname,author_lname) AS 'UNIQUE Authors Count' FROM books;

# No of books with 'the' in the title.
SELECT COUNT(*) AS 'Books with \'the\' in Title' FROM books WHERE title LIKE '%the%';