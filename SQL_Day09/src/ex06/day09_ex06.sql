CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice NUMERIC DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08')
    RETURNS TABLE
            (
                name pizzeria.name%TYPE
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT pz.name
        FROM menu AS m
                 JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
                 JOIN person_visits AS pv ON pv.pizzeria_id = m.pizzeria_id
                 JOIN person AS p ON p.id = pv.person_id
        WHERE m.price < pprice
          AND p.name = pperson
          AND pv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');