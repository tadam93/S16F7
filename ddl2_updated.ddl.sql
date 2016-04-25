DROP SEQUENCE P_Department_seq ; 
create sequence P_Department_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER P_Department_PK_trig 
; 

create or replace trigger P_Department_PK_trig 
before insert on P_Department
for each row 
begin 
select P_Department_seq.nextval into :new.dept_no from dual; 
end; 
/

DROP SEQUENCE P_Employee_Projects_seq ; 
create sequence P_Employee_Projects_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER P_Employee_Projects_PK_trig 
; 

create or replace trigger P_Employee_Projects_PK_trig 
before insert on P_Employee_Projects
for each row 
begin 
select P_Employee_Projects_seq.nextval into :new.employee_project_id from dual; 
end; 
/

DROP SEQUENCE P_Parent_child_seq ; 
create sequence P_Parent_child_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER P_Parent_child_PK_trig 
; 

create or replace trigger P_Parent_child_PK_trig 
before insert on P_Parent_child
for each row 
begin 
select P_Parent_child_seq.nextval into :new.parent_child_id from dual; 
end; 
/

DROP SEQUENCE P_Person_seq ; 
create sequence P_Person_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER P_Person_PK_trig 
; 

create or replace trigger P_Person_PK_trig 
before insert on P_Person
for each row 
begin 
select P_Person_seq.nextval into :new.person_id from dual; 
end; 
/

DROP SEQUENCE P_Projects_seq ; 
create sequence P_Projects_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER P_Projects_PK_trig 
; 

create or replace trigger P_Projects_PK_trig 
before insert on P_Projects
for each row 
begin 
select P_Projects_seq.nextval into :new.project_no from dual; 
end; 
/

DROP INDEX P_Person_person_id_FK_0 ;
CREATE INDEX P_Person_person_id_FK_0 ON P_Employee_Projects(P_Person_person_id) ;
DROP INDEX P_Projects_project_no_FK_1 ;
CREATE INDEX P_Projects_project_no_FK_1 ON P_Employee_Projects(P_Projects_project_no) ;
DROP INDEX P_Person_person_id_FK_2 ;
CREATE INDEX P_Person_person_id_FK_2 ON P_Parent_child(P_Person_person_id) ;
DROP INDEX P_Department_dept_no_FK_3 ;
CREATE INDEX P_Department_dept_no_FK_3 ON P_Person(P_Department_dept_no) ;
DROP INDEX P_Parent_child_parent__FK_4 ;
CREATE INDEX P_Parent_child_parent__FK_4 ON P_Person(P_Parent_child_parent_child_id) ;
DROP INDEX P_Person_person_id_FK_5 ;
CREATE INDEX P_Person_person_id_FK_5 ON P_Person(P_Person_person_id) ;
DROP INDEX P_Person_person_id1_FK_6 ;
CREATE INDEX P_Person_person_id1_FK_6 ON P_Person(P_Person_person_id1) ;
DROP INDEX P_Department_dept_no_FK_7 ;
CREATE INDEX P_Department_dept_no_FK_7 ON P_Projects(P_Department_dept_no) ;
DROP INDEX P_Person_person_id_FK_8 ;
CREATE INDEX P_Person_person_id_FK_8 ON P_Projects(P_Person_person_id) ;
DROP INDEX P_Projects_project_no_FK_9 ;
CREATE INDEX P_Projects_project_no_FK_9 ON P_Projects(P_Projects_project_no) ;
