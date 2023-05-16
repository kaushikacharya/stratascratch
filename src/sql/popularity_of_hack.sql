SELECT location, AVG(popularity) AS average_popularity
FROM
    (SELECT 
        location,
        popularity
    FROM
        facebook_hack_survey
    INNER JOIN
        facebook_employees
    ON facebook_hack_survey.employee_id=facebook_employees.id) AS A
GROUP BY location;
