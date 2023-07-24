WITH total_energy AS
  (SELECT *
   FROM fb_eu_energy eu
   UNION ALL SELECT *
   FROM fb_asia_energy asia
   UNION ALL SELECT *
   FROM fb_na_energy na),
     energy_by_date AS
  (SELECT date, sum(consumption) AS total_energy
   FROM total_energy
   GROUP BY date
   ORDER BY date ASC),
     max_energy AS
  (SELECT max(total_energy) AS max_energy
   FROM energy_by_date)
SELECT ebd.date,
       ebd.total_energy
FROM energy_by_date ebd
JOIN max_energy me ON ebd.total_energy = me.max_energy;
