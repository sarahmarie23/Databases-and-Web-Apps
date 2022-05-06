-- The grade_quiz function takes in the name 
-- of the user and goes through each of their
-- answers and compares them to the solution.
-- The total correct is returned back and also
-- stored in the 'submissions' table.

SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION grade_quiz(
    in_quizuser VARCHAR2
)

RETURN NUMBER
IS
    l_score NUMBER := 0;
    l_sub_id NUMBER;
    
BEGIN

    SELECT   MAX(sub_id)
    INTO     l_sub_id
    FROM     submissions;
    
    UPDATE   submissions
    SET      num_correct = 0;

    UPDATE   submissions s
    SET      num_correct = num_correct + 1
    WHERE    EXISTS
             (SELECT  quiz_id
             FROM     answers a
             WHERE    a.a_1 = s.q_1
             AND      a.quiz_id = s.quiz_id);

    UPDATE   submissions s
    SET      num_correct = num_correct + 1
    WHERE    EXISTS
             (SELECT  quiz_id
             FROM     answers a
             WHERE    a.a_2 = s.q_2
             AND      a.quiz_id = s.quiz_id);
            
    UPDATE   submissions s
    SET      num_correct = num_correct + 1
    WHERE    EXISTS
             (SELECT  quiz_id
             FROM     answers a
             WHERE    a.a_3 = s.q_3
             AND      a.quiz_id = s.quiz_id);  
    
    UPDATE   submissions s
    SET      num_correct = num_correct + 1
    WHERE    EXISTS
             (SELECT  quiz_id
             FROM     answers a
             WHERE    a.a_4 = s.q_4
             AND      a.quiz_id = s.quiz_id);
            
    UPDATE   submissions s
    SET      num_correct = num_correct + 1
    WHERE    EXISTS
             (SELECT  quiz_id
             FROM     answers a
             WHERE    a.a_5 = s.q_5
             AND      a.quiz_id = s.quiz_id);
            
    UPDATE   submissions s
    SET      num_correct = num_correct + 1
    WHERE    EXISTS
             (SELECT  quiz_id
             FROM     answers a
             WHERE    a.a_6 = s.q_6
             AND      a.quiz_id = s.quiz_id);
            
    UPDATE   submissions s
    SET      num_correct = num_correct + 1
    WHERE    EXISTS
             (SELECT  quiz_id
             FROM     answers a
             WHERE    a.a_7 = s.q_7
             AND      a.quiz_id = s.quiz_id);
            
    UPDATE   submissions s
    SET      num_correct = num_correct + 1
    WHERE    EXISTS
             (SELECT  quiz_id
             FROM     answers a
             WHERE    a.a_8 = s.q_8
             AND      a.quiz_id = s.quiz_id);
            
    SELECT   num_correct
    INTO     l_score
    FROM     submissions
    WHERE    sub_id = l_sub_id;
                        
    
    RETURN   l_score;
    
END;
/

SHOW ERRORS