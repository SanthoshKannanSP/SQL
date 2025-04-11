CREATE TABLE authors (
	author_id SERIAL PRIMARY KEY,
	author_name VARCHAR(100) NOT NULL UNIQUE,
	author_bio TEXT,
	author_rating DECIMAL(2,1) CHECK (author_rating BETWEEN 0.0 AND 5.0)
);

CREATE TABLE books (
	book_id SERIAL PRIMARY KEY,
	book_title VARCHAR(150) NOT NULL,
	book_author_id INT REFERENCES authors(author_id) NOT NULL,
	book_price NUMERIC CHECK (book_price > 0),
	book_rating DECIMAL(2,1) CHECK (book_rating BETWEEN 0.0 AND 5.0)
);

CREATE TABLE reviews (
	review_id SERIAL PRIMARY KEY,
	review_book_id INT NOT NULL REFERENCES books(book_id),
	review_rating DECIMAL(2,1) CHECK (review_rating BETWEEN 0.0 AND 5.0),
	review_description VARCHAR(200) NOT NULL
);

CREATE INDEX book_id_index ON books(book_author_id);
CREATE INDEX review_book_id_index ON reviews(review_book_id);

INSERT INTO authors (author_name, author_bio, author_rating)
VALUES
('J.K. Rowling', 'British author best known for the Harry Potter series.', 4.8),
('George R.R. Martin', 'American novelist and short story writer, known for A Song of Ice and Fire.', 4.5),
('Chimamanda Ngozi Adichie', 'Nigerian writer and feminist, known for Half of a Yellow Sun.', 4.7),
('Haruki Murakami', 'Japanese author of surreal fiction.', 4.6),
('Yuval Noah Harari', 'Historian and author of Sapiens and Homo Deus.', 4.4);

INSERT INTO books (book_title, book_author_id, book_price, book_rating)
VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 19.99, 4.9),
('Harry Potter and the Chamber of Secrets', 1, 18.99, 4.8),
('A Game of Thrones', 2, 22.50, 4.7),
('A Clash of Kings', 2, 21.00, 4.6),
('Half of a Yellow Sun', 3, 17.75, 4.8),
('Americanah', 3, 16.40, 4.6),
('Norwegian Wood', 4, 14.30, 4.5),
('Kafka on the Shore', 4, 15.50, 4.6),
('Sapiens: A Brief History of Humankind', 5, 24.99, 4.9),
('Homo Deus: A Brief History of Tomorrow', 5, 23.75, 4.7);


INSERT INTO reviews (review_book_id, review_rating, review_description)
VALUES
(1, 5.0, 'Absolutely magical, loved every bit of it!'),
(1, 4.5, 'Great start to the series, a bit childish but fun.'),
(2, 4.7, 'Even better than the first book.'),
(3, 4.8, 'Epic fantasy and amazing character development.'),
(3, 4.6, 'Slow to start but totally worth it.'),
(4, 4.5, 'Fantastic continuation, intense and immersive.'),
(5, 4.9, 'Heartbreaking and beautifully written.'),
(6, 4.7, 'Deep, funny, and powerful.'),
(7, 4.4, 'Melancholic and nostalgic.'),
(8, 4.5, 'Beautiful and strange, classic Murakami.'),
(9, 5.0, 'Mind-blowing perspective on history and evolution.'),
(10, 4.6, 'Thought-provoking and a great sequel.'),
(1, 4.8, 'My kids and I loved it. Great family reading.'),
(1, 4.2, 'Enjoyable, but the hype made me expect more.'),
(2, 4.9, 'A thrilling continuation of the story.'),
(2, 3.9, 'Good but too similar to the first book.'),
(3, 5.0, 'Incredible world-building and twists.'),
(3, 4.3, 'Long, but worth the investment.'),
(4, 4.0, 'Some slow parts but still strong.'),
(4, 3.8, 'Too many characters to keep track of.'),
(5, 5.0, 'Emotionally powerful and well-written.'),
(5, 4.4, 'A masterpiece with rich storytelling.'),
(6, 4.6, 'Sharp, honest, and important.'),
(6, 4.0, 'Some pacing issues, but a great read.'),
(7, 4.7, 'Beautiful and melancholic.'),
(7, 4.1, 'Not for everyone, but I liked it.'),
(8, 4.8, 'Mind-bending and poetic.'),
(8, 3.9, 'Confusing at times, but interesting.'),
(9, 4.9, 'Should be required reading for everyone.'),
(9, 4.7, 'Brilliant synthesis of history.'),
(10, 4.8, 'Fascinating ideas about the future.'),
(10, 4.2, 'Less engaging than Sapiens but still great.');

SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM reviews;

-- Function to update book rating based on the average rating for the book in reviews
CREATE OR REPLACE FUNCTION update_book_rating ()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE books
    SET book_rating = (
        SELECT ROUND(AVG(review_rating)::numeric, 1)
        FROM reviews
        WHERE review_book_id = NEW.review_book_id
    )
    WHERE book_id = NEW.review_book_id;

    RETURN NULL;
END
$$;

-- Trigger the updation to the book rating whenever a review is added, updated or deleted
CREATE TRIGGER trg_update_book_rating
AFTER INSERT OR UPDATE OR DELETE ON reviews
FOR EACH ROW
EXECUTE FUNCTION update_book_rating();

-- Function to update author rating based on the average rating for all the book they have written
CREATE OR REPLACE FUNCTION update_author_rating()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_author_id INT;
BEGIN
    SELECT book_author_id INTO v_author_id
    FROM books WHERE book_id = NEW.book_id;

    UPDATE authors
    SET author_rating = (
        SELECT ROUND(AVG(book_rating)::numeric, 1)
        FROM books
        WHERE book_author_id = v_author_id
    )
    WHERE author_id = v_author_id;

    RETURN NULL;
END;
$$;

-- Trigger the updation to the author rating whenever a book rating is updated
CREATE TRIGGER trg_update_author_rating
AFTER UPDATE OF book_rating ON books
FOR EACH ROW
EXECUTE FUNCTION update_author_rating();


-- Inserting a new review
BEGIN;
	INSERT INTO reviews (review_book_id, review_rating, review_description)
	VALUES (4, 2.2, 'Below average. Will not recommend');
	COMMIT;
END;


-- View the updated ratings
SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM reviews;
