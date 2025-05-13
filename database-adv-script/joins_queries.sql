select * 
from airbnb_clone.users
join airbnb_clone.bookings
on users.user_id = bookings.user_id
;

select * 
from airbnb_clone.properties
left join airbnb_clone.reviews
on properties.property_id = reviews.property_id
;

select * 
from airbnb_clone.users
left join airbnb_clone.bookings
on users.user_id = bookings.user_id

union

select * 
from airbnb_clone.users
right join airbnb_clone.bookings
on users.user_id = bookings.user_id
;