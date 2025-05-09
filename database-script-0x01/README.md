# 🏠 Airbnb Clone – Database Schema

## 📋 Overview

This directory contains the SQL schema for an **Airbnb clone project**. It supports users (guests and hosts), property listings, bookings, payments, reviews, and messaging. The schema follows best practices and is fully normalized to **Third Normal Form (3NF)** for data integrity and efficiency.

---

## 🧱 Database Entities

### 1. **Users**
Stores information about all users including guests, hosts, and administrators.

| Column         | Type        | Description                        |
|----------------|-------------|------------------------------------|
| user_id        | UUID        | Primary Key                        |
| first_name     | VARCHAR     | User’s first name                  |
| last_name      | VARCHAR     | User’s last name                   |
| email          | VARCHAR     | Unique email                       |
| password_hash  | VARCHAR     | Hashed password                    |
| phone_number   | VARCHAR     | Optional contact number            |
| role           | ENUM        | guest, host, or admin              |
| created_at     | TIMESTAMP   | Account creation timestamp         |

---

### 2. **Properties**
Details of properties listed by hosts on the platform.

| Column         | Type        | Description                        |
|----------------|-------------|------------------------------------|
| property_id    | UUID        | Primary Key                        |
| host_id        | UUID        | FK to Users(user_id)               |
| name           | VARCHAR     | Title of the property              |
| description    | TEXT        | Description of the listing         |
| location       | VARCHAR     | Location/address                   |
| pricepernight  | DECIMAL     | Nightly rate                       |
| created_at     | TIMESTAMP   | Listing creation date              |
| updated_at     | TIMESTAMP   | Last updated timestamp             |

---

### 3. **Bookings**
Tracks reservations made by users on properties.

| Column         | Type        | Description                        |
|----------------|-------------|------------------------------------|
| booking_id     | UUID        | Primary Key                        |
| property_id    | UUID        | FK to Properties(property_id)      |
| user_id        | UUID        | FK to Users(user_id)               |
| start_date     | DATE        | Start of reservation               |
| end_date       | DATE        | End of reservation                 |
| total_price    | DECIMAL     | Total cost                         |
| status         | ENUM        | pending, confirmed, canceled       |
| created_at     | TIMESTAMP   | Booking creation time              |

---

### 4. **Payments**
Logs payments made for bookings.

| Column         | Type        | Description                        |
|----------------|-------------|------------------------------------|
| payment_id     | UUID        | Primary Key                        |
| booking_id     | UUID        | FK to Bookings(booking_id)         |
| amount         | DECIMAL     | Payment amount                     |
| payment_date   | TIMESTAMP   | When the payment was made          |
| payment_method | ENUM        | credit_card, paypal, stripe        |

---

### 5. **Reviews**
Allows guests to leave feedback on properties.

| Column         | Type        | Description                        |
|----------------|-------------|------------------------------------|
| review_id      | UUID        | Primary Key                        |
| property_id    | UUID        | FK to Properties(property_id)      |
| user_id        | UUID        | FK to Users(user_id)               |
| rating         | INTEGER     | 1 to 5 stars                       |
| comment        | TEXT        | Written review                     |
| created_at     | TIMESTAMP   | Timestamp of submission            |

---

### 6. **Messages**
Enables direct messaging between users.

| Column         | Type        | Description                        |
|----------------|-------------|------------------------------------|
| message_id     | UUID        | Primary Key                        |
| sender_id      | UUID        | FK to Users(user_id)               |
| recipient_id   | UUID        | FK to Users(user_id)               |
| message_body   | TEXT        | Content of the message             |
| sent_at        | TIMESTAMP   | Time message was sent              |

---

## 📦 Features

- 🔐 **User Roles**: guest, host, admin  
- 🏡 **Host Listings**: property creation and management  
- 📅 **Booking System**: date-based reservation support  
- 💳 **Payment Handling**: linked to booking entries  
- ⭐ **Review Platform**: guest feedback and ratings  
- 💬 **Messaging**: secure communication between users  
- ⚡ **Indexes and Constraints**: for performance and data safety

---


---

## 📂 Files Included

- `schema.sql` – SQL statements to create tables and relationships  
