# Task-6 - Date and Time Functions

## Objective
- Manipulate and query data based on date and time values

## Requirements
- Use built-in date functions (e.g., `DATEDIFF`, `DATEADD`, or your SQL dialect’s equivalent) to calculate intervals or adjust dates.
- Write a query to filter records based on date ranges (e.g., orders placed within the last 30 days).
- Format date outputs if necessary using functions like `CONVERT` or `TO_CHAR`.

## To run program
```
psql -U <username> -d presidio -f commands.sql -W
```

## Date and Time Types
|Type|Description|Example|
|-|-|-|
|DATE|Stores day, month and year|2025-04-10|
|TIME|Stores hour, minute and second|21:00:00|
|TIMETZ|Same as TIME, but with time zone offset|21:00:00+05:30|
|TIMESTAMP|Stores both date and time|2025-04-10 21:00:00|
|TIMESTAMPTZ|Same as TIMESTAMP, but with time zone offset|2025-04-10 21:00:00+05:30|
|INTERVAL|Time duration|2 days 5 hours 30 minutes|


## References
- https://www.postgresql.org/docs/current/datatype-datetime.html
- https://neon.tech/postgresql/postgresql-date-functions/postgresql-extract
- https://www.postgresql.org/docs/current/functions-formatting.html