SELECT name,
       rating
FROM pizzeria AS p
         LEFT JOIN person_visits AS pv ON
    pv.pizzeria_id = p.id
WHERE pizzeria_id IS NULL