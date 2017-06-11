-- 2017-06-10 PL/SQL
-- CURSORS

SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(30);
    CURSOR cur_emp (emp_id NUMBER) IS -- !!!!
    -- CURSOR cur_emp (emp_id NUMBER := 150) IS -- !!!! WITH DEFAULT VALUE
        SELECT first_name 
        FROM employees
        WHERE employee_id < emp_id;
BEGIN
    OPEN cur_emp(105); -- !!!!!
    --OPEN cur_emp; -- !!!!!
    LOOP
        FETCH cur_emp INTO v_name;
        DBMS_OUTPUT.PUT_LINE(v_name);
        EXIT WHEN cur_emp%NOTFOUND;
    END LOOP;
    CLOSE cur_emp;
END;
/

-- cursor FOR LOOP
DECLARE
    CURSOR cur_emp IS 
        SELECT first_name 
        FROM employees
        WHERE employee_id < 150;
BEGIN
    FOR v IN cur_emp
    LOOP
        DBMS_OUTPUT.PUT_LINE(v.first_name);
    END LOOP;
END;
/

-- cursor FOR LOOP PARAMETER


DECLARE
    CURSOR cur_emp (emp_id NUMBER := 150) IS -- !!!! WITH DEFAULT VALUE
        SELECT first_name 
        FROM employees
        WHERE employee_id > emp_id;
BEGIN
    FOR v in cur_emp(120)
    LOOP
        DBMS_OUTPUT.PUT_LINE(v.first_name);
    END LOOP;
END;
/