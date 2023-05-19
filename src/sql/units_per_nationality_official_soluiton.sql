SELECT 
    nationality,
    count(distinct unit_id) as apartment_count
FROM airbnb_units apartment 
INNER JOIN airbnb_hosts host 
  ON apartment.host_id = host.host_id 
WHERE host.age < 30 
AND unit_type = 'Apartment'
GROUP BY host.nationality 
ORDER BY apartment_count DESC
