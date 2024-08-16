SELECT action_date, person.name AS person_name
FROM (SELECT order_date AS action_date, person_id
      FROM person_order
      INTERSECT ALL
      SELECT visit_date, person_id
      FROM person_visits) AS new_table
         INNER JOIN person ON new_table.person_id = person.id
ORDER BY action_date ASC, person_name DESC;
