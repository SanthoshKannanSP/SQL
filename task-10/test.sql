BEGIN;

-- Should succeed
INSERT INTO authors (author_name, author_bio, author_rating) 
VALUES ('Ocean Vuong','Vietnamese-American poet and novelist whose lyrical writing explores themes of identity, grief, and migration. Best known for "On Earth We’re Briefly Gorgeous".',0.0
);

-- Should fail (duplicate name)
INSERT INTO authors (author_name, author_bio, author_rating) 
VALUES ('Ocean Vuong','Vietnamese-American poet and novelist whose lyrical writing explores themes of identity, grief, and migration. Best known for "On Earth We’re Briefly Gorgeous".',0.0
);

-- Should fail (null name)
INSERT INTO authors (author_name, author_bio, author_rating) 
VALUES (NULL, 'Missing name test', 4.0);

-- Should fail (rating > 5.0)
INSERT INTO authors (author_name, author_bio, author_rating)
VALUES ('Overrated Author', 'Test', 5.5);

-- Should fail (negative price)
INSERT INTO books (book_title, book_author_id, book_price, book_rating)
VALUES ('Bad Price Book', 1, -10.00, 3.5);

-- Should fail (book_rating > 5.0)
INSERT INTO books (book_title, book_author_id, book_price, book_rating)
VALUES ('Bad Rated Book', 1, 20.00, 6.0);

-- Should fail (review_rating < 0)
INSERT INTO reviews (review_book_id, review_rating, review_description)
VALUES (1, -1.0, 'Invalid rating');

-- Should fail (null description)
INSERT INTO reviews (review_book_id, review_rating, review_description)
VALUES (1, 4.5, NULL);

-- Insert valid author and book
WITH new_author AS (
INSERT INTO authors (author_name, author_bio, author_rating)
VALUES ('Margaret Atwood', 'Canadian poet and novelist', 0.0) RETURNING author_id
),

-- Use the returned author_id
	new_book AS (
INSERT INTO books (book_title, book_author_id, book_price, book_rating)
SELECT 'On Earth We’re Briefly Gorgeous', author_id, 18.99, 0.0
FROM new_author RETURNING book_id
)
-- Use the return book_id
INSERT INTO reviews (review_book_id, review_rating, review_description)
SELECT book_id, 2.6, 'Good'
FROM new_book;

ROLLBACK;