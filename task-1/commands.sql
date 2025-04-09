CREATE TABLE students (
	register_number SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(10) NOT NULL
);

INSERT INTO students (first_name, last_name, department) VALUES
	('Santhosh','Kannan','ADS'),
	('Varun','Kumar','CSE'),
	('Ram','Srivatsa','ADS'),
	('Deepak','S','AML');
	
SELECT * FROM students;