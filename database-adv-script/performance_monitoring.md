## 📊 Query Performance Monitoring and Optimization Report

This section documents the performance optimization process carried out on frequently used SQL queries in the Airbnb clone database. The goal was to monitor, identify, and resolve performance bottlenecks using profiling tools and database indexing strategies.

---

### ⚙️ Step 1: Monitoring Query Performance

To begin the optimization process, performance was assessed using:

- `SHOW PROFILE`: To view the detailed breakdown of query execution time.
- `EXPLAIN ANALYZE`: To visualize query execution plans and understand how MySQL was processing each query.

**Queries Analyzed:**
- Fetching user bookings with JOIN on `Users` and `Bookings`.
- Retrieving reviews for properties using JOIN on `Properties` and `Reviews`.
- Filtering bookings by `user_id` and `start_date`.

---

### 🧩 Step 2: Bottlenecks Identified

The profiling and analysis revealed the following issues:

- ❌ Full table scans on the `Users`, `Bookings`, and `Properties` tables.
- ❌ JOIN operations were slow due to lack of proper indexing on foreign key columns.
- ❌ Filtering queries using `WHERE user_id = ...` or `WHERE start_date = ...` were inefficient.

---

### 🛠️ Step 3: Optimization Actions

Based on the analysis, the following optimizations were implemented:

- ✅ Created indexes on high-usage columns:
  - `user_id` on `Users` and `Bookings`
  - `property_id` on `Bookings` and `Reviews`
  - `start_date` on `Bookings`
- ✅ Added composite indexes where necessary to optimize compound filters.
- ✅ Updated query structure to take advantage of indexed columns.

---

### 📈 Step 4: Results and Improvements

After implementing the optimizations, query performance significantly improved:

| Query Type                  | Before Optimization | After Optimization |
|----------------------------|---------------------|--------------------|
| `JOIN Users & Bookings`    | Full Table Scan     | Index-Based Lookup |
| `Filter by user_id`        | Slow                | Fast (Using Index) |
| `JOIN Properties & Reviews`| Full Table Scan     | Index-Based Lookup |
| `Filter by start_date`     | Inefficient         | Efficient (Using Index + Partitioning) |

Additional observations:
- ✅ `EXPLAIN ANALYZE` now reports reduced row scans.
- ✅ CPU and memory usage dropped for optimized queries.
- ✅ User experience and backend response times improved.

---

### ✅ Conclusion

By using `SHOW PROFILE` and `EXPLAIN ANALYZE`, query performance issues were identified and resolved through effective indexing and query structure adjustments. These enhancements have led to faster execution, more scalable queries, and an overall more efficient database.

