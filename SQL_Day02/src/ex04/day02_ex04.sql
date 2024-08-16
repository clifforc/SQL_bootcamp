SELECT m.pizza_name,
       pz.name AS pizzeria_name,
       m.price
FROM menu AS m
         INNER JOIN
     pizzeria AS pz ON pz.id = m.pizzeria_id
WHERE m.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY 1, 2
