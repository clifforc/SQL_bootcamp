-- Session #1
BEGIN;

UPDATE pizzeria
SET rating = 5
WHERE id = 1;

UPDATE pizzeria
SET rating = 4
WHERE id = 2;

COMMIT;

-- Session #2
BEGIN;

UPDATE pizzeria
SET rating = 5
WHERE id = 2;

UPDATE pizzeria
SET rating = 4
WHERE id = 1;

COMMIT;