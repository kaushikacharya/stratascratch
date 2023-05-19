-- select * from airbnb_hosts;
/*
All the solutions uses inner join of the two tables.
Solution #1: Left table: airbnb_hosts,  right table: airbnb_units
Solution #2: Left table: airbnb_units,  right table: airbnb_hosts

Though both these solutions are correct but it is better to move the general conditions to the WHERE clause at the end.
This improves the readability and maintainability which has been achieved in Solution #3.
*/

----- Solution #1 -----
/*
SELECT nationality, SUM(n_apartments) AS apartment_count
FROM 
    (SELECT DISTINCT airbnb_hosts.host_id, nationality, n_apartments
        FROM airbnb_hosts
    INNER JOIN
        (SELECT host_id, COUNT(*) AS n_apartments
            FROM airbnb_units
            WHERE unit_type='Apartment'
            GROUP BY host_id) A
        ON airbnb_hosts.host_id=A.host_id
        WHERE age < 30) B
GROUP BY nationality
ORDER BY apartment_count DESC;
*/

-----Solution #2 -----
/*
SELECT nationality, SUM(n_apartments) AS apartment_count
FROM
(SELECT nationality, n_apartments
    FROM
        (SELECT host_id, COUNT(*) AS n_apartments
        FROM airbnb_units
        WHERE unit_type='Apartment'
        GROUP BY host_id) A
    INNER JOIN
        (SELECT DISTINCT host_id, nationality
        FROM
        airbnb_hosts
        WHERE age < 30) B
    ON A.host_id=B.host_id
) C
GROUP BY nationality
ORDER BY apartment_count DESC;
*/

-----Solution #3 -----
SELECT nationality, COUNT(unit_id) apartment_count
FROM
    (SELECT DISTINCT airbnb_units.host_id, unit_id, nationality
    FROM airbnb_units
    INNER JOIN airbnb_hosts
    ON airbnb_units.host_id=airbnb_hosts.host_id
    WHERE age < 30 AND 
    unit_type = 'Apartment') A
GROUP BY nationality
ORDER BY apartment_count DESC;
