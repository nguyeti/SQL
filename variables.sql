SET SERVEROUTPUT ON;

DECLARE
    v_salary number(8);
    v_fname VARCHAR2(20);
BEGIN
    SELECT salary, first_name INTO v_salary, v_fname 
    FROM employees WHERE employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE(v_salary || ' - ' || v_fname);
END;
/


-- ANCHORED DATATYPE
-- %TYPE

DECLARE
    v_salary employees.salary%TYPE;
    v_fname employees.first_name%TYPE;
BEGIN
    SELECT salary, first_name INTO v_salary, v_fname 
    FROM employees WHERE employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE(v_salary || ' - ' || v_fname);
END;
/


-- CONSTANTS

DECLARE
    c_constant CONSTANT number(8) := 1000;
    c_constant2 CONSTANT number(8) NOT NULL DEFAULT 500;
BEGIN
    DBMS_OUTPUT.PUT_LINE(c_constant + c_constant2);
END;
/

-- BIND VARIABLES / HOST VARIABLES

--declare a bind variable
VARIABLE v_bind VARCHAR2(10);
--initialization of the bind variable
EXEC :v_bind := 'timothee';

BEGIN
    -- 2nd way to initialize
    :v_bind := 'nguyen';
    -- print
    DBMS_OUTPUT.PUT_LINE(:v_bind);
    
END;
/

PRINT :v_bind;

SET AUTOPRINT ON;
VARIABLE v_bind2 VARCHAR2(10);
EXEC :v_bind2 := 'timothee'; -- prints the value of the bind variable