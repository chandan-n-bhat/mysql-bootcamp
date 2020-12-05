USE book_store;

# CREATE TABLE wish(
#     name  VARCHAR(20),
#     birthdate  Date,
#     birthtime  Time,
#     birthdt    DateTime
# );

# INSERT INTO wish(name,birthdate,birthtime,birthdt)
# VALUES ('Chandan','1999-07-09','01:15:21','1999-07-09 01:15:21'),
#        ('Harshitha','2003-10-18','16:45:41','2003-10-18 16:45:41')
#        ('Nagaraj','1968-08-10','08:21:00','1968-08-10 08:21:00')
#        ('Rekha','1972-06-14','18:12:20','1972-06-14 18:12:20')

# CURDATE() - gives current date
# CURTIME() - gives current time
# NOW()     - gives current date time

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

# The above functions are very useful in Insert statements.
INSERT INTO wish (name,birthdate, birthtime, birthdt)
VALUES ('Aarya',CURDATE(),CURTIME(),NOW());

# DAY(), DAYNAME(), DAYOFWEEK(), MONTH(), MONTHNAME, YEAR(), DAYOFYEAR(), HOUR(),MINUTE()

# Formating the Date using date_format(date/datetime,format_string)
# %M - month name
# %m - month number
# %W - week name
# %w - week number
# %Y - Year 

SELECT DATE_FORMAT(birthdt,'%D %M %Y') AS 'Date' FROM wish;

SELECT DATE_FORMAT(birthdt,'%D %M %Y is a %W') AS 'Date' FROM wish;

# print the datetime in terms of dd/mm/yyyy

SELECT DATE_FORMAT(birthdt,'%d/%m/%Y') FROM wish;

# Date Math

SELECT DATEDIFF(NOW(),birthdt) AS 'No of Days old' FROM wish;

# Only a single interval in this method
SELECT DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM wish;

# For multiple INTERVALS
SELECT birthdt, birthdt + INTERVAL 1 MONTH + INTERVAL 2 HOUR FROM wish; 