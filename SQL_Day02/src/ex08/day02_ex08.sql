SELECT p.name
FROM person AS p
         INNER JOIN
     person_order AS po
     ON po.person_id = p.id
         INNER JOIN
     menu AS m
     ON m.id = po.menu_id
WHERE p.gender = 'male'
  AND p.address IN ('Moscow', 'Samara')
  AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY 1 DESC
