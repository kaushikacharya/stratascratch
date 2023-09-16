SELECT C.date, C.non_paying, C.paying
FROM
(SELECT date,
    SUM( CASE
        WHEN B.paying_customer = 'yes' THEN downloads
        ELSE 0
        END
     ) AS paying,
    SUM(CASE
        WHEN B.paying_customer = 'no' THEN downloads
        ELSE 0
        END
     ) AS non_paying
FROM
    (SELECT date, ms_download_facts.user_id, downloads, paying_customer
    FROM
    ms_download_facts
    INNER JOIN
    (SELECT user_id, paying_customer
        FROM
        ms_user_dimension
        INNER JOIN
        ms_acc_dimension
        ON ms_user_dimension.acc_id = ms_acc_dimension.acc_id
    ) AS A
    ON ms_download_facts.user_id = A.user_id
    ) AS B
GROUP BY B.date) AS C
WHERE C.non_paying > C.paying
ORDER BY C.date;
