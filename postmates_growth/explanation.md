# Explanation of the Query

This query aims to find how order amounts changed between March 11, 2019, and April 11, 2019, for each city.

## Step-by-step logic:

1. **Extract relevant data:**  
   Select `city_id`, `order_timestamp_utc` converted to date (`log_date`), and `amount` from the `postmates_orders` table.

2. **Calculate totals for March 11, 2019:**  
   Sum all order amounts grouped by `city_id` where the date is '2019-03-11'.

3. **Calculate totals for April 11, 2019:**  
   Sum all order amounts grouped by `city_id` where the date is '2019-04-11'.

4. **Join the two totals:**  
   Use a `FULL OUTER JOIN` on `city_id` to make sure cities present in only one of the dates are also included.  
   Use `COALESCE` to replace `NULL` amounts with 0.

5. **Calculate growth:**  
   Subtract the March total from the April total for each city.

6. **Attach city names:**  
   Join with `postmates_markets` to get city names.

7. **Output:**  
   Return city names along with growth values, sorted by growth descending to see the biggest increases first.

## Notes:

- Using `FULL OUTER JOIN` ensures cities with data only in one date aren't excluded.
- Replacing `NULL` with 0 allows correct calculation of growth or drop.
- Positive growth means increased order amounts; negative means a drop.
