# Like for better searching and wildcard matching
USE book_store;

# Books with title containing 'anything...the...anything': %=>anything
SELECT * FROM books WHERE title LIKE '%the%';

# Books with author name containing 'aything...da...anything'
SELECT * FROM books WHERE author_fname LIKE "%da%";

# '_' matches any character but only 1 character.
SELECT * FROM books WHERE stock_quantity LIKE '____';

# Escape characters to match special characters like %, _ etc...
SELECT * FROM books WHERE title LIKE '%\%%';

SELECT * FROM books WHERE title LIKE '%\_%';

# Match US contact number using like: (235)234-0987
# Soln: LIKE '(___)___-____'