SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       t1.type,
       t1.volume,
       COALESCE(c.name, 'not defined') AS currency_name,
       COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,
       t1.volume :: real * COALESCE(c.rate_to_usd, 1) AS total_volume_in_usd
FROM
  (SELECT user_id,
          SUM(MONEY) AS volume,
          TYPE,
          currency_id
   FROM balance
   GROUP BY user_id,
            TYPE,
            currency_id) AS t1
FULL JOIN "user" AS u ON u.id = t1.user_id
FULL JOIN
  (SELECT c1.id,
          c1.name,
          c1.rate_to_usd
   FROM currency AS c1
   JOIN
     (SELECT id,
             MAX(updated) AS last_updated
      FROM currency
      GROUP BY id) AS max_c ON max_c.id = c1.id
   AND c1.updated = max_c.last_updated) AS c ON c.id = t1.currency_id
ORDER BY 1 DESC, 2, 3;