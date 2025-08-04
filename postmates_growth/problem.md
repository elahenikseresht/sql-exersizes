# Problem Statement

Using the `postmates_orders` and `postmates_markets` tables, analyze the order amounts for different cities on two specific dates: March 11, 2019, and April 11, 2019.

Your task is to:

- Calculate the total order amount for each city on March 11, 2019.
- Calculate the total order amount for each city on April 11, 2019.
- Compare these totals to find the growth or drop in order amount between the two dates for each city.
- Return a list of cities with their corresponding growth or drop amounts.
- Identify the cities that recorded the largest growth and the biggest drop in order amounts.

### Table Descriptions:

- `postmates_orders`:

  - `city_id` (bigint): ID of the city.
  - `order_timestamp_utc` (timestamp): Timestamp of the order.
  - `amount` (double precision): Amount of the order.

- `postmates_markets`:
  - `id` (bigint): ID of the city.
  - `name` (text): Name of the city.

### Expected Output:

| name      | growth  |
| --------- | ------- |
| CityName1 | 12345.6 |
| CityName2 | -5432.1 |
| ...       | ...     |

Where `growth` is the difference between total order amounts on April 11 and March 11, 2019 (positive means growth, negative means drop).
