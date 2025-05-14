SELECT * 
FROM airbnb_clone.users;

SELECT * 
FROM airbnb_clone.bookings;

SELECT * 
FROM airbnb_clone.properties;

EXPLAIN ANALYZE SELECT * 
FROM airbnb_clone.users
WHERE user_id = 'BZ524';

CREATE INDEX usid_index ON users(user_id);
CREATE INDEX bookid_index ON bookings(booking_id);
CREATE INDEX properties_index ON properties(name);

EXPLAIN ANALYZE SELECT * 
FROM airbnb_clone.users
WHERE user_id = 'BZ524';

SHOW INDEX FROM properties;
