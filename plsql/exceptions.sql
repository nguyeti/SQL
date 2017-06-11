SET SERVEROUTPUT ON;

DECLARE
    var_dividend NUMBER := 24;
    var_divisor NUMBER := 0;
    var_result NUMBER;
    ex_zero EXCEPTION;
BEGIN
    IF var_divisor = 0 THEN
        RAISE ex_zero;
    END IF;
    var_result := var_dividend/var_divisor;
    DBMS_OUTPUT.PUT_LINE ( 'Result = ' ||var_result );
    
    EXCEPTION WHEN ex_zero THEN
    DBMS_OUTPUT.PUT_LINE ( 'Error Error - division by 0' );
END;
/

ACCEPT v_age NUMBER PROMPT 'What''s your age?';
DECLARE 
    age NUMBER := &v_age;
BEGIN
    IF age < 21 THEN
        RAISE_APPLICATION_ERROR(-20500, 'You are too young.');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('What would you like to drink?');
    
    EXCEPTION when others THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/



ACCEPT v_age NUMBER PROMPT 'What''s your age?';
DECLARE 
    age NUMBER := &v_age;
    ex_age EXCEPTION;
    PRAGMA EXCEPTION_INIT (ex_age, -20500); -- !!!!!
BEGIN
    IF age < 21 THEN
        RAISE_APPLICATION_ERROR(-20500, 'You are too young.');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('What would you like to drink?');
    
    EXCEPTION when ex_age THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/