USE book_store;

# Select all books released between 2004 and 2015
SELECT title, released_year FROM books WHERE released_year>=2004 AND released_year<=2015;
# Using Between
SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;

SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015 ORDER BY released_year;

# It is best and recommended
SELECT * FROM wish WHERE birthdt BETWEEN CAST('1999-01-01' AS DateTime) AND CAST('2010-01-01' AS DateTime);