CREATE DATABASE ig_clone;
USE ig_clone;


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users (username) VALUES
('BlueTheCat'),
('CharlieBrown'),
('ColtSteele');

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO photos(image_url, user_id) VALUES
('/alsked78', 1),
('/alskee79', 2),
('/alskef80', 2);

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

INSERT INTO comments(comment_text, user_id, photo_id) VALUES
('Meow!', 1, 2),
('Nice!', 3, 2),
('Super Cool!', 2, 1);

CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

INSERT INTO likes(user_id, photo_id) VALUES
(1,1),
(2,1),
(1,2),
(1,3),
(3,3);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

INSERT INTO follows(follower_id, followee_id) VALUES
(1,2),
(1,3),
(3,1),
(2,3);

CREATE TABLE tags (
   id INTEGER AUTO_INCREMENT PRIMARY KEY,
   tag_name VARCHAR(255) UNIQUE,
   created_at TIMESTAMP DEFAULT NOW() 
);

CREATE TABLE photo_tags (
   photo_id INTEGER NOT NULL,
   tag_id INTEGER NOT NULL,
   FOREIGN KEY(photo_id) REFERENCES photos(id),
   FOREIGN KEY(tag_id) REFERENCES tags(id),
   PRIMARY KEY(photo_id, tag_id)
);
