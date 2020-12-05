USE ig_clone;

-- Challenge 1: We want to reward our users who have been around the longest.Find the 5 oldest users.

SELECT * FROM users ORDER BY created_at LIMIT 5;

-- Challenge 2: What day of the week do most users register on? We need to figure out when to schedule an ad campgain

SELECT
    DATE_FORMAT(created_at,'%W') AS Day,
    COUNT(*) AS Frequency
FROM users
GROUP BY Day
ORDER BY Frequency DESC LIMIT 1;

-- Challenge 3: We want to target our inactive users with an email campaign. Find the users who have never posted a photo

SELECT
    username AS 'User'
FROM users LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.image_url IS NULL;

# Alternate solution using HAVING CLAUSE (cause WHERE clause doesnt support)
SELECT
    username AS 'User',
    COUNT(image_url) AS 'Count'
FROM users LEFT JOIN photos ON users.id = photos.user_id
GROUP BY users.id
HAVING COUNT(photos.image_url) = 0
ORDER BY users.username;

-- Challenge 4: We're running a new contest to see who can get the most likes on a single photo.WHO WON??!!

# Soln 1: Using Sub-Queries. But usually Sub Queries are slower. Also only data from single table can be displayed in the output unlike joins.
SELECT
    username AS 'User'
FROM users WHERE users.id = 
(SELECT
    photos.user_id
FROM photos JOIN likes ON photos.id = likes.photo_id
GROUP BY likes.photo_id
ORDER BY COUNT(*) DESC LIMIT 1);

SELECT
    users.username AS 'User',
    image_url AS Post,
    COUNT(*) AS Total_Likes
FROM photos JOIN likes ON photos.id = likes.photo_id
JOIN users ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY Total_Likes DESC LIMIT 1;

-- Challenge 5: Our Investors want to know... How many times does the average user post?

SELECT (SELECT COUNT(*) FROM photos)/(SELECT COUNT(*) FROM users) AS 'Average Post per User';

SELECT COUNT(id)/(SELECT COUNT(*) FROM users) AS 'Average Post per User' FROM photos;
# select
#   AVG(rs.POSTS)
# from
#   (
#     select
#       COUNT(photos.id) AS POSTS
#     from
#       users left join photos on users.id = photos.user_id
#     group by
#       username
#   ) rs; 
 
 
# Notes:
# --we use COUNT(photos.id) instead of COUNT(*) 
# because we dont want to tally up Nulls (count NULL as a submission)
# reference: https://stackoverflow.com/questions/3003457/count-vs-countcolumn-name-which-is-more-correct
 
# --we do a left join because we want to include users who have not uploaded a photo in the average
 
# --rs is an alias to the result set because derived tables need an alias
# reference:
# https://stackoverflow.com/questions/1888779/what-is-the-error-every-derived-table-must-have-its-own-alias-in-mysql

-- Challenge 6: A brand wants to know which hashtags to use in a post. What are the top 5 most commonly used hashtags?

SELECT
    tags.tag_name AS Tag,
    COUNT(*) AS Frequency
FROM tags JOIN photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tags.tag_name
ORDER BY Frequency DESC LIMIT 5

-- Challenge 7: We have a small problem with bots on our site... Find users who have liked every single photo on the site

SELECT
    users.username,
    COUNT(*) AS Total
FROM users JOIN likes ON users.id = likes.user_id
JOIN photos ON photos.id = likes.photo_id
GROUP BY users.id
HAVING TOTAL = (SELECT COUNT(*) FROM photos);

# Why Did we join photos with likes.... LOL That wasnt needed but it isnt wrong also!!
SELECT
    users.username,
    COUNT(*) AS Total
FROM users JOIN likes ON users.id = likes.user_id
GROUP BY users.id
HAVING TOTAL = (SELECT COUNT(*) FROM photos);

-- Challenge 8: We also have a problem with celebrities. Find users who have never commented on a photo

SELECT
    users.username AS 'User',
    COUNT(comments.id) AS 'Total Comments'
FROM users LEFT JOIN comments ON users.id = comments.user_id
GROUP BY users.id
HAVING COUNT(comments.id) = 0;

-- Mega Challenge: Are we overrun with bots and celebrity accounts? Find the percentage of our users who have either never commented on a photo or have commented on every photo

#Soln
# select concat((((select count(*) from (select u.username,
# l.user_id,
# count(*) number_of_likes
# from users u
# join likes l
# on u.id = l.user_id
# group by l.user_id
# having count(*) = (select count(*) from photos)) a)
# +
# (select count(*) from (select u.username,
# ifnull(c.comment_text,'never comment anything') as comment
# from users u
# left join
# comments c
# on u.id = c.user_id
# where c.comment_text is null) b))
# /
# (select count(*) from users))*100, '%')
# as percent_of_comment_and_non_comment_users;








# SELECT ((()+())*100)/()    AS Percentage;

# SELECT
#     COUNT(*)
# FROM users as uu WHERE uu.username = 
#     (SELECT
#         users.username
#     FROM users AS u LEFT JOIN comments AS c ON u.id = c.user_id
#     GROUP BY u.id
#     HAVING COUNT(c.id) = 0)
# ;