drop view P_employee_view ;
drop view P_previous_employee_view ;
drop view P_project_employee_view ;
drop view P_manager_view ;
drop view P_president_view ;
drop view P_interim_manager_view ;
drop view P_previous_project_view ;
drop view P_current_project_view ;

create view P_employee_view as
SELECT
    person_id,
    type,
    home_address,
    zipcode,
    home_phone,
    first_name,
    last_name,
    salary,
    salary_exception,
    P_Department_dept_no,
    ISFIRED
FROM P_Person
where
    type = 'employee' OR
    type = 'previous-employee' OR
    type = 'project-employee' OR
    type = 'president' OR
    type = 'interim-manager' OR
    type = 'manager';

create or replace TRIGGER P_employee_trigger
     INSTEAD OF insert ON P_employee_view
     FOR EACH ROW
BEGIN
    insert into P_Person(
        person_id,
        type,
        home_address,
        zipcode,
        home_phone,
        first_name,
        last_name,
        salary,
        salary_exception,
        P_Department_dept_no)
		 VALUES (
    		:NEW.person_id,
        'employee',
        :NEW.home_address,
        :NEW.zipcode,
        :NEW.home_phone,
        :NEW.first_name,
        :NEW.last_name,
		    :NEW.salary,
        :NEW.salary_exception,
        :NEW.P_Department_dept_no) ;
END;
/

create view P_previous_employee_view as
SELECT
    person_id,
    first_name,
    last_name,
    isFired,
    salary_exception,
    P_Department_dept_no
FROM P_Person where type = 'previous-employee' ;

create or replace TRIGGER P_previous_employee_trigger
     INSTEAD OF insert ON P_previous_employee_view
     FOR EACH ROW
BEGIN
    insert into P_Person(
        person_id,
        first_name,
        last_name,
        type,
        salary,
        salary_exception,
        P_Department_dept_no,
        isFired)
         VALUES (
        :NEW.person_id,
        :NEW.first_name,
        :NEW.last_name,
        'previous-employee',
        :NEW.salary,
        :NEW.salary_exception,
        :NEW.P_Department_dept_no,
        :NEW.isFired) ;
END;
/
create view P_project_employee_view as
SELECT
    p.person_id,
    p.first_name,
    p.last_name,
    p.salary,
    p.salary_exception,
    p.P_Department_dept_no,
    cur.P_Project_project_no
FROM
    P_Person p
LEFT JOIN
    r5_curproj_mem cur ON cur.P_Person_person_id = p.person_id
WHERE type = 'project-employee' ;

create or replace TRIGGER P_project_employee_trigger
     INSTEAD OF insert ON P_project_employee_view
     FOR EACH ROW
BEGIN
    insert into P_Person(
        person_id,
        first_name,
        last_name,
        type,
        salary,
        salary_exception,
        P_Department_dept_no)
         VALUES (
        :NEW.person_id,
        :NEW.first_name,
        :NEW.last_name,
        'project-employee',
        :NEW.salary,
        :NEW.salary_exception,
        :NEW.P_Department_dept_no) ;
END;
/


create view P_manager_view as
SELECT
    person_id,
    first_name,
    last_name,
    salary,
    salary_exception,
    P_Department_dept_no,
    bonus
FROM P_Person where type = 'manager' ;

create or replace TRIGGER P_manager_trigger
     INSTEAD OF insert ON P_manager_view
     FOR EACH ROW
BEGIN
    insert into P_Person(
        person_id,
        first_name,
        last_name,
        type,
        salary,
        salary_exception,
        P_Department_dept_no,
        bonus)
         VALUES (
        :NEW.person_id,
        :NEW.first_name,
        :NEW.last_name,
        'manager',
        :NEW.salary,
        :NEW.salary_exception,
        :NEW.P_Department_dept_no,
        :NEW.bonus) ;
END;
/

create view P_president_view as
SELECT
    person_id,
    first_name,
    last_name,
    salary,
    salary_exception,
    P_Department_dept_no,
    bonus
FROM P_Person where type = 'president' ;

create or replace TRIGGER P_president_trigger
     INSTEAD OF insert ON P_president_view
     FOR EACH ROW
BEGIN
    insert into P_Person(
        person_id,
        first_name,
        last_name,
        type,
        salary,
        salary_exception,
        P_Department_dept_no,
        bonus)
         VALUES (
        :NEW.person_id,
        :NEW.first_name,
        :NEW.last_name,
        'president',
        :NEW.salary,
        :NEW.salary_exception,
        :NEW.P_Department_dept_no,
        :NEW.bonus) ;
END;
/

create view P_interim_manager_view as
SELECT
    p.person_id,
    p.first_name,
    p.last_name,
    p.salary,
    p.salary_exception,
    p.P_Department_dept_no,
    cur.P_Project_project_no,
    p.bonus
FROM
    P_Person p
LEFT JOIN
    r5_curproj_mem cur ON cur.P_Person_person_id = p.person_id
WHERE type = 'interim-manager' ;

create or replace TRIGGER P_manager_trigger
     INSTEAD OF insert ON P_manager_view
     FOR EACH ROW
BEGIN
    insert into P_Person(
        person_id,
        first_name,
        last_name,
        type,
        salary,
        salary_exception,
        P_Department_dept_no,
        bonus)
         VALUES (
        :NEW.person_id,
        :NEW.first_name,
        :NEW.last_name,
        'interim-manager',
        :NEW.salary,
        :NEW.salary_exception,
        :NEW.P_Department_dept_no,
        :NEW.bonus) ;
END;
/

create view P_previous_project_view as
SELECT
    project_no,
    project_title,
    end_date_month,
    end_date_year,
    end_date_day,
    P_Project_parent_id,
    project_manager,
    est_person_hours
FROM
    P_Project
WHERE project_active = 'n' AND end_date_month IS NOT NULL;

create or replace TRIGGER P_previous_project_trigger
     INSTEAD OF insert ON P_previous_project_view
     FOR EACH ROW
BEGIN
    insert into P_Project(
        project_no,
        project_title,
        project_active,
        end_date_month,
        end_date_year,
        end_date_day,
        P_Project_parent_id,
        project_manager,
        est_person_hours)
         VALUES (
        :NEW.project_no,
        :NEW.project_title,
        'n',
        :NEW.end_date_month,
        :NEW.end_date_year,
        :NEW.end_date_day,
        :NEW.P_Project_parent_id,
        :NEW.project_manager,
        :NEW.est_person_hours) ;
END;
/


create view P_current_project_view as
SELECT
    project_no,
    project_title,
    P_Project_parent_id,
    project_manager
FROM
    P_Project
WHERE project_active = 'y' ;

create or replace TRIGGER P_current_project_trigger
     INSTEAD OF insert ON P_current_project_view
     FOR EACH ROW
BEGIN
    insert into P_Project(
        project_no,
        project_title,
        project_active,
        P_Project_parent_id,
        project_manager)
         VALUES (
        :NEW.project_no,
        :NEW.project_title,
        'y',
        :NEW.P_Project_parent_id,
        :NEW.project_manager) ;
END;
/
