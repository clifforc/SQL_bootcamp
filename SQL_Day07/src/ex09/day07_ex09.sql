SELECT p.address,
       ROUND((MAX(p.age) - MIN(p.age) / MAX(p.age :: numeric)), 2) AS formula,
       ROUND(AVG(p.age), 2)                                        AS average,
       CASE
           WHEN ROUND((MAX(p.age) - MIN(p.age) / MAX(p.age :: numeric)), 2) >
                ROUND(AVG(p.age), 2) THEN TRUE
           ELSE FALSE
           END                                                     AS comparison
FROM person AS p
GROUP BY p.address
ORDER BY 1
