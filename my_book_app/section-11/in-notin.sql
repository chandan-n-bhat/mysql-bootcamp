USE book_store;

SELECT title, author_lname FROM books WHERE author_lname='Carver' OR author_lname='Lahiri' OR author_lname='Smith';

SELECT title, author_lname FROM books WHERE author_lname IN ('Carver','Lahiri','Smith');
SELECT title, released_year FROM books WHERE released_year IN (2001,2005,2010);


SELECT title, author_lname FROM books WHERE author_lname NOT IN ('Carver','Lahiri','Smith');

# Books that are not released in EVEN years
SELECT title, released_year FROM books WHERE released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);

# tRY TO ENSURE THAT ONLY books after 2000 are displayed int he above query.
SELECT title, released_year FROM books WHERE released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016) AND released_year>=2000;

SELECT title, released_year FROM books WHERE released_year>=2000 AND released_year%2 != 0;