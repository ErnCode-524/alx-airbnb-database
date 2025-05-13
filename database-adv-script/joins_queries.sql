select * 
from airbnb_clone.users
INNER JOIN airbnb_clone.bookings
on users.user_id = bookings.user_id
;

select * 
from airbnb_clone.properties
LEFT JOIN airbnb_clone.reviews
on properties.property_id = reviews.property_id
;

select * 
from airbnb_clone.users
LEFT JOIN airbnb_clone.bookings
on users.user_id = bookings.user_id

UNION

select * 
from airbnb_clone.users
RIGHT JOIN airbnb_clone.bookings
on users.user_id = bookings.user_id
;
