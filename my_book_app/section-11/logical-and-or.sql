# Logical AND(or &&) and OR(or ||)

USE book_store;

# Select book written by Dave Eggers and published after the year 2010.
SELECT title, author_fname, author_lname, released_year FROM books
WHERE author_fname='Dave' AND author_lname='Eggers' AND released_year>2010;

# OR for the same query above
SELECT title, author_fname, author_lname, released_year FROM books
WHERE author_fname='Dave' OR author_lname='Eggers' OR released_year>2010;