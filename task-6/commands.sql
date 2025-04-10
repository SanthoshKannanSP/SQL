CREATE TABLE events (
	event_id SERIAL PRIMARY KEY,
	event_name VARCHAR(100),
	event_date DATE,
	event_time TIME
);

INSERT INTO events (event_name, event_date, event_time) VALUES
('Spring Gala', '2024-03-21', '18:30:00'),
('Film Premiere', '2024-04-12', '20:00:00'),
('Celebrity Brunch', '2024-04-15', '11:00:00'),
('Charity Auction', '2024-05-05', '19:00:00'),
('Talk Show Appearance', '2024-06-01', '21:30:00'),
('Award Ceremony', '2024-07-10', '19:45:00'),
('Fashion Show', '2024-08-20', '17:00:00'),
('Book Launch', '2024-09-14', '15:00:00'),
('Music Festival', '2024-10-01', '16:30:00'),
('New Year Bash', '2024-12-31', '23:59:00'),
('Podcast Interview', '2024-04-18', '13:15:00'),
('Dance Competition', '2024-05-25', '18:00:00'),
('Art Exhibition', '2024-06-12', '10:30:00'),
('Stand-up Show', '2024-07-19', '20:15:00'),
('TV Show Shoot', '2024-08-03', '09:00:00'),
('Meet & Greet', '2024-09-22', '14:45:00'),
('Red Carpet Event', '2024-10-30', '18:50:00'),
('Autograph Session', '2024-11-08', '12:00:00'),
('Film Wrap Party', '2024-11-30', '21:00:00'),
('Holiday Concert', '2024-12-24', '19:30:00');

SELECT * FROM events;

-- Assuming today's date is 15th July, 2024

-- Extracting events that have finished
SELECT * FROM events
WHERE event_date < '2024-07-15';

-- Extracting events that have finished in last 2 months
SELECT * FROM events
WHERE event_date >= DATE '2024-07-15' - INTERVAL '2 months'
AND event_date < '2024-07-15';

-- Extracting events that are going to happen in next 2 months
SELECT * FROM events
WHERE event_date >= '2024-07-15'
AND event_date < DATE '2024-07-15' + INTERVAL '2 months';

-- Extracting count of events happening in each month
SELECT event_month, COUNT(event_month) FROM (
	SELECT EXTRACT(MONTH FROM event_date) AS event_month FROM events
) GROUP BY event_month
ORDER BY event_month;

-- Formatting Date and Time
SELECT 
    event_name,
    TO_CHAR(event_date, 'Dy, DD Mon YYYY') AS formatted_date,
	TO_CHAR(event_time, 'HH12:MI AM') AS formatted_time
FROM events;
