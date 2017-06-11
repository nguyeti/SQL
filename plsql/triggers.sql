---- to update/delete/insert rows in a multi table view >> INSTEAD OF UPDATE/DELETE/INSERT TRIGGER

-- TRIGGER
SET SERVEROUTPUT ON;
CREATE TABLE superheroes (name VARCHAR2(30));

CREATE OR REPLACE TRIGGER DML_SUPERHEROES
BEFORE INSERT OR UPDATE OR DELETE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR2(30);
BEGIN
    SELECT user into v_user FROM DUAL;
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('Row inserted by ' || v_user);
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('Row deleted by ' || v_user);
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('Row updated by ' || v_user);
    END IF;
END;
/


insert into superheroes values ('Ironman');
update superheroes set name = 'toto' where name = 'Ironman' ;
select * from superheroes;
delete from superheroes where name = 'toto';

-- AUDIT
CREATE TABLE sh_audit (
    new_entry VARCHAR2(30),
    old_entry VARCHAR2(30),
    entry_date VARCHAR2(30),
    entry_type VARCHAR2(30),
    username VARCHAR2(30));

desc sh_audit;
CREATE OR REPLACE TRIGGER superheroes_audit
BEFORE INSERT OR DELETE OR UPDATE on superheroes
FOR EACH ROW
DECLARE
    v_user VARCHAR2(30);
    v_date VARCHAR2(30);
BEGIN
    SELECT user, TO_CHAR(sysdate, 'MM/DD/YYYY HH24:MI:SS') into v_user, v_date FROM dual;
    IF INSERTING THEN
        INSERT INTO sh_audit VALUES (:NEW.name, null, v_date, 'INSERT', v_user);
    ELSIF DELETING THEN
        INSERT INTO sh_audit VALUES (null, :OLD.name, v_date, 'DELETE', v_user);
    ELSIF UPDATING THEN
        INSERT INTO sh_audit VALUES (:NEW.name, :OLD.name, v_date, 'UPDATE', v_user);
    END IF;
END;
/

insert into superheroes values ('Superman');
update superheroes set name = 'toto' where name = 'Superman' ;
select * from superheroes;
delete from superheroes where name = 'toto';

select * from sh_audit;


select ora_dict_obj_type from dual ;


CREATE TABLE schema_audit (
    ddl_date DATE,
    ddl_user varchar2(15),
    object_created varchar2(15),
    object_name varchar2(15),
    ddl_operation varchar2(15)
);


CREATE OR REPLACE TRIGGER hr_schema_audit
AFTER DDL ON SCHEMA
-- in sys session can do AFTER DDL ON DATABASE to audit the whole database
BEGIN
    INSERT INTO schema_audit VALUES (
        sysdate,
        sys_context('USERENV','CURRENT_USER'),
        ora_dict_obj_type,
        ora_dict_obj_name,
        ora_sysevent
    );
END;
/


create table toto (name number);
ALTER Table toto add name2 varchar2(20);
drop table toto;
select * from schema_audit;
