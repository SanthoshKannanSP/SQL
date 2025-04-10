CREATE TABLE celebrities (
    celebrity_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary FLOAT,
    movie_count INT,
    gender VARCHAR(10)
);

INSERT INTO celebrities (celebrity_id, name, salary, movie_count, gender) VALUES
(1, 'Ava Monroe', 9500.0, 18, 'Female'),
(2, 'Jaxon Rivera', 8700.0, 22, 'Male'),
(3, 'Luna Hart', 7800.0, 15, 'Female'),
(4, 'Kai Bennett', 6400.0, 9, 'Male'),
(5, 'Zara Quinn', 5200.0, 7, 'Female'),
(6, 'Leo Zhang', 9900.0, 25, 'Male'),
(7, 'Noah Kim', 8850.0, 20, 'Male'),
(8, 'Maya Patel', 7300.0, 13, 'Female'),
(9, 'Dante Cruz', 6150.0, 10, 'Male'),
(10, 'Rhea Sato', 6950.0, 12, 'Female'),
(11, 'Ezra Black', 5400.0, 8, 'Male'),
(12, 'Nia Fox', 8100.0, 19, 'Female'),
(13, 'Arjun Mehta', 7600.0, 16, 'Male'),
(14, 'Isla Novak', 7050.0, 14, 'Female'),
(15, 'Theo Lane', 6300.0, 11, 'Male'),
(16, 'Camila Stone', 6700.0, 9, 'Female'),
(17, 'Miles Jordan', 4800.0, 6, 'Male'),
(18, 'Elena Ruiz', 6900.0, 10, 'Female'),
(19, 'Omar Youssef', 5750.0, 7, 'Male'),
(20, 'Sky Taylor', 4300.0, 5, 'Female');

SELECT * FROM celebrities;

-- Extracting celebrities who salary is greater than the average salary
SELECT name, salary FROM celebrities
WHERE salary > (
	SELECT AVG(salary) FROM celebrities	
);

-- Extracting celebrities' salary along with average salary
SELECT name, salary, (
	SELECT AVG(salary) FROM celebrities
) FROM celebrities;

-- Extracting celebrities' salary who have acted more than the average number of movies
SELECT name, salary FROM celebrities
WHERE celebrity_id IN (
SELECT celebrity_id FROM celebrities
	WHERE movie_count > (
        SELECT AVG(movie_count) FROM celebrities
    )
);

-- Extracting the max of the average salary between male and female celebrities
SELECT MAX(gender_avg_salary.avg) FROM
(SELECT gender, AVG(salary) AS avg FROM celebrities
	GROUP BY gender) AS gender_avg_salary;

-- Extracting celebrities' salary who have done more movies than the average for their gender
SELECT name, gender, salary
FROM celebrities c1
WHERE movie_count > (
    SELECT AVG(movie_count)
    FROM celebrities c2
    WHERE c2.gender = c1.gender
);
