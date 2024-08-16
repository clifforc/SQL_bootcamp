WITH dates_range AS (SELECT generate_series(
                                    '2022-01-01'::date,
                                    '2022-01-10'::date,
                                    '1 day'::interval
                            ) AS dates)
SELECT dates::DATE AS missing_date
FROM dates_range
         LEFT JOIN (SELECT *
                    FROM person_visits
                    WHERE person_id = 1
                       OR person_id = 2) AS pv ON dates = pv.visit_date
WHERE pv.visit_date IS NULL
ORDER BY missing_date