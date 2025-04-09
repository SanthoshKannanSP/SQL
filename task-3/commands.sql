CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(6, 2),
    category VARCHAR(50),
    seller VARCHAR(100)
);

INSERT INTO products (product_id, name, price, category, seller) VALUES
    (1, 'Wireless Mouse', 25.99, 'Electronics', 'TechWorld'),
    (2, 'Mechanical Keyboard', 89.50, 'Electronics', 'TechWorld'),
    (3, 'Running Shoes', 59.95, 'Footwear', 'FlexFit'),
    (4, 'Yoga Mat', 22.00, 'Fitness', 'FlexFit'),
    (5, 'Bluetooth Speaker', 45.75, 'Electronics', 'TechWorld'),
    (6, 'LED Monitor 24"', 149.99, 'Electronics', 'TechWorld'),
    (7, 'Coffee Maker', 79.00, 'Home Appliances', 'BagBuddy'),
    (8, 'Backpack', 39.90, 'Accessories', 'BagBuddy'),
    (9, 'Smartphone Case', 15.00, 'Accessories', 'BagBuddy'),
    (10, 'Water Bottle', 12.49, 'Fitness', 'FlexFit'),
    (11, 'Gaming Chair', 199.99, 'Furniture', 'StyleMate'),
    (12, 'Desk Lamp', 28.60, 'Home Decor', 'StyleMate'),
    (13, 'Electric Toothbrush', 59.99, 'Personal Care', 'StyleMate'),
    (14, 'Hair Dryer', 34.75, 'Personal Care', 'StyleMate'),
    (15, 'Laptop Stand', 29.99, 'Office Supplies', 'BagBuddy'),
    (16, 'Notebook Pack (5)', 9.50, 'Office Supplies', 'BagBuddy'),
    (17, 'Sunglasses', 19.99, 'Accessories', 'StyleMate'),
    (18, 'Wireless Earbuds', 69.99, 'Electronics', 'TechWorld'),
    (19, 'Resistance Bands', 17.25, 'Fitness', 'FlexFit'),
    (20, 'USB-C Charger', 18.49, 'Electronics', 'TechWorld');
	
SELECT * FROM products;

SElECT COUNT(*) FROM products;

SELECT category, CAST(AVG(price) AS DECIMAL(5,2)) FROM products GROUP BY category;

SELECT seller, COUNT(name) FROM products GROUP BY seller;

SELECT seller, SUM(price) FROM products GROUP BY seller HAVING COUNT(name)>4;
