SELECT * 
FROM airbnb_clone.users AS users
JOIN airbnb_clone.properties AS prop
ON users.user_id = prop.host_id
JOIN airbnb_clone.bookings AS book
ON prop.property_id = book.property_id
JOIN airbnb_clone.payments AS pay
ON book.booking_id = pay.booking_id
;