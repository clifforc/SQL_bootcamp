SELECT p.name
FROM person AS p
         INNER JOIN
     person_order AS po ON po.person_id = p.id
         INNER JOIN
     menu AS m
     ON m.id = po.menu_id
WHERE p.gender = 'female'
  AND m.pizza_name = 'pepperoni pizza'
INTERSECT
SELECT p.name
FROM person AS p
         INNER JOIN
     person_order AS po ON po.person_id = p.id
         INNER JOIN
     menu AS m ON m.id = po.menu_id
WHERE p.gender = 'female'
  AND m.pizza_name = 'cheese pizza'
ORDER BY 1

