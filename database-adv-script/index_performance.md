### 📌 Task: Measure Query Performance Before and After Adding Indexes

This task involved analyzing the performance of queries and optimizing them using indexes. I focused on high-usage columns in the `Users`, `Bookings`, and `Properties` tables — especially those frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses.

#### 🔍 Step 1: Identifying High-Usage Columns
I reviewed queries and identified the following high-usage columns:
- `Users.user_id` — used in JOINs with Bookings
- `Bookings.user_id` — used in WHERE and JOIN conditions
- `Bookings.property_id` — used in JOINs with Properties
- `Properties.property_id` — used in JOINs and WHERE clauses

#### � Step 2: Creating Indexes
I added indexes using the `CREATE INDEX` statements below (saved in `database_index.sql`):

```
CREATE INDEX idx_user_id ON Users(user_id);
CREATE INDEX idx_booking_user_id ON Bookings(user_id);
CREATE INDEX idx_booking_property_id ON Bookings(property_id);
CREATE INDEX idx_property_id ON Properties(property_id);
```
⚙️ Step 3: Measuring Query Performance with EXPLAIN
Before creating indexes, a query like this:

sql
```EXPLAIN SELECT * 
FROM Users 
JOIN Bookings ON Users.user_id = Bookings.user_id;
```
Returned:

type: ALL

key: NULL

rows: Large number

Meaning: A full table scan was being performed, which is slow for large datasets.

After creating indexes:

sql
EXPLAIN SELECT * 
FROM Users 
JOIN Bookings ON Users.user_id = Bookings.user_id;
Returned:

type: ref

key: idx_user_id

rows: Reduced significantly

Meaning: MySQL used the index to speed up the lookup.

✅ Conclusion
After adding appropriate indexes:

Query performance improved significantly

The number of scanned rows decreased

MySQL used index-based access paths instead of full table scans
