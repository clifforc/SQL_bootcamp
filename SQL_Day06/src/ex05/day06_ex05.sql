COMMENT ON TABLE person_discounts IS 'The amount of discount for people';
COMMENT ON COLUMN person_discounts.id IS 'Primary key ID';
COMMENT ON COLUMN person_discounts.person_id IS 'Person ID foreign key';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria ID foreign key';
COMMENT ON COLUMN person_discounts.discount IS 'Discount amount';
