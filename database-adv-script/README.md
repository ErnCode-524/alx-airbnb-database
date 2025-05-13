# 📄 SQL Join Queries – Airbnb Clone (MySQL)

This directory contains an SQL file created as part of a project to demonstrate how different types of SQL JOIN operations work in a MySQL-based Airbnb clone database.

The focus of this file is to showcase:

###  INNER JOIN – Bookings with Users
This section includes a query that retrieves all bookings and the respective users who made those bookings. It demonstrates how to link two related tables and return only the matching records.

###  LEFT JOIN – Properties with Reviews
This section contains a query that retrieves all properties along with their reviews. It includes properties even if they have no reviews, showing how LEFT JOIN handles unmatched rows from the left table.

###  FULL OUTER JOIN – Users and Bookings
Since MySQL does not support FULL OUTER JOIN natively, this section demonstrates how to simulate it using a combination of LEFT JOIN and RIGHT JOIN with UNION. It retrieves all users and all bookings, even if a user has not made any booking or a booking is not linked to any user.

###  Subquery – Properties with High Ratings
A subquery was used to find all properties where the average rating is greater than 4.0. This allows filtering the properties based on aggregated review data.

###  Correlated Subquery – Frequent Users
A correlated subquery was used to identify users who have made more than 3 bookings. The subquery counts bookings per user and filters those exceeding the threshold, running once per user.

## Notes
All SQL queries were tested using MySQL and make use of standard SQL features such as:
- `JOIN` types
- Aggregate functions (`AVG`, `COUNT`)
- `WHERE`, `HAVING`
- Subqueries and correlated subqueries


---


