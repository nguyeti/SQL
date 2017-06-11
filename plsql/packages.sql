-- test PL/SQL - packages - 2017/06/11
-- test


CREATE OR REPLACE PACKAGE pkg_test IS
    PROCEDURE p_test;
    PROCEDURE p_test_id (emp_id NUMBER);
END pkg_test;


CREATE OR REPLACE PACKAGE BODY pkg_test IS
    PROCEDURE p_test 
    IS
    CURSOR cur_emp IS 
    SELECT * FROM employees;
    emp_info    employees%ROWTYPE;
    BEGIN
        FOR emp_info in cur_emp
        LOOP
            DBMS_OUTPUT.PUT_LINE(emp_info.first_name || ' - ' || emp_info.last_name || ' - ' || emp_info.salary);
        END LOOP;
    END p_test;

    PROCEDURE p_test_id (emp_id NUMBER)
    IS
    CURSOR cur_emp IS 
    SELECT * FROM employees
    WHERE employee_id = emp_id;
    emp_info    employees%ROWTYPE;
    BEGIN
        FOR emp_info in cur_emp
        LOOP
            DBMS_OUTPUT.PUT_LINE(emp_info.first_name || ' - ' || emp_info.last_name || ' - ' || emp_info.salary);
        END LOOP;
    END p_test_id;
END pkg_test;


exec pkg_test.p_test();
