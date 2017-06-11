-- PL/SQL - RECORDS - RECORDS DATATYPE

-- anchored datatype > %TYPE
-- records group of related data item 
-- table based record, cursor based record, user defined record %ROWTYPE



-- variable_name table_name%ROWTYPE;
-- variable_name cursor_name%ROWTYPE;


SELECT * FROM JOBS order by max_salary desc;

SET SERVEROUTPUT ON;

DECLARE
    rec_jobs jobs%ROWTYPE;
BEGIN
    SELECT job_id, job_title into rec_jobs.job_id, rec_jobs.job_title
    FROM jobs where JOB_ID='AD_PRES';
    DBMS_OUTPUT.PUT_LINE(rec_jobs.job_id || ' ' || rec_jobs.job_title);
END;
/


DECLARE
    CURSOR cur_job IS
    SELECT * FROM jobs;
    rec_jobs cur_job%ROWTYPE;
BEGIN
    FOR rec_jobs in cur_job
    LOOP
        DBMS_OUTPUT.PUT_LINE(rec_jobs.job_id || ' - ' || rec_jobs.job_title
            ||' - ' || rec_jobs.min_salary ||' - ' || rec_jobs.max_salary);
    END LOOP;
END;
/

-- user type records

DECLARE
    TYPE emp_info IS RECORD(
        f_name  employees.first_name%TYPE,
        d_name  departments.department_name%TYPE
    );
    var emp_info;
BEGIN
    SELECT first_name, department_name INTO var.f_name, var.d_name
    FROM employees JOIN departments USING (department_id)
    WHERE employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE(var.f_name || ' - ' || var.d_name);
END;
/
