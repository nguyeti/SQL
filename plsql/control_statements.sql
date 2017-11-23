-- CONTROL STATEMENTS EXAMPLE
SET SERVEROUTPUT ON;
DECLARE
    v_number NUMBER := 2;
BEGIN
    IF v_number > 5 THEN
        DBMS_OUTPUT.PUT_LINE('greater than 5');
    ELSIF MOD(v_number, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('even number');
    ELSE
        DBMS_OUTPUT.PUT_LINE('lower than 5');
    END IF;
END;
/
