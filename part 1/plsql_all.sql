-- P1 - update personal information
UPDATE P_PERSON
SET
    first_name = :P1_FIRST_NAME,
    last_name = :P1_LAST_NAME,
    home_address = :P1_HOME_ADDRESS,
    ZIPCODE = :P1_ZIP,
    HOME_PHONE = :P1_HOMEPHONE,
    US_CITIZEN = :P1_CITIZEN
WHERE
    PERSON_ID = :APPLICATION_USER_ID;

-- P2 - update_employee
DECLARE
    is_fired varchar(1);
BEGIN
    IF :P2_TYPE != 'previous-employee' THEN
        is_fired := 'n';
    else
        is_fired := :P2_TYPE;
    end if;

    UPDATE
        P_PERSON
    SET
        first_name = :P2_FIRST_NAME,
        last_name = :P2_LAST_NAME,
        type = :P2_TYPE,
        home_address = :P2_HOME_ADDRESS,
        zipcode = :P2_ZIPCODE,
        home_phone = :P2_HOME_PHONE,
        salary = :P2_SALARY,
        salary_exception = :P2_SALARY_EXCEPTION,
        P_DEPARTMENT_DEPT_NO = :P2_P_DEPARTMENT_DEPT_NO,
        ISFIRED = is_fired
     WHERE
         person_id = :P2_PERSON_ID;
END;

-- P3 - Insert new relation
BEGIN
    IF :P3_CHILD_PARENT = 'child' THEN
        INSERT INTO P_parent_child VALUES (DEFAULT, :APPLICATION_USER_ID, :P3_SELECT_PERSON);
    ELSE
        INSERT INTO P_parent_child VALUES (DEFAULT, :P3_SELECT_PERSON, :APPLICATION_USER_ID);
    END IF;
END;

-- P4 - delete relation
BEGIN
  DELETE FROM P_Parent_Child WHERE PARENT_CHILD_ID = :P4_PC_ID;
END;

-- P6 -- add_dept
BEGIN
  UPDATE P_PERSON
  SET P_DEPARTMENT_DEPT_NO = :P6_DEPT_NO
  WHERE FIRST_NAME = :P6_FIRST_NAME;

END;

-- P27 - set person id
BEGIN
  SELECT project_no into :p27_project_no
  from P_projects
  where project_title = :p27_project_title;
END;

-- P27 - add manager
BEGIN
  UPDATE P_PROJECTS
  SET P_PERSON_PERSON_ID = :P27_PROJECT_MANAGER
  WHERE PROJECT_NO = :P27_PROJECT_NO;

  UPDATE P_projects
  SET P_DEPARTMENT_DEPT_NO = (SELECT P_DEPARTMENT_DEPT_NO FROM P_PERSON WHERE PERSON_ID = :P27_PROJECT_MANAGER)
  WHERE PROJECT_NO = :P27_PROJECT_NO;

  INSERT INTO P_EMPLOYEE_PROJECTS (EMPLOYEE_PROJECT_ID, P_PERSON_PERSON_ID, P_PROJECTS_PROJECT_NO)
  VALUES (DEFAULT, :P27_PROJECT_MANAGER, :P27_PROJECT_NO);


END;

-- P27 - add parent project
BEGIN
  UPDATE P_PROJECTS
  SET P_PROJECTS_PROJECT_NO = :P27_PROJECT_PARENT_ID
  WHERE PROJECT_NO = :P27_PROJECT_NO;
END;

-- P27 - add employee project
DECLARE
  l_selected APEX_APPLICATION_GLOBAL.VC_ARR2;
BEGIN
  l_selected := APEX_UTIL.STRING_TO_TABLE(:ADD_EMPLOYEES);
  FOR i in 1..l_selected.count
  LOOP
    INSERT INTO P_Employee_Projects (p_person_person_id, p_projects_project_no) VALUES (l_selected(i), :P27_PROJECT_NO);
  END LOOP;
END;

-- P29 - add manager
BEGIN
  UPDATE P_PERSON
  SET P_DEPARTMENT_DEPT_NO = :P29_DEPT_NO
  WHERE PERSON_ID = :P29_ADD_MANAGER;
END;

-- P29 - add employee dept
DECLARE
  l_selected APEX_APPLICATION_GLOBAL.VC_ARR2;
BEGIN
  l_selected := APEX_UTIL.STRING_TO_TABLE(:ADD_EMP_LIST);
  FOR i in 1..l_selected.count
  LOOP
      UPDATE P_PERSON
      SET P_DEPARTMENT_DEPT_NO = :P29_DEPT_NO
      WHERE PERSON_ID = l_selected(i);
    --INSERT INTO P_PERSON (P_DEPARTMENT_DEPT_NO ) select :P27_DEPT_NO FROM P_Department;
  END LOOP;
END;

-- P29 - add projects
DECLARE
  l_selected APEX_APPLICATION_GLOBAL.VC_ARR2;
BEGIN
  l_selected := APEX_UTIL.STRING_TO_TABLE(:P29_ADD_PROJ_LIST);
  FOR i in 1..l_selected.count
  LOOP
      UPDATE P_PROJECTS
      SET P_DEPARTMENT_DEPT_NO = :P29_DEPT_NO
      WHERE PROJECT_NO = l_selected(i);
  END LOOP;
END;
