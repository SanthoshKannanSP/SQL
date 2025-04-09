# Task-3 - Simple Aggregation and Grouping

## Objective
- Summarize data using aggregate functions and grouping

## Requirements
- Write a query that uses aggregate functions such as `COUNT()`, `SUM()`, or `AVG()` to calculate totals or averages.
- Use the `GROUP BY` clause to aggregate data by a specific column (e.g., count the number of employees per department)
- Optionally, filter grouped results using the `HAVING` clause.

## To run commands
```
psql -U <username> -d <database> -f commands.sql -W
```

## References
- https://www.tutorialspoint.com/postgresql/postgresql_group_by.htm
- https://stackoverflow.com/questions/5316121/how-can-i-make-the-decimal-places-of-avg-function-in-sql-limit-to-2-only