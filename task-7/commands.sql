CREATE TABLE price_history (
    id SERIAL PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(100),
    price INT,
    modified_date DATE
);

INSERT INTO price_history (product_id, product_name, price, modified_date) VALUES
(1, 'Smartwatch', 200, '2024-01-10'),
(1, 'Smartwatch', 190, '2024-02-15'),
(1, 'Smartwatch', 180, '2024-03-20'),
(1, 'Smartwatch', 200, '2024-04-25'),
(1, 'Smartwatch', 160, '2024-05-30'),
(2, 'Noise Cancelling Headphones', 300, '2024-01-12'),
(2, 'Noise Cancelling Headphones', 280, '2024-02-18'),
(2, 'Noise Cancelling Headphones', 270, '2024-03-22'),
(2, 'Noise Cancelling Headphones', 280, '2024-04-28'),
(2, 'Noise Cancelling Headphones', 250, '2024-06-01'),
(3, 'Electric Toothbrush', 90, '2024-01-15'),
(3, 'Electric Toothbrush', 85, '2024-02-19'),
(3, 'Electric Toothbrush', 80, '2024-03-25'),
(3, 'Electric Toothbrush', 75, '2024-04-29'),
(3, 'Electric Toothbrush', 70, '2024-06-05'),
(4, 'Fitness Tracker', 150, '2024-01-17'),
(4, 'Fitness Tracker', 140, '2024-02-21'),
(4, 'Fitness Tracker', 130, '2024-03-27'),
(4, 'Fitness Tracker', 120, '2024-05-01'),
(4, 'Fitness Tracker', 110, '2024-06-07');

-- Maximum price of each product in history
SELECT product_name, price,
MAX(price) OVER (PARTITION BY product_id)
FROM price_history;

-- Finding the latest two price changes of each product in history
SELECT latest_count.product_name, latest_count.price, latest_count.modified_date
FROM (
	SELECT product_name, price, modified_date,
	ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY modified_date DESC) AS latest
	FROM price_history
) AS latest_count WHERE latest_count.latest <3;

-- Finding the top two prices of each product in history
-- (Ties are assigned the same rank, with the next rankings skipped)
SELECT history_rank.product_name, history_rank.price, history_rank.modified_date
FROM (
	SELECT product_name, price, modified_date,
	RANK() OVER (PARTITION BY product_id ORDER BY price DESC) AS price_rank
	FROM price_history
) AS history_rank WHERE history_rank.price_rank <3;

-- Finding the top two prices of each product in history
-- (Ties are assigned the same rank, with the next rankings not skipped)
SELECT history_rank.product_name, history_rank.price, history_rank.modified_date
FROM (
	SELECT product_name, price, modified_date,
	DENSE_RANK() OVER (PARTITION BY product_id ORDER BY price DESC) AS price_rank
	FROM price_history
) AS history_rank WHERE history_rank.price_rank <3;

-- Finding previous price for each price of each product in history
SELECT product_name, price,
LAG(price) OVER (PARTITION BY product_id ORDER BY modified_date)
FROM price_history;

-- Finding next price for each price of each product in history
SELECT product_name, price,
LEAD(price) OVER (PARTITION BY product_id ORDER BY modified_date)
FROM price_history;