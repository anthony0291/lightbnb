-- Average Length Of Reservation
-- Get the average duration of all reservations.

-- The approximate expected result is below. Note that depending on how much of your own data you added, your result may differ slightly (but unless you added a ton of your own data, it should still be around 14.6...).

SELECT avg(end_date - start_date) as average_duration
FROM reservations;