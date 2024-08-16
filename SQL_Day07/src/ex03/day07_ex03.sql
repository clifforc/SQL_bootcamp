SELECT t1.name,
       coalesce(t1.count, 0) + coalesce(t2.count, 0) AS total_count
FROM (SELECT pz.name, COUNT(*)
      FROM person_visits AS pv
               JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id
      GROUP BY pz.name
      ORDER BY 2 DESC) AS t1
         FULL JOIN
     (SELECT pz.name, COUNT(*)
      FROM person_order AS po
               JOIN menu AS m ON m.id = po.menu_id
               JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
      GROUP BY pz.name
      ORDER BY 2 DESC) AS t2 ON t1.name = t2.name
ORDER BY 2 DESC, 1 ASC