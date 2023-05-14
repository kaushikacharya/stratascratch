-- https://platform.stratascratch.com/coding/10159-ranking-most-active-guests?code_type=1
SELECT 
    DENSE_RANK() OVER (ORDER BY n_total_messages DESC) AS rank,
    id_guest,
    n_total_messages
FROM 
    (SELECT id_guest, SUM(n_messages) AS n_total_messages 
    FROM airbnb_contacts
    GROUP BY id_guest) AS A;
