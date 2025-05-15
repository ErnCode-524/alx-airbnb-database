## 📂 Partitioning Performance Report

This section summarizes the performance improvements observed after applying **partitioning** to the `Bookings` table in the database.

---

### ⚙️ Step 1: Motivation for Partitioning

As the volume of booking data increased over time, queries that filtered records based on the `start_date` began to slow down. To improve performance, **RANGE partitioning** was implemented on the `start_date` column of the `Bookings` table.

---

### ⚙️ Step 2: Partitioning Strategy

The partitioning strategy was designed to split data by year using the `start_date` field. Each partition contains records that fall within a specific year range. This approach allows MySQL to quickly locate and scan only the relevant partition(s) during date-based queries.

---

### ⚙️ Step 3: Observations After Partitioning

After applying partitioning, the following improvements were observed:

- ✅ **Faster Query Execution**: Queries filtering on `start_date` became significantly faster because MySQL scanned only the relevant partitions instead of the entire table.
- ✅ **Reduced I/O Load**: Partition pruning led to fewer rows being read from disk, reducing the I/O load on the database.
- ✅ **Improved Manageability**: The table is now better organized chronologically, simplifying data maintenance and potential future archiving.
- ✅ **Scalability**: The partitioned structure can easily accommodate additional years by adding new partitions, making it scalable for long-term use.

---

### ✅ Conclusion

Partitioning the `Bookings` table by `start_date` has led to clear performance gains for time-based queries. It enhances both efficiency and scalability, making the database more responsive as data grows.
