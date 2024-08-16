(SELECT pz.name AS pizzeria_name
 FROM person AS p
          JOIN person_visits AS pv ON pv.person_id = p.id
          JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id
 WHERE p.gender = 'female'
 EXCEPT
     ALL
 SELECT pz.name AS pizzeria_name
 FROM person AS p
          JOIN person_visits AS pv ON pv.person_id = p.id
          JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id
 WHERE p.gender = 'male')
UNION ALL
(SELECT pz.name AS pizzeria_name
 FROM person AS p
          JOIN person_visits AS pv ON pv.person_id = p.id
          JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id
 WHERE p.gender = 'male'
 EXCEPT
     ALL
 SELECT pz.name AS pizzeria_name
 FROM person AS p
          JOIN person_visits AS pv ON pv.person_id = p.id
          JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id
 WHERE p.gender = 'female')
ORDER BY 1
