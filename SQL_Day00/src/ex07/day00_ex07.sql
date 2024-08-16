SELECT id,
       name,
       CASE
           WHEN age BETWEEN 10 AND 20 THEN 'interval #1'
           WHEN age BETWEEN 20 AND 22 THEN 'interval #2'
           ELSE 'interval #3'
           END AS interval_info
FROM person
ORDER BY interval_info
