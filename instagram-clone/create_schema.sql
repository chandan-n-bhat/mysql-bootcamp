-- Instagram Clone
DROP DATABASE IF EXISTS instagram;
CREATE DATABASE instagram;

USE instagram;

-- Tables: Users
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS follows;
DROP TABLE IF EXISTS hashtags;
DROP TABLE IF EXISTS photo_tags;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS users;

# Note: The Primary key can be username but searching becomes slower especially
CREATE TABLE users(
    id    INT    PRIMARY KEY    AUTO_INCREMENT,
    username    VARCHAR(255)    NOT NULL    UNIQUE,
    passwd    VARCHAR(20)    NOT NULL    DEFAULT 'p@$$w0rd',
    created_at    TIMESTAMP    NOT NULL    DEFAULT NOW()
);


CREATE TABLE photos(
    id    INT    PRIMARY KEY    AUTO_INCREMENT,
    image_url    VARCHAR(100)    UNIQUE    NOT NULL,
    user_id    INT    NOT NULL,
    created_at    TIMESTAMP    DEFAULT NOW(),
    FOREIGN KEY (user_id)    REFERENCES users(id)    ON DELETE CASCADE
);

CREATE TABLE comments(
    id    INT    PRIMARY KEY    AUTO_INCREMENT,
    comment_text    VARCHAR(255)    NOT NULL DEFAULT '',
    created_at    TIMESTAMP    DEFAULT NOW(),
    photo_id    INT    NOT NULL,
    user_id    INT    NOT NULL,
    FOREIGN KEY (photo_id)    REFERENCES    photos(id)    ON DELETE CASCADE,
    FOREIGN KEY (user_id)    REFERENCES    users(id)    ON DELETE CASCADE
);

-- Why dont we add an id column explicitly?
-- Because we dont reference the like from any other table unlike the id of photos and users.
-- Thus we dont require an id column but to ensure that one user can like a photo once we 
-- make a composite primary key which ensures that the combination of user_id and photo_id is unique.
CREATE TABLE likes(
    created_at    TIMESTAMP    DEFAULT NOW(),
    photo_id    INT    NOT NULL,
    user_id    INT    NOT NULL,
    FOREIGN KEY (photo_id)    REFERENCES photos(id)    ON DELETE CASCADE,
    FOREIGN KEY (user_id)    REFERENCES users(id)    ON DELETE CASCADE,
    PRIMARY KEY (photo_id,user_id)
);

CREATE TABLE follows(
    follower_id    INT    NOT NULL,
    followee_id    INT    NOT NULL,
    created_at    TIMESTAMP    NOT NULL    DEFAULT NOW(),
    PRIMARY KEY(follower_id,followee_id),
    FOREIGN KEY (followee_id)    REFERENCES users(id),
    FOREIGN KEY (follower_id)    REFERENCES users(id)
);    

-- Possible Approaches for Hashtags
-- One Post can have many tags and each Tag can be used inmultiple Posts
-- Many:Many Relationship

-- Soln1: Add a column tags in photos table which stores a single string having all tags concatinated which can be split on '#' to find the individual tags. LIKE operator becomes handy to find those posts with certain tags. Easy to implement by lot of repetition and no additional info on hashtags can be stored. Special care needed while searching as LIKE 'food' returns hashtags like #sadfood etc.

-- Soln2: 

CREATE TABLE hashtags(
    id    INT    PRIMARY KEY    AUTO_INCREMENT,
    tag    VARCHAR(255)    NOT NULL    UNIQUE,
    created_at    TIMESTAMP    DEFAULT NOW()
);

CREATE TABLE photo_tags(
    photo_id    INT    NOT NULL,
    tag_id    INT    NOT NULL,
    PRIMARY KEY(photo_id,tag_id),
    FOREIGN KEY (photo_id)    REFERENCES photos(id),
    FOREIGN KEY (tag_id)    REFERENCES hashtags(id),

);
-- SELECT username,image_url FROM users join photos ON users.id = photos.user_id;