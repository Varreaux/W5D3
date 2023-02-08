CREATE TABLE user (
id INTEGER PRIMARY KEY,
fname TEXT NOT NULL,
lname TEXT NOT NULL,

);

CREATE TABLE questions (
id INTEGER PRIMARY KEY,
title TEXT NOT NULL,
body TEXT NOT NULL,
question_author_id INTEGER NOT NULL,

FOREIGN KEY question_author_id REFERENCES user(id)

);

CREATE TABLE question_follows (
id INTEGER PRIMARY KEY,
user_id INTEGER NOT NULL,
question_id INTEGER NOT NULL,

FOREIGN KEY question_id REFERENCES question(id),
FOREIGN KEY user_id REFERENCES user(id)

);