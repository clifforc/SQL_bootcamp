CREATE TABLE person_discounts
(
    id          SERIAL PRIMARY KEY,
    person_id   INT,
    pizzeria_id INT,
    discount    NUMERIC,
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person (id),
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id)
);