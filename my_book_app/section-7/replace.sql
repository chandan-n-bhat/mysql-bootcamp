# Replace is case sensitive!
SELECT REPLACE('Hello World','Hell','#337') AS Message;

SELECT REPLACE('Hello World','l','1') AS Message;

SELECT REPLACE("Fuck Off",'Fuck','****') AS Censored;

SELECT REPLACE('Chandan Harshitha Nagaraj Rekha',' ',' and ') AS Family;

# Book App Queries

# Replace all e's to 9 in title
SELECT REPLACE(title,'e','9') AS 'Modified Title' FROM books;

SELECT
	CONCAT(SUBSTRING(REPLACE(title,'e','9'),1,10),"....")
AS Title
FROM books;
