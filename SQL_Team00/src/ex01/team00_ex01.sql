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

, max_cost AS (
    SELECT MAX(total_cost) AS max_total_cost
    FROM final_tour
)

SELECT ft.total_cost, ft.tour
FROM final_tour AS ft
JOIN min_cost
ON ft.total_cost = min_cost.min_total_cost
UNION
SELECT ft.total_cost, ft.tour
FROM final_tour AS ft
JOIN max_cost
ON ft.total_cost = max_cost.max_total_cost
ORDER BY 1, 2;
