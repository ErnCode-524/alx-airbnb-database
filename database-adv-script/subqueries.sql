SELECT properties.property_id, properties.name, avg_ratings.average_rating
FROM airbnb_clone.properties
JOIN (
    SELECT reviews.property_id, AVG(rating) as average_rating
    FROM airbnb_clone.reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
) avg_ratings ON properties.property_id = avg_ratings.property_id
    WHERE average_rating > 4.0
;

SELECT user_id, first_name, last_name
FROM airbnb_clone.Users u
WHERE (
    SELECT COUNT(*)
    FROM airbnb_clone.Bookings b
    WHERE b.user_id = u.user_id
) > 3;
