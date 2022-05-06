-- 'answers' holds onto all the solutions to a quiz, which 
-- is marked by the quiz_id. It allows there to be multiple
-- quizzes that users could take, but for now, there's only
-- one quiz, so only one row in 'answers'

   DROP TABLE answers CASCADE CONSTRAINTS; 
 
 CREATE TABLE answers
    (QUIZ_ID        INTEGER NOT NULL,
     a_1            CHAR(1) NOT NULL,
     a_2            CHAR(1) NOT NULL,
     a_3            CHAR(1) NOT NULL,
     a_4            CHAR(1) NOT NULL,
     a_5            CHAR(1) NOT NULL,
     a_6            CHAR(1) NOT NULL,
     a_7            VARCHAR2(25) NOT NULL,
     a_8            VARCHAR2(25) NOT NULL,
     PRIMARY KEY    (quiz_id)
);

INSERT INTO answers
VALUES
(1000, '4', '2', '1', '3', '2', '1', 'PORT', 'STARBOARD');


-- 'submissions' has a row for every time a user takes a
-- quiz. It keeps track of their name, which quiz they 
-- took, and the number correct. Every row gets a unique
-- submission ID, so a user could take a quiz more than
-- once and all their responses would be saved.

  DROP TABLE submissions CASCADE CONSTRAINTS;

CREATE TABLE submissions
    (SUB_ID         INTEGER NOT NULL,
     quiz_id        INTEGER NOT NULL,
     name           VARCHAR2(25) NOT NULL,
     q_1            CHAR(1) NOT NULL,
     q_2            CHAR(1) NOT NULL,
     q_3            CHAR(1) NOT NULL,
     q_4            CHAR(1) NOT NULL,
     q_5            CHAR(1) NOT NULL,
     q_6            CHAR(1) NOT NULL,
     q_7            VARCHAR2(25) NOT NULL,
     q_8            VARCHAR2(25) NOT NULL,
     num_correct    INTEGER,
     PRIMARY KEY    (sub_id),
     FOREIGN KEY    (quiz_id) REFERENCES answers
);

  DROP SEQUENCE id_seq;
   
CREATE SEQUENCE id_seq
 START WITH 10000
 INCREMENT BY 5
 NOCACHE
 NOCYCLE;
 