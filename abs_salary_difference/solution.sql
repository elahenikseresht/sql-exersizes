SELECT ABS(
    (SELECT MAX(db_employee.salary)
    FROM db_employee
    JOIN db_dept ON db_employee.department_id = db_dept.id
    WHERE db_dept.department = 'marketing'
    ) -
    (SELECT MAX(db_employee.salary)
    FROM db_employee
    JOIN db_dept ON db_employee.department_id = db_dept.id
    WHERE db_dept.department = 'engineering'
    )
) AS ABS_salary_difference;
