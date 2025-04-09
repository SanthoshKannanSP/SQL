CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(10)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    delivery_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (name, phone_number) VALUES
    ('Alice Thompson', '555-1234'),
    ('Brian Carter', '555-5678'),
    ('Chloe Martinez', '555-8765'),
    ('David Kim', '555-4321'),
	('Reed Richards','555-1234');
		
INSERT INTO orders (customer_id, product_name, price, delivery_date) VALUES
    (1, 'Wireless Mouse', 25.99, '2025-04-01'),
    (1, 'Bluetooth Speaker', 45.75, '2025-04-02'),
    (1, 'Gaming Chair', 199.99, '2025-04-03'),
    (1, 'Laptop Stand', 29.99, '2025-04-04'),
    (1, 'Yoga Mat', 22.00, '2025-04-05'),
    (1, 'USB-C Charger', 18.49, '2025-04-06'),
    (2, 'Wireless Mouse', 25.99, '2025-04-02'),
    (2, 'Bluetooth Speaker', 45.75, '2025-04-03'),
    (2, 'Gaming Chair', 199.99, '2025-04-04'),
    (2, 'Laptop Stand', 29.99, '2025-04-05'),
    (2, 'Yoga Mat', 22.00, '2025-04-06'),
    (3, 'USB-C Charger', 18.49, '2025-04-03'),
    (3, 'Wireless Mouse', 25.99, '2025-04-04'),
    (3, 'Bluetooth Speaker', 45.75, '2025-04-05'),
    (3, 'Gaming Chair', 199.99, '2025-04-06'),
    (3, 'Laptop Stand', 29.99, '2025-04-07'),
    (4, 'Yoga Mat', 22.00, '2025-04-05'),
    (4, 'USB-C Charger', 18.49, '2025-04-06'),
    (4, 'Wireless Mouse', 25.99, '2025-04-07'),
    (4, 'Bluetooth Speaker', 45.75, '2025-04-08');

SELECT * FROM customers;

SELECT * FROM orders;

SELECT name, product_name, delivery_date FROM customers 
	INNER JOIN orders ON customers.customer_id = orders.customer_id;
	
SELECT name, product_name FROM customers
	LEFT JOIN orders ON customers.customer_id = orders.customer_id;

SELECT name, product_name FROM customers
	RIGHT JOIN orders ON customers.customer_id = orders.customer_id;
	
SELECT name, product_name, delivery_date from customers
	RIGHT JOIN orders ON customers.customer_id = orders.customer_id
	WHERE delivery_date < '2025-04-04';
	