SELECT * 
FROM airbnb_clone.Users
INNER JOIN airbnb_clone.Bookings
ON Users.user_id = Bookings.user_id;

SELECT * 
FROM airbnb_clone.Properties
LEFT JOIN airbnb_clone.Reviews
ON Properties.property_id = Reviews.property_id;

SELECT * 
FROM airbnb_clone.Users
LEFT JOIN airbnb_clone.Bookings
ON Users.user_id = Bookings.user_id

UNION

SELECT * 
FROM airbnb_clone.Users
RIGHT JOIN airbnb_clone.Bookings
ON Users.user_id = Bookings.user_id;
