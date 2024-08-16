SELECT pn1.name    AS person_name1,
       pn2.name    AS person_name2,
       pn1.address AS common_adress
FROM person AS pn1
         INNER JOIN
     person AS pn2
     ON pn1.id > pn2.id
         AND pn1.address = pn2.address
ORDER BY 1, 2, 3