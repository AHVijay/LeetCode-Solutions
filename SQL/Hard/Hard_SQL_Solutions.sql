/*
_____________________________________________________________________________________________________________
1) Problem: Department Top Three Salaries
LeetCode: https://leetcode.com/problems/department-top-three-salaries/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Employee
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key (column with unique values) for this table.
departmentId is a foreign key (reference column) of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

Department
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of a department and its name.

Description:

A company's executives are interested in seeing who earns the most money in each of the company's departments. 
A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write a solution to find the employees who are high earners in each of the departments.

Return the result table in any order.

Approach 1:
1) Use DENSE_RANK() to assign a rank to each salary for each department.
2) Use WHERE clause to filter out the rows where rank is greater than 3.
3) Use JOIN to join the Employee and Department tables.
4) Use ORDER BY clause to sort the result table by department name and salary in descending order.
*/

SELECT 
    d.name AS Department,
    t.name AS Employee,
    t.salary AS Salary
FROM (
    SELECT 
        name, 
        departmentId, 
        salary,
        DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rn
    FROM Employee
) AS t
JOIN Department d 
    ON t.departmentId = d.id
WHERE t.rn <= 3
ORDER BY d.name, t.salary DESC;


/*
_____________________________________________________________________________________________________________
2) Problem: Trips and Users
LeetCode: https://leetcode.com/problems/trips-and-users/description/?envType=problem-list-v2&envId=db-db4-window-functions-ranking

Tables:

Trips
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| client_id   | int      |
| driver_id   | int      |
| city_id     | int      |
| status      | enum     |
| request_at  | varchar  |     
+-------------+----------+
id is the primary key (column with unique values) for this table.
The table holds all taxi trips. Each trip has a unique id, while client_id and driver_id are foreign keys to the users_id at the Users table.
Status is an ENUM (category) type of ('completed', 'cancelled_by_driver', 'cancelled_by_client').

Table: 

Users
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| users_id    | int      |
| banned      | enum     |
| role        | enum     |
+-------------+----------+
users_id is the primary key (column with unique values) for this table.
The table holds all users. Each user has a unique users_id, and role is an ENUM type of ('client', 'driver', 'partner').
banned is an ENUM (category) type of ('Yes', 'No').

Description:

The cancellation rate is computed by dividing the number of canceled (by client or driver) 
requests with unbanned users by the total number of requests with unbanned users on that day.

Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) 
each day between "2013-10-01" and "2013-10-03" with at least one trip. Round Cancellation Rate to two decimal points.

Return the result table in any order.

Approach 1:
1) Use JOIN to join the Trips and Users tables.
2) Use WHERE clause to filter out the rows where client and driver are not banned and the request is between "2013-10-01" and "2013-10-03".
3) Use GROUP BY to group the result table by request_at.
4) Use ROUND() to round the cancellation rate to two decimal points.
5) Use SUM() to find the number of cancelled requests.
6) Use COUNT() to find the total number of requests.
*/

SELECT 
    t.request_at AS Day,
    ROUND(
        SUM(CASE WHEN t.status LIKE 'cancelled%' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS 'Cancellation Rate'
FROM Trips t
JOIN Users client 
    ON t.client_id = client.users_id 
    AND client.banned = 'No'
JOIN Users driver 
    ON t.driver_id = driver.users_id 
    AND driver.banned = 'No'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at;