CREATE TABLE bookings_partition (
    booking_id CHAR(36),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date),
    INDEX (property_id),
    INDEX (booking_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);

INSERT INTO bookings_partition (
    booking_id, property_id, user_id, start_date, end_date,
    total_price, status
) VALUES
('B001', 'P001', 'U001', '2022-06-10', '2022-06-15', 300.00, 'confirmed'),
('B002', 'P002', 'U002', '2023-08-20', '2023-08-25', 450.00, 'pending'),
('B003', 'P003', 'U003', '2024-01-05', '2024-01-10', 600.00, 'canceled'),
('B004', 'P004', 'U004', '2023-12-15', '2023-12-20', 350.00, 'confirmed'),
('B005', 'P005', 'U005', '2025-03-01', '2025-03-05', 520.00, 'confirmed');

EXPLAIN SELECT * FROM bookings_partition WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
