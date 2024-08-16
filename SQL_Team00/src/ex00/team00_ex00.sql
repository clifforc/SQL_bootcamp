CREATE TABLE routes
(
    point1 VARCHAR,
    point2 VARCHAR,
    cost INT
);

INSERT INTO routes(point1, point2, cost)
VALUES
    ('a','b',10),
    ('b','a',10),
    ('a','c',15),
    ('c','a',15),
    ('a','d',20),
    ('d','a',20),
    ('b','d',25),
    ('d','b',25),
    ('c','d',30),
    ('d','c',30),
    ('b','c',35),
    ('c','b',35);

WITH RECURSIVE tour (start_point, end_point , path, total_cost) AS (
    SELECT
        r.point1 AS start_point,
        r.point2 AS end_point,
        ARRAY[r.point1, r.point2] AS path,
        r.cost AS total_cost
    FROM routes AS r
    WHERE r.point1 = 'a'

    UNION ALL

    SELECT
        t.start_point,
        r.point2 AS end_point,
        path || r.point2 AS path,
        total_cost + r.cost AS total_cost
    FROM tour AS t
    JOIN routes AS r
        ON t.end_point = r.point1
    WHERE NOT r.point2 = ANY (t.path)
)

, final_tour AS (
    SELECT
        total_cost + (SELECT cost
                      FROM routes
                      WHERE point1 = end_point AND point2 = start_point
                      )AS total_cost,
        path || start_point AS tour
    FROM tour
    WHERE array_length(path, 1) = (SELECT COUNT(DISTINCT point1)
                                   FROM routes)
)

, min_cost AS (
    SELECT MIN(total_cost) AS min_total_cost
    FROM final_tour
)

SELECT ft.total_cost, ft.tour
FROM final_tour AS ft
JOIN min_cost
ON ft.total_cost = min_cost.min_total_cost
ORDER BY 1, 2;

