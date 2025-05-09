
-- Users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('uuid-001', 'John', 'Doe', 'john.doe@example.com', 'hashed_pwd_001', '1234567890', 'guest', CURRENT_TIMESTAMP),
('uuid-002', 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_pwd_002', '0987654321', 'host', CURRENT_TIMESTAMP),
('uuid-003', 'Bob', 'Admin', 'admin@example.com', 'hashed_pwd_003', NULL, 'admin', CURRENT_TIMESTAMP);

-- Properties
INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('prop-001', 'uuid-002', 'Cozy Apartment', 'A cozy apartment in the city center.', 'Accra, Ghana', 75.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('prop-002', 'uuid-002', 'Beach House', 'A luxurious beach house with ocean views.', 'Cape Coast, Ghana', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Bookings
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('book-001', 'prop-001', 'uuid-001', '2025-06-01', '2025-06-05', 300.00, 'confirmed', CURRENT_TIMESTAMP),
('book-002', 'prop-002', 'uuid-001', '2025-07-10', '2025-07-15', 750.00, 'pending', CURRENT_TIMESTAMP);

-- Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('pay-001', 'book-001', 300.00, CURRENT_TIMESTAMP, 'credit_card'),
('pay-002', 'book-002', 750.00, CURRENT_TIMESTAMP, 'paypal');

-- Reviews
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
('rev-001', 'prop-001', 'uuid-001', 5, 'Amazing stay! Very comfortable.', CURRENT_TIMESTAMP),
('rev-002', 'prop-002', 'uuid-001', 4, 'Beautiful place but a bit far from town.', CURRENT_TIMESTAMP);

-- Messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('msg-001', 'uuid-001', 'uuid-002', 'Hi, is your apartment available for early check-in?', CURRENT_TIMESTAMP),
('msg-002', 'uuid-002', 'uuid-001', 'Yes, early check-in is possible from 10 AM.', CURRENT_TIMESTAMP);
