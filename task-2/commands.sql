CREATE TABLE employees (
	employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(100) NOT NULL,
    salary DECIMAL(8, 2)
);

INSERT INTO employees (first_name, last_name, position, salary) VALUES
	('Alice', 'Johnson', 'Software Engineer', 85000.00),
    ('Bob', 'Smith', 'Product Manager', 95000.00),
    ('Charlie', 'Lee', 'Data Analyst', 72000.00),
    ('Diana', 'Evans', 'Software Engineer', 68000.00),
    ('Ethan', 'Wright', 'Product Manager', 88000.00),
    ('Fiona', 'Garcia', 'Data Analyst', 71000.00),
    ('George', 'Harris', 'Software Engineer', 64000.00),
    ('Hannah', 'Brown', 'Product Manager', 60000.00),
    ('Ian', 'Taylor', 'Data Analyst', 79000.00),
    ('Jasmine', 'Nguyen', 'Software Engineer', 73000.00);
	
SELECT * FROM employees;

SELECT * FROM employees
	WHERE position = 'Software Engineer';
	
SELECT * FROM employees
	WHERE position = 'Product Manager' AND salary >= 70000;
	
SELECT * FROM employees
	WHERE position = 'Data Analyst' OR salary >=80000
	ORDER BY salary;
	
SELECT * FROM employees
	WHERE position = 'Product Manager' OR salary >=75000
	ORDER BY salary DESC;