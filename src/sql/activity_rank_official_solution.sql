SELECT  from_user, 
        count(*) as total_emails, 
        row_number() OVER ( order by count(*) desc, from_user asc)
    FROM google_gmail_emails 
    GROUP BY from_user
    order by 2 DESC, 1;
