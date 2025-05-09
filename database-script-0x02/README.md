# 🧪 Sample Data – Airbnb Clone Database

## 📋 Overview

This file contains SQL `INSERT` statements to populate the Airbnb-clone project database with realistic test data. It is designed for use during development, testing, or demonstrations.

---

## 📂 File

- `seed.sql` – SQL script that inserts mock records into each table of the schema.

---

## 🧱 Tables Populated

1. **Users**
   - 3 sample users: guest, host, and admin.
2. **Properties**
   - 2 properties listed by the host.
3. **Bookings**
   - 2 bookings made by the guest for the available properties.
4. **Payments**
   - Payments corresponding to each booking.
5. **Reviews**
   - Feedback left by the guest on completed stays.
6. **Messages**
   - Direct messages between the guest and the host.

---

## 🚀 Usage

1. Ensure the schema from `schema.sql` is already created.
2. Run the `seed.sql` file using your database management tool (e.g., MySQL Workbench, pgAdmin, or command-line interface).
