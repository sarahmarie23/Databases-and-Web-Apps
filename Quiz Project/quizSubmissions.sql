  DROP TABLE submissions CASCADE CONSTRAINTS;

CREATE TABLE submissions
    (SUB_ID         INTEGER NOT NULL,
     q_1            CHAR(1) NOT NULL,
     q_2            CHAR(1) NOT NULL,
     q_3            CHAR(1) NOT NULL,
     q_4            CHAR(1) NOT NULL,
     q_5            CHAR(1) NOT NULL,
     q_6            CHAR(1) NOT NULL,
     q_7            VARCHAR2(25) NOT NULL,
     q_8            VARCHAR2(25) NOT NULL,
     PRIMARY KEY    (sub_id)
);

  DROP SEQUENCE id_seq;
   
CREATE SEQUENCE id_seq
 START WITH 10000
 INCREMENT BY 5
 NOCACHE
 NOCYCLE;
 
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
     PRIMARY KEY    (sub_id)
);

INSERT INTO answers
VALUES
(1000, '4', '2', '1', '3', '2', '1', 'PORT', 'STARBOARD');
