# Task-7 - Window Functions and Ranking

## Objectives
- Leverage window functions to perform calculations across a set of rows

## Requirements
- Write a query using window functions such as `ROW_NUMBER()`, `RANK()`, or `DENSE_RANK()` to assign ranks (e.g., rank employees by salary within each department).
- Use `PARTITION BY` to define groups and `ORDER BY` to specify the ranking order.
- Experiment with other window functions like `LEAD()` or `LAG()` to access adjacent row values.

## To run commands
```
psql -U <username> -d <presidio> -f commands.sql -W
```

## References
- https://www.youtube.com/watch?v=Ww71knvhQ-s
- https://neon.tech/postgresql/postgresql-window-function