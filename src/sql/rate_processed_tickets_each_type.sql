SELECT type, (COUNT(processed) FILTER(WHERE processed=true))*1.0/COUNT(processed) AS processed_rate
FROM
facebook_complaints
GROUP BY type;
