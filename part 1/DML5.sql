-- Truncate each of the sample data tables using the following statement: 
truncate table P_Person; -- for example - truncate table dept;
truncate table P_Department;
truncate table P_Project;
truncate table P_Employee_Projects;
truncate table P_Parent_Child;

-- Disable the PK triggers on the sample data tables using the following syntax: 
alter trigger P_Department_PK disable; -- for example - alter trigger DEPT_VIEW_TRIGGER disable; alter trigger P_Employee_Projects_PK disable;
alter trigger P_Parent_child_PK disable;
alter trigger P_Person_PK disable;
alter trigger P_Projects_PK disable;

-- If you have circular Foreign Key dependencies, disable enough of the Foreign Key Constraints to break the cycle using the following syntax:
alter table P_employee_projects disable constraint "P_Emp_Proj_Person_FK"
alter table P_employee_projects disable constraint "P_Emp_Proj_Proj_FK"
alter table P_Parent_child disable constraint "P_Parent_child_P_Person_FK"
alter table P_Parent_child disable constraint "P_Parent_child_P_Person_FKv1”
alter table P_Person disable constraint "P_Person_P_Parent_child_FK"
alter table P_Person disable constraint "P_Person_P_Person_FK”
alter table P_Person disable constraint "P_Person_P_Person_FKv1”
alter table P_Projects disable constraint "P_Projects_P_Department_FK"
alter table P_Projects disable constraint "P_Projects_P_Person_FK”
alter table P_Projects disable constraint "P_Projects_P_Projects_FK”

-- Put all of the sample data INSERT statements here. Be sure to use PK and FK values that -- are < 100 so that they won't be repeated by the PK triggers when they are re-enabled.

INSERT into P_Person (person_id, first_name, last_name, home_address, us_citizen, salary, type)
  VALUES (1, “Adam”, “Poncher”, “2700 Nueces TX”, 1, 100000, “manager”);
INSERT into P_Person (person_id, first_name, last_name, home_address, us_citizen, salary, type)
  VALUES (2, “Trevor”, “Adams”, “2807 Rio TX”, 1, 140000, “president”);
INSERT into P_Person (person_id, first_name, last_name, home_address, us_citizen, salary, type)
  VALUES (3, “Victor”, “Maeteas”, “801 W. 24th TX”, 1, 60000, “employee”);
INSERT into P_Person (person_id, first_name, last_name, home_address, us_citizen, salary, type)
  VALUES (4, “Conner”, “Col”, “801 W. 24th TX ”, 1, 80000, “interim-manager”);
INSERT into P_Person (person_id, first_name, last_name, home_address, us_citizen, salary, type)
  VALUES (5, “West”, “Hubble”, “810 N 6th TX”, 1, 30000, “previous-employee”);

INSERT into P_Projects (project_no, project_title) VALUES (1, “ALPHA”);
INSERT into P_Projects (project_no, project_title) VALUES (2, “BETA”);
INSERT into P_Projects (project_no, project_title) VALUES (3, “GAMMA”);

INSERT into P_Department (dept_no, dept_name) VALUES (10, “Accounting”);
INSERT into P_Department (dept_no, dept_name) VALUES (20, “Sales”);
INSERT into P_Department (dept_no, dept_name) VALUES (30, “Research”);
a
INSERT into P_Parent_child (p_person_person_id, P_person_person_id1) VALUES (3, 4);

INSERT into P_Employee_projects (p_person_person_id, P_Projects_project_no) VALUES (1, 1);

-- Enable the PK triggers on the sample data tables using the following statement: alter trigger P_Department_PK enable; -- for example - alter trigger DEPT_VIEW_TRIGGER disable; alter trigger P_Employee_Projects_PK enable;
alter trigger P_Parent_child_PK enable;
alter trigger P_Person_PK enable;
alter trigger P_Projects_PK enable;

-- Enable all of the Foreign Key Constraints that you disabled earlier using the following syntax:
alter table P_employee_projects enable constraint "P_Emp_Proj_Person_FK"
alter table P_employee_projects enable constraint "P_Emp_Proj_Proj_FK"
alter table P_Parent_child enable constraint "P_Parent_child_P_Person_FK"
alter table P_Parent_child enable constraint "P_Parent_child_P_Person_FKv1”
alter table P_Person enable constraint "P_Person_P_Parent_child_FK"
alter table P_Person enable constraint "P_Person_P_Person_FK”
alter table P_Person enable constraint "P_Person_P_Person_FKv1”
alter table P_Projects enable constraint "P_Projects_P_Department_FK"
alter table P_Projects enable constraint "P_Projects_P_Person_FK”
alter table P_Projects enable constraint "P_Projects_P_Projects_FK”
