CREATE TABLE inventory (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    price INT,
    in_stock INT
);

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES inventory(product_id),
    quantity INT
);


INSERT INTO inventory (product_name, price, in_stock)
VALUES 
    ('Wireless Mouse', 25, 100),
    ('Mechanical Keyboard', 80, 100),
    ('USB-C Hub', 45, 100),
    ('27-inch Monitor', 220, 100);

SELECT * FROM inventory;

-- Creating a stored procedure with no parameters
-- Procedure to reset the inventory stocks
CREATE OR REPLACE PROCEDURE reset_inventory ()
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE inventory
	SET in_stock = 100;
	
	RAISE NOTICE 'Inventory resetted!';
END;
$$;

-- Creating a stored procedure with parameters
-- Procedure to insert a transaction and update inventory
CREATE OR REPLACE PROCEDURE insert_transaction_and_update_inventory (
	p_product_id INT,
	p_quantity INT
)
LANGUAGE plpgsql
AS $$
DECLARE
	v_product_name VARCHAR(100);
BEGIN
	SELECT product_name
	INTO v_product_name
	FROM inventory
	WHERE product_id = p_product_id;

	INSERT INTO transactions
		(product_id, quantity)
	VALUES
		(p_product_id, p_quantity);
		
	UPDATE inventory
	SET in_stock = in_stock - p_quantity
	WHERE product_id = p_product_id;
	
	RAISE NOTICE 'Product % updated successfully', v_product_name;
END
$$;

CALL insert_transaction_and_update_inventory(1,40);
CALL insert_transaction_and_update_inventory(4,100);

SELECT * FROM transactions;
SELECT * FROM inventory ORDER BY product_id;

CALL reset_inventory();

SELECT * FROM transactions;
SELECT * FROM inventory ORDER BY product_id;

CALL insert_transaction_and_update_inventory(1,28);
CALL insert_transaction_and_update_inventory(4,70);

-- Creating a scalar-valued function
-- Calculating the total revenue that can be generated from a product in stock
CREATE OR REPLACE FUNCTION total_revenue(p_product_id INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
	V_total_revenue INT;
BEGIN
	SELECT COALESCE(SUM(price*in_stock),0)
	INTO v_total_revenue
	FROM inventory
	WHERE product_id = p_product_id;
	
	RETURN v_total_revenue;
END
$$;

SELECT
	product_name,
	total_revenue(product_id)
FROM inventory
ORDER BY product_id;

-- Creating a table-valued function
-- Transaction details and revenue generated from that transaction for all transactions of a given product
CREATE OR REPLACE FUNCTION get_transactions_revenue(
	p_product_id INT
)
RETURNS TABLE (
	transaction_id INT,
	product_name VARCHAR(100),
	quantity INT,
	price INT,
	revenue INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	RETURN QUERY
	SELECT
		t.transaction_id,
		i.product_name,
		t.quantity,
		i.price,
		t.quantity * i.price
	FROM transactions AS t
	JOIN inventory as i
	ON t.product_id = i.product_id
	WHERE t.product_id = p_product_id;
END
$$;

SELECT * FROM get_transactions_revenue(1);
