SELECT m.pizza_name,
       m.price,
       pz.name AS pizzeria_name,
       pv.visit_date
FROM menu AS m
         INNER JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
         INNER JOIN person_visits AS pv ON pv.pizzeria_id = pz.id
         INNER JOIN person AS p ON p.id = pv.person_id
WHERE m.price BETWEEN 800
    AND 1000
  AND p.name = 'Kate'
ORDER BY 1,
         2,
         3
