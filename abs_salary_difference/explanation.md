# Explanation

This query calculates the absolute difference between the highest salaries in two departments: marketing and engineering.

- Two subqueries find the maximum salary in each department.
- The outer ABS() function returns the absolute value of their difference to avoid negative results.
- Using JOIN between `db_employee` and `db_dept` ensures filtering based on department names.

This method ensures clear, readable SQL and efficient calculation.
