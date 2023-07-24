SELECT date, total_energy
FROM
(SELECT 
    date,
    RANK() OVER (ORDER BY total_energy DESC) total_energy_rank,
    total_energy
FROM
    (SELECT date, SUM(consumption) AS total_energy
    FROM
        (SELECT * FROM fb_eu_energy
        UNION ALL
        SELECT * FROM fb_asia_energy
        UNION ALL
        SELECT * FROM fb_na_energy) A
    GROUP BY date) B) C
WHERE total_energy_rank=1;

-- Updating the above command using Common Table Expressions
WITH cte AS
    (SELECT 
        date,
        RANK() OVER (ORDER BY total_energy DESC) total_energy_rank,
        total_energy
    FROM
        (SELECT date, SUM(consumption) AS total_energy
        FROM
            (SELECT * FROM fb_eu_energy
            UNION ALL
            SELECT * FROM fb_asia_energy
            UNION ALL
            SELECT * FROM fb_na_energy) A
        GROUP BY date) B)
SELECT date, total_energy
FROM cte
WHERE total_energy_rank=1;

-- Simplifying the above command
WITH 
    fb_union_energy AS
       (SELECT * FROM fb_eu_energy
        UNION ALL
        SELECT * FROM fb_asia_energy
        UNION ALL
        SELECT * FROM fb_na_energy),
    fb_total_energy AS
        (SELECT date, SUM(consumption) AS total_energy
         FROM
         fb_union_energy
         GROUP BY date),
    fb_rank_energy AS
        (SELECT 
            date,
            RANK() OVER (ORDER BY total_energy DESC) total_energy_rank,
            total_energy
         FROM fb_total_energy)
SELECT date, total_energy
FROM fb_rank_energy
WHERE total_energy_rank=1;

-- Not valid for earlier versions of PostgreSQL
SELECT date, SUM(consumption) AS total_energy
FROM
    (SELECT * FROM fb_eu_energy
    UNION ALL
    SELECT * FROM fb_asia_energy
    UNION ALL
    SELECT * FROM fb_na_energy) A
GROUP BY date
ORDER BY total_energy DESC
FETCH FIRST 1 ROW WITH TIES;
