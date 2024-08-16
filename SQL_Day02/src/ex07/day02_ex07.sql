SELECT pz.name AS pizzeria_name
FROM menu AS m
         INNER JOIN
     pizzeria AS pz
     ON pz.id = m.pizzeria_id
         INNER JOIN
     person_visits AS pv
     ON pv.pizzeria_id = pz.id
         INNER JOIN
     person AS p
     ON p.id = pv.person_id
WHERE p.name = 'Dmitriy'
  AND m.price < 800
  AND pv.visit_date = '2022-01-08'
