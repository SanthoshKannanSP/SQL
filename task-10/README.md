# Task-10 - Comprehensive Database Design, Optimization, and Advanced Features

## Objective
- Design a normalized database schema for a complex business scenario (e.g., an eCommerce platform) and implement advanced SQL features to ensure performance, data integrity, and automation.

## Requirements
- Schema Design
    - Design and create multiple related tables (e.g., Products, Customers, Orders, OrderDetails) with proper primary and foreign keys, unique constraints, and normalization practices.
- Indexing and Performance
    - Analyze query performance and apply indexing strategies to optimize frequently executed queries.
- Triggers
    - Implement triggers to enforce business rules automatically (e.g., update inventory levels upon order insertion, log changes to critical tables)
- Transactions
    - Use transactions (BEGIN TRANSACTION, COMMIT, and ROLLBACK) to ensure data consistency during multi-step operations (e.g., order processing where multiple tables are updated).
- Documentation and Testing:
    - Document your schema and SQL scripts.
    - Write test queries to demonstrate that all constraints, triggers, and transactions work as intended.

## To run commands
```
psql -U <username> -d <database> -f commands.sql -W
```

## To test
```
psql -U <username> -d <database> -f test.sql -W
```

## References
- https://www.youtube.com/watch?v=ST0VdTxMb6w
- https://www.youtube.com/watch?v=-qNSXK7s7_w