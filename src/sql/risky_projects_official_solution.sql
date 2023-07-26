SELECT title,
       budget,
       ceiling(prorated_expenses) AS prorated_employee_expense
FROM
  (SELECT title,
          budget,
          (end_date::date - start_date::date) * (sum(salary)/365) AS prorated_expenses
   FROM linkedin_projects a
   INNER JOIN linkedin_emp_projects b ON a.id = b.project_id
   INNER JOIN linkedin_employees c ON b.emp_id=c.id
   GROUP BY title,
            budget,
            end_date,
            start_date) a
WHERE prorated_expenses > budget
ORDER BY title ASC;
