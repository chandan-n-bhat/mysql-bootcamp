# Group By alone is not that useful. Group by combines multiple records based on what we mention.
USE book_store;

# Doesn't Make sense. Its Bizare lol
SELECT title,author_lname FROM books GROUP BY author_lname;

# This makes sense.
SELECT author_lname AS 'Last Name', COUNT(title) AS 'Count' FROM books GROUP BY author_lname,author_fname;

# Observe the difference in the below 2 queries
SELECT author_lname AS 'Last Name', MIN(title) AS 'Count' FROM books GROUP BY author_lname;
SELECT author_lname AS 'Last Name', MAX(title) AS 'Count' FROM books GROUP BY author_lname;

# Not that GROUP BY MERGES INDIVIDUAL rows to mega rows(which may contain sub rows).
# The aggregate funtions then acts only on the mega rows(grouped rows) and not on the entire table rows.

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT CONCAT("In ",released_year,",",COUNT(*)," book(s) released!") AS Info FROM books GROUP BY released_year;