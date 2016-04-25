DROP SEQUENCE P_Department_seq ; 
create sequence P_Department_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger P_Department_PK_trig 
before insert on P_Department
for each row 
begin 
select P_Department_seq.nextval into :new.dept_no from dual; 
end; 
/
alter table P_Department add created date ; 
alter table P_Department add created_by VARCHAR2 (255) ; 
alter table P_Department add row_version_number integer ; 
alter table P_Department add updated date ; 
alter table P_Department add updated_by VARCHAR2 (255) ; 
/
create or replace trigger P_Department_AUD_trig 
before insert or update on P_Department 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE P_Employee_Projects_seq ; 
create sequence P_Employee_Projects_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger P_Employee_Projects_PK_trig 
before insert on P_Employee_Projects
for each row 
begin 
select P_Employee_Projects_seq.nextval into :new.employee_project_id from dual; 
end; 
/
alter table P_Employee_Projects add created date ; 
alter table P_Employee_Projects add created_by VARCHAR2 (255) ; 
alter table P_Employee_Projects add row_version_number integer ; 
alter table P_Employee_Projects add updated date ; 
alter table P_Employee_Projects add updated_by VARCHAR2 (255) ; 
/
create or replace trigger P_Employee_Projects_AUD_trig 
before insert or update on P_Employee_Projects 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE P_Parent_child_seq ; 
create sequence P_Parent_child_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger P_Parent_child_PK_trig 
before insert on P_Parent_child
for each row 
begin 
select P_Parent_child_seq.nextval into :new.parent_child_id from dual; 
end; 
/
alter table P_Parent_child add created date ; 
alter table P_Parent_child add created_by VARCHAR2 (255) ; 
alter table P_Parent_child add row_version_number integer ; 
alter table P_Parent_child add updated date ; 
alter table P_Parent_child add updated_by VARCHAR2 (255) ; 
/
create or replace trigger P_Parent_child_AUD_trig 
before insert or update on P_Parent_child 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE P_Person_seq ; 
create sequence P_Person_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger P_Person_PK_trig 
before insert on P_Person
for each row 
begin 
select P_Person_seq.nextval into :new.person_id from dual; 
end; 
/
alter table P_Person add created date ; 
alter table P_Person add created_by VARCHAR2 (255) ; 
alter table P_Person add row_version_number integer ; 
alter table P_Person add updated date ; 
alter table P_Person add updated_by VARCHAR2 (255) ; 
/
create or replace trigger P_Person_AUD_trig 
before insert or update on P_Person 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE P_Projects_seq ; 
create sequence P_Projects_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger P_Projects_PK_trig 
before insert on P_Projects
for each row 
begin 
select P_Projects_seq.nextval into :new.project_no from dual; 
end; 
/
alter table P_Projects add created date ; 
alter table P_Projects add created_by VARCHAR2 (255) ; 
alter table P_Projects add row_version_number integer ; 
alter table P_Projects add updated date ; 
alter table P_Projects add updated_by VARCHAR2 (255) ; 
/
create or replace trigger P_Projects_AUD_trig 
before insert or update on P_Projects 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
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
