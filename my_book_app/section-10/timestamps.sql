# Time stamps are usually used to note when a partivular object(blog post, product, comment etc)
# was created. It is same as DateTime as it stores both date and time but it differs in the range of possible date times.

USE book_store;

DROP TABLE IF EXISTS posts; 
CREATE TABLE posts(
    title  VARCHAR(20),
    content  VARCHAR(100),
    created_at  TIMESTAMP DEFAULT NOW(),
    created_at_practical  TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO posts (title, content)
VALUES ('Hello World!','This is a hello world program!'),
('Variables in C++','We will learn about variables and datatypes in C++');

SELECT * FROM posts;

UPDATE posts SET created_at = NOW() + INTERVAL 1 HOUR WHERE title LIKE 'Var%';

SELECT * FROM posts;

# Run the below 2 commands after some time on the console and observe the difference.
# UPDATE posts SET title='Hello World!!' WHERE title LIKE '%Hello%';
# SELECT * FROM posts;

