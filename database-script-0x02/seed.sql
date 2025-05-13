create database airbnb_clone;
use airbnb_clone;

create table Users (
user_id char(36) unique primary key,
first_name varchar(100) not null,
last_name varchar (100) not null,
email varchar(100) unique not null,
password_hash varchar(100) not null,
phone_number varchar(100) not null,
role enum('guest', 'host', 'admin') not null,
created_at timestamp default current_timestamp
);

create table properties (
property_id char(36) primary key,
host_id char(36) not null,
name varchar(255) not null,
description text not null,
location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES Users(user_id),
    INDEX (property_id)
);

-- BOOKING TABLE
CREATE TABLE Bookings (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    INDEX (property_id),
    INDEX (booking_id)
);

-- PAYMENT TABLE
CREATE TABLE Payments (
    payment_id CHAR(36) PRIMARY KEY,
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    INDEX (booking_id)
);

-- REVIEW TABLE
CREATE TABLE Reviews (
    review_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- MESSAGE TABLE
CREATE TABLE Messages (
    message_id CHAR(36) PRIMARY KEY,
    sender_id CHAR(36) NOT NULL,
    recipient_id CHAR(36) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    FOREIGN KEY (recipient_id) REFERENCES Users(user_id)
);

INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
('BZ524', 'Ernest', 'Mpiani', 'ernestmpiani15@gmail.com', '0001', '0240871995', 'host', CURRENT_TIMESTAMP),
('BZ445', 'Calvin', 'Herchel', 'calvinherchel@gmail.com', '0002', '0243869345', 'guest', CURRENT_TIMESTAMP),
('BZ123', 'Serwaa', 'Bosomtwi', 'serwaabosomtwi@gmail.com', '0003', '0394302934', 'guest', CURRENT_TIMESTAMP),
('BZ326', 'Abena', 'Adutwumuwaa', 'abenaadutwumuwaa@gmail.com', '0004', '0234902315', 'guest', CURRENT_TIMESTAMP),
('BZ735', 'Margret', 'Asaah', 'margretasaah@gmail.com', '0005', '0234124382', 'guest', CURRENT_TIMESTAMP),
('BZ345', 'Nana Abena', 'Ampianima', 'nanaabenaampianima@gmail.com', '0006', '0238129254', 'guest', CURRENT_TIMESTAMP),
('BZ983', 'Joshua', 'Mbafor', 'joshuambafor@gmail.com', '0007', '0245125393', 'guest', CURRENT_TIMESTAMP);

INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
('PROP001', 'BZ524', 'Modern Apartment', 'A beautiful 2-bedroom apartment in Accra.', 'Accra, Ghana', 85.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('PROP002', 'BZ524', 'Beach House', 'Spacious house by the sea.', 'Cape Coast, Ghana', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('PROP003', 'BZ524', 'BH Mansion', 'A gorgeous house in Kumasi', 'Kumasi, Ghana', 1000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
;

INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
('BOOK001', 'PROP001', 'BZ445', '2025-06-01', '2025-06-05', 340.00, 'confirmed', CURRENT_TIMESTAMP),
('BOOK002', 'PROP002', 'BZ123', '2025-06-10', '2025-06-12', 300.00, 'pending', CURRENT_TIMESTAMP);

INSERT INTO Payments (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
('PAY001', 'BOOK001', 340.00, CURRENT_TIMESTAMP, 'credit_card'),
('PAY002', 'BOOK002', 300.00, CURRENT_TIMESTAMP, 'paypal');

INSERT INTO Reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES
('REV001', 'PROP001', 'BZ445', 5, 'Great experience! Clean and comfy.', CURRENT_TIMESTAMP),
('REV002', 'PROP002', 'BZ123', 4, 'Beautiful view, but a bit far from town.', CURRENT_TIMESTAMP);

INSERT INTO Messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
('MSG001', 'BZ445', 'BZ524', 'Hi, can I check in early?', CURRENT_TIMESTAMP),
('MSG002', 'BZ524', 'BZ445', 'Sure! You can check in at 10 AM.', CURRENT_TIMESTAMP);
