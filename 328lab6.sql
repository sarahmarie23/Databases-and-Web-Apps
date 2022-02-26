-- 2/25/22


start set-up-ex-tbls.sql

set serveroutput on

spool 328lab6-results.txt


CREATE OR REPLACE TRIGGER ck_empl_rep 
    BEFORE INSERT OR UPDATE 
    ON customer
    FOR EACH ROW 

DECLARE
    emp_job_title VARCHAR2(20); 

BEGIN

    SELECT job_title
    INTO emp_job_title
    FROM empl 
    WHERE empl_num = :new.empl_rep;


    if emp_job_title <> 'Sales' then
        raise_application_error(-20000, 'empl rep must
        be in Sales for insertion');
    else
        DBMS_OUTPUT.PUT_LINE('Insertion allowed!');

    end if;
           

END;
/

-- insert that works 
UPDATE customer
SET empl_rep = '7844'
WHERE cust_id = '100001';

-- insert with non-sales employee
UPDATE customer
SET empl_rep = '7788'
WHERE cust_id = '100002';

-- query showing all rows in the customer table
SELECT *
FROM customer;

spool off
