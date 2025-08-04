-- Query to find the growth or drop in order amounts between
-- March 11, 2019, and April 11, 2019 for each city.

WITH DR_001 AS (
    SELECT city_id, order_timestamp_utc::date AS log_date, amount
    FROM postmates_orders
),
SDR_total AS (
    SELECT city_id, SUM(amount) AS amount
    FROM DR_001
    WHERE log_date = '2019-03-11'
    GROUP BY city_id
),
EDR_total AS (
    SELECT city_id, SUM(amount) AS amount
    FROM DR_001
    WHERE log_date = '2019-04-11'
    GROUP BY city_id
),
DR_DIFF AS (
    SELECT 
        COALESCE(SDR_total.city_id, EDR_total.city_id) AS city_id,
        COALESCE(SDR_total.amount, 0) AS march_amount,
        COALESCE(EDR_total.amount, 0) AS april_amount
    FROM SDR_total
    FULL OUTER JOIN EDR_total ON SDR_total.city_id = EDR_total.city_id
),
DR_Diff_total AS (
    SELECT city_id,
        april_amount - march_amount AS growth
    FROM DR_DIFF
),
res AS (
    SELECT pm.name, DR_Diff_total.growth
    FROM DR_Diff_total
    JOIN postmates_markets pm ON pm.id = DR_Diff_total.city_id
)

-- List all cities with growth/drop amounts
SELECT *
FROM res
ORDER BY growth DESC;

-- To find the city with the largest growth, run:
-- SELECT * FROM res ORDER BY growth DESC LIMIT 1;

-- To find the city with the biggest drop, run:
-- SELECT * FROM res ORDER BY growth ASC LIMIT 1;
