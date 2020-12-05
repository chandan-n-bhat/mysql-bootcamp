USE book_store;

# What's a good use case for CHAR?(just make one up)
# Soln: If the length of the value in the column is always fixed, CHAR is more efficient that VARCHAR.


#Fill In The Blanks
# CREATE TABLE inventory (
#     item_name ____________,
#     price ________________,
#     quantity _____________
# );

# Soln: i. VARCHAR(20)
#      ii. DECIMAL(8,2) assuming 999,999.99  can it be?FLOAT    # Since precision is upto 7 digits only.
#     iii. INT


# What's the difference between DATETIME and TIMESTAMP?

# Soln: Time stamps are usually used to note when a partivular object(blog post, product, comment etc)
# was created. It is same as DateTime as it stores both date and time but it differs in the range of possible date times.


# Print Out The Current Time
SELECT CURTIME() AS 'Current Time';

# Print Out The Current Date (but not time)
SELECT CURDATE() AS 'Current Date only';

# Print Out The Current Day Of The Week(The Number)
SELECT DATE_FORMAT(NOW(),'%w') AS 'Current Day of the Week';

# Print Out The Current Day Of The Week(The Day Name)
SELECT DATE_FORMAT(NOW(),'%W') AS 'Current Day of the Week';

# Print out the current day and time using this format:mm/dd/yyyy
SELECT DATE_FORMAT(NOW(),'%m/%d/%Y');

# Print out the current day and time using this format:
# January 2nd at 3:15
# April 1st at 10:18

SELECt DATE_FORMAT(NOW(),'%M %D at %H:%i');

# Create a tweets table that stores:
    # The Tweet content
    # A Username
    # Time it was created

DROP TABLE IF EXISTS tweets;
CREATE TABLE tweets (
    content  VARCHAR(50),
    username VARCHAR(20) NOT NULL PRIMARY KEY,
    created_time  TIMESTAMP DEFAULT NOW()    
);

INSERT INTO tweets(content,username)
VALUES ('Good Morning!','rajubhat'),
('I work as a Software Engineer','chandanbhat');

SELECT * FROM tweets;

# Run the below two commands on the console after some time.
# INSERT INTO tweets(content,username) VALUES ('I love my Family','harshey');
# SELECT * FROM tweets;