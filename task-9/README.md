# Task-9 - Stored Procedures and User-Defined Functions

## Objective
- Encapsulate business logic using stored procedures and functions.

## Requirements
- Create a stored procedure that accepts parameters (e.g., a date range) and returns a result set (such as total sales within that range).
- Write a scalar or table-valued user-defined function that performs a calculation (e.g., calculates a discount or bonus based on input parameters).
- Test the procedure and function by calling them and verifying their outputs.

## To run commands
```
psql -U <username> -d <database> -f commands.sql -W
```

## References
- https://www.youtube.com/watch?v=yLR1w4tZ36I
- https://www.scaler.com/topics/postgresql/user-defined-functions-in-postgresql/
- https://stackoverflow.com/questions/59779352/table-variable-and-table-valued-function-equivalent-in-postgresql