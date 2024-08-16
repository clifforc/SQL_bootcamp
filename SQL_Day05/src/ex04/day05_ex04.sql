CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYZE
SELECT *
FROM menu
WHERE pizzeria_id = 5
  AND pizza_name = 'supreme pizza';