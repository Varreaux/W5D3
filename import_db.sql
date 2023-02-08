PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS user;






CREATE TABLE user (
id INTEGER PRIMARY KEY,
fname TEXT NOT NULL,
lname TEXT NOT NULL );



CREATE TABLE questions (
id INTEGER PRIMARY KEY,
title TEXT NOT NULL,
body TEXT NOT NULL,
question_author_id INTEGER NOT NULL,
FOREIGN KEY (question_author_id) REFERENCES user(id));

CREATE TABLE question_follows (
id INTEGER PRIMARY KEY,
user_id INTEGER NOT NULL,
question_id INTEGER NOT NULL,
FOREIGN KEY (question_id) REFERENCES questions(id),
FOREIGN KEY (user_id) REFERENCES user(id));

CREATE TABLE replies (
id INTEGER PRIMARY KEY,
subject_question_id INTEGER NOT NULL,
parent_id INTEGER,
user_id INTEGER NOT NULL,
body TEXT NOT NULL,

FOREIGN KEY (subject_question_id) REFERENCES questions(id),
FOREIGN KEY (parent_id) REFERENCES replies(id),
FOREIGN KEY (user_id) REFERENCES user(id));


CREATE TABLE question_likes(
id INTEGER PRIMARY KEY,
user_id INTEGER NOT NULL,
question_id INTEGER NOT NULL,

FOREIGN KEY (question_id) REFERENCES question(id),
FOREIGN KEY (user_id) REFERENCES user(id));


INSERT INTO
    user (fname, lname)
VALUES
    ('Will', 'Davis'),
    ('Morgan', 'Waddington'),
    ('Fahim', 'Khan');

INSERT INTO
    questions (title, body, question_author_id)
VALUES
    ('Lunch time', 'Is it lunch time yet?', (Select id from user where fname = 'Will')),
    ('Sci Fi', 'What is a good book recommendation', (SELECT id FROM user WHERE fname = 'Morgan')),
    ('Alvin whereabouts', 'Where is Alvin? Is he okay?', (SELECT id FROM user WHERE fname = 'Fahim'))
    ;


INSERT INTO
    question_follows (user_id, question_id)
VALUES
    ((Select id from user where fname = 'Will'), (Select id from questions where title = 'Sci Fi')),
    ((Select id from user where fname = 'Morgan'), (Select id from questions where title = 'Lunch time')),
    ((Select id from user where fname = 'Morgan'), (Select id from questions where title = 'Alvin whereabouts')),
    ((Select id from user where fname = 'Will'), (Select id from questions where question_author_id = (SELECT id FROM user WHERE fname = 'Fahim')));


