-- 2017-06-10 PL/SQL
-- CURSORS

/*
Cursor is a pointer to a memory area called context area.
The context are is a memory region inside the PGA (Process Global Area) assigned
to hold the information about the processing of a select statement or DML
statement. It helps oracle server in processing an SQL statement by holding the
important information about that statement.

Cursors : 1. implicit cursor (automatically created by the oracle server)
2. explicit cursor (user defined cursors)

1. DECLARE
    CURSOR cursor_name IS select_statement;
2. OPEN
    OPEN cursor_name;
3. FETCH
    FETCH cursor_name INTO PL/SQL variable;
    FETCH cursor_name INTO PL/SQL record;
4. CLOSE
    CLOSE cursor_name;
*/


SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(30);
    CURSOR cur_emp IS 
        SELECT first_name 
        FROM employees
        WHERE employee_id < 105;
BEGIN
    OPEN cur_emp;
    LOOP
        FETCH cur_emp INTO v_name;
        DBMS_OUTPUT.PUT_LINE(v_name);
        EXIT WHEN cur_emp%NOTFOUND;
    END LOOP;
    CLOSE cur_emp;
END;
/