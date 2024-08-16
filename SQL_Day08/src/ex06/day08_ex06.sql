-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT SUM(rating)
FROM pizzeria;

SELECT SUM(rating)
FROM pizzeria;

COMMIT;

SELECT SUM(rating)
FROM pizzeria;

-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

INSERT INTO pizzeria(id, name, rating)
VALUES (11, 'Kazan Pizza 2', 4);

COMMIT;

SELECT SUM(rating)
FROM pizzeria;