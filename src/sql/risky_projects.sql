WITH CTE AS
(SELECT title, budget, CEIL((CAST((end_date - start_date) AS FLOAT)/365)*yearly_cost) AS prorate_employee_expense
FROM linkedin_projects
INNER JOIN
    (SELECT project_id, SUM(salary) AS yearly_cost
    FROM
    linkedin_emp_projects
    INNER JOIN
    linkedin_employees
    ON linkedin_emp_projects.emp_id=linkedin_employees.id
    GROUP BY project_id) A
 ON id=project_id)

 SELECT * FROM CTE
 WHERE budget < prorate_employee_expense;
