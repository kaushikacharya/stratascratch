SELECT from_user, total_emails, 
RANK() OVER (
    ORDER BY total_emails DESC, from_user ASC
    ) row_number
FROM
    (SELECT from_user, COUNT(*) AS total_emails
    FROM google_gmail_emails
    GROUP BY from_user) AS A;
