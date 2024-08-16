SELECT m.pizza_name,
       m.price,
       pz.name AS pizzeria_name
FROM (SELECT m.id AS menu_id
      FROM menu AS m
      EXCEPT
      SELECT po.menu_id
      FROM person_order AS po) AS m1
         INNER JOIN menu AS m ON m.id = m1.menu_id
         INNER JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
ORDER BY 1,
         2
