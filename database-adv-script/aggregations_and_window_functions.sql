SELECT user_id, booking_id, COUNT(user_id) AS Total_Number_Bookings
FROM airbnb_clone.bookings
GROUP BY user_id, booking_id
;

SELECT *,
ROW_NUMBER() OVER(PARTITION BY property_id) AS ROW_NUM,
RANK() OVER(PARTITION BY property_id) AS RANK_NUM
FROM airbnb_clone.bookings
;
