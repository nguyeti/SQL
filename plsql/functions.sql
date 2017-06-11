-- Function for calculating the area of a circle
-- test
CREATE OR REPLACE FUNCTION circle_area (radius NUMBER)
RETURN NUMBER IS

pi CONSTANT NUMBER(7,3) := 3.141;
area NUMBER(7,3);

BEGIN
    area := pi * POWER(radius,2);
    RETURN area;
END;
/

select circle_area(20) from dual;
