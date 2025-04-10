# Task-5 - Subqueries and Nested Queries

## Objective
- Use subqueries to filter or compute values within a main query.

## Requirements
- Write a query that uses a subquery in the `WHERE` clause (e.g., select employees whose salary is above the department’s average salary).
- Alternatively, use subqueries in the `SELECT` list to compute dynamic columns.
- Understand the difference between correlated and non-correlated subqueries.

## To run commands
```
psql -U <username> -d <database> -f commands.sql -W
```

## Non-Correlated Subquery
Subqueries that do not depend on the value of the outer query to execute, i.e., they can be executed independently. The value of the subquery is calculated once and is reused/substituted for all rows of the outer query.

## Correlated Subquery
Subqueries that depend on the value of the outer query to execute, i.e., the subquery is executed once per row of the outer query.

## References
- https://www.youtube.com/watch?v=Vj6RqA_X-IE
- https://learn.microsoft.com/en-us/sql/relational-databases/performance/subqueries?view=sql-server-ver16
- https://dba.stackexchange.com/questions/225874/using-column-alias-in-a-where-clause-doesnt-work