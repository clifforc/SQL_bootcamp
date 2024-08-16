SELECT m.pizza_name,
       pz.name AS pizzeria_name
FROM person_order AS po
         INNER JOIN
     person AS p
     ON p.id = po.person_id
         INNER JOIN
     menu AS m
     ON m.id = po.menu_id
         INNER JOIN
     pizzeria AS pz
     ON pz.id = m.pizzeria_id
WHERE p.name IN ('Denis', 'Anna')
ORDER BY 1, 2
