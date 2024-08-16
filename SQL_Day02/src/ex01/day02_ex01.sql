SELECT dates::DATE AS missing_date
FROM generate_series(
             '2022-01-01'::date,
             '2022-01-10'::date,
             '1 day'::interval
     ) AS dates
         LEFT JOIN (SELECT *
                    FROM person_visits
                    WHERE person_id = 1
                       OR person_id = 2) AS pv ON dates = pv.visit_date
WHERE pv.visit_date IS NULL
ORDER BY missing_date;