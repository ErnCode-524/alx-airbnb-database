
# 📄 Normalization Review and Steps to 3NF

## ✅ Objective
Ensure the database schema adheres to the **Third Normal Form (3NF)** to eliminate data redundancy and ensure data integrity.

---

## 1. Normalization Principles Overview

### ➤ First Normal Form (1NF)
- Each table has a primary key.
- All attributes contain only atomic (indivisible) values.
- Each field contains values of a single type.

### ➤ Second Normal Form (2NF)
- Must be in 1NF.
- All non-key attributes are **fully functionally dependent** on the entire primary key (no partial dependency).

### ➤ Third Normal Form (3NF)
- Must be in 2NF.
- No **transitive dependencies** (non-key attribute depending on another non-key attribute).

---

## 2. Schema Review & Normalization Steps

### User Table
Already in 3NF:
- `user_id` is the primary key.
- All other attributes depend solely on `user_id`.
- No transitive or partial dependencies.

✅ **No changes needed.**

---

### Property Table
- `host_id` references `User(user_id)` — OK.
- All fields are atomic and dependent on `property_id`.

✅ **No changes needed.**

---

### Booking Table
- `booking_id` is the PK.
- `property_id` and `user_id` are FKs, correctly referencing their respective tables.
- All other fields depend only on `booking_id`.

✅ **No changes needed.**

---

### Payment Table
- `payment_id` is the PK.
- `booking_id` is a FK; all other fields depend on `payment_id`.

✅ **No changes needed.**

---

### Review Table
- `review_id` is the PK.
- `property_id` and `user_id` are FKs.
- All other attributes depend solely on `review_id`.

✅ **No changes needed.**

---

### Message Table
- `message_id` is the PK.
- `sender_id` and `recipient_id` are FKs, referencing `User`.
- No derived or transitively dependent attributes.

✅ **No changes needed.**

---

## 3. Final Assessment
After evaluating each table:
- All tables satisfy **1NF, 2NF, and 3NF**.
- No multivalued fields.
- No partial or transitive dependencies.
- Proper use of foreign keys and indexing.

---

## ✅ Conclusion
> The database schema **already conforms to 3NF**. No structural changes are necessary.
