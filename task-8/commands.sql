CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    seller_store VARCHAR(100),
    buyer_store VARCHAR(100),
    sale_amount INT
);

INSERT INTO sales (seller_store, buyer_store, sale_amount) VALUES
('GlobalMart', 'GlobalMart - East', 1200),
('GlobalMart', 'GlobalMart - West', 1300),
('GlobalMart', 'TechArena', 1500),
('GlobalMart', 'TechArena - Outlet', 1450),
('GlobalMart - East', 'TechArena', 1100),
('GlobalMart - East', 'TechArena - Outlet', 1080),
('GlobalMart - West', 'TechArena', 1150),
('GlobalMart - West', 'TechArena - Outlet', 1120),
('TechArena', 'TechArena - Outlet', 1000),
('GlobalMart', 'GlobalMart - East', 1220),
('GlobalMart', 'GlobalMart - West', 1320),
('GlobalMart', 'TechArena', 1490),
('GlobalMart', 'TechArena - Outlet', 1460),
('GlobalMart - East', 'TechArena', 1110),
('GlobalMart - East', 'TechArena - Outlet', 1090),
('GlobalMart - West', 'TechArena', 1160),
('GlobalMart - West', 'TechArena - Outlet', 1130),
('TechArena', 'TechArena - Outlet', 1010),
('GlobalMart', 'TechArena', 1400),
('GlobalMart', 'TechArena - Outlet', 1420),
('GlobalMart - East', 'TechArena', 1075),
('GlobalMart - West', 'TechArena - Outlet', 1145),
('TechArena', 'TechArena - Outlet', 990),
('GlobalMart - West', 'TechArena', 1185),
('GlobalMart', 'GlobalMart - East', 1270),
('GlobalMart', 'GlobalMart - West', 1355),
('GlobalMart', 'TechArena', 1440),
('GlobalMart', 'TechArena - Outlet', 1430),
('GlobalMart - East', 'TechArena', 1060),
('GlobalMart - East', 'TechArena - Outlet', 1050),
('GlobalMart - West', 'TechArena', 1175),
('GlobalMart - West', 'TechArena - Outlet', 1190),
('TechArena', 'TechArena - Outlet', 1040),
('GlobalMart', 'TechArena', 1410),
('GlobalMart - East', 'TechArena', 1095),
('GlobalMart - West', 'TechArena', 1200),
('TechArena', 'TechArena - Outlet', 990),
('GlobalMart', 'TechArena - Outlet', 1390),
('GlobalMart - East', 'TechArena - Outlet', 1070),
('GlobalMart - West', 'TechArena - Outlet', 1160),
('TechArena', 'TechArena - Outlet', 1020),
('GlobalMart', 'GlobalMart - East', 1230),
('GlobalMart - West', 'TechArena', 1195),
('GlobalMart', 'TechArena - Outlet', 1380),
('TechArena', 'TechArena - Outlet', 970),
('GlobalMart - East', 'TechArena', 1085),
('GlobalMart', 'TechArena', 1455);

SELECt * FROM sales;

-- Finding stores that did more total sales than the average total sales across all stores

-- Without Using CTE
SELECT *
FROM (SELECT seller_store, SUM(sale_amount) AS total_sales FROM sales GROUP BY seller_store) as total
JOIN (SELECT CAST(AVG(total_sales) AS INT) as average_sales
FROM (SELECT seller_store, SUM(sale_amount) AS total_sales FROM sales GROUP BY seller_store)) as average
ON total.total_sales > average.average_sales;

-- Using CTE
WITH
	total (seller_store, total_sales) AS (
		SELECT
			seller_store,
			SUM(sale_amount)
		FROM sales 
		GROUP BY seller_store
	),
	
	average (average_sales) AS (
		SELECT
			CAST(AVG(total_sales) AS INT)
		FROM total
	)
SELECT *
FROM total
JOIN average
ON total.total_sales > average.average_sales;


-- Finding store heirarchy
-- Using Recursive CTE

WITH RECURSIVE store_heirarchy (parent_store, child_store) AS (
		SELECT
			seller_store,
			seller_store
		FROM sales
		GROUP BY seller_store
	
		UNION
	
		SELECT
			sh.parent_store,
			s.buyer_store
		FROM store_heirarchy AS sh
		JOIN
			sales AS s
		ON
			sh.child_store = s.seller_store
	)
SELECT * FROM store_heirarchy
WHERE parent_store <> child_store
ORDER BY parent_store;
