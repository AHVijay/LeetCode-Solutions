/*
6) Problem: Replace Employee ID With The Unique Identifier
LeetCode: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/submissions/1897490751/?envType=study-plan-v2&envId=top-sql-50

Description:
Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

Return the result table in any order.

Approach:
Use LEFT JOIN to join the two tables and show the unique ID of each user. If a user does not have a unique ID, show null.
*/

SELECT 
    e.name, e.unique_id
FROM 
    Employees e
LEFT JOIN EmployeeUNI eu ON e.id = eu.id;



/*
7) Problem: Product Sales Analysis I
LeetCode: https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50

Description:
Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
Return the resulting table in any order.

Approach:
Use INNER JOIN to join the two tables and show the product_name, year, and price for each sale_id.
*/

SELECT 
    p.product_name, s.year, s.price
FROM 
    Sales s
INNER JOIN Product p ON s.product_id = p.product_id;



/*
8) Problem: Customer who visited but did not make any transactions
LeetCode: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/?envType=study-plan-v2&envId=top-sql-50

Description:
Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
Return the result table sorted in any order.

Approach:
Use LEFT JOIN to join the two tables and show the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
*/

SELECT 
    v.customer_id, COUNT(*) as count_no_trans
FROM 
    Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE 
    t.transaction_id IS NULL
GROUP BY 
    v.customer_id;



/*
9) Problem: Rising Temperature
LeetCode: https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50

Description:
Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

Approach:
Use INNER JOIN to join the two tables and show the id of the dates with higher temperatures compared to its previous dates (yesterday).
*/

SELECT 
    w1.id
FROM Weather w1
JOIN weather w2 
    ON w1.recordDate = w2.recordDate + INTERVAL 1 day
        where w1.temperature > w2.temperature;


/*
10) Problem: Average Time of process per machine
LeetCode: https://leetcode.com/problems/average-time-of-process-per-machine/description/?envType=study-plan-v2&envId=top-sql-50

Description:
There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process.
The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.
The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.

Return the result table in any order.

Approach:
Use AVG to calculate the average time each machine takes to complete a process.
*/

SELECT
    a.machine_id, ROUND(AVG(b.timestamp - a.timestamp), 3) as processing_time
FROM
    Activity a
INNER JOIN Activity b 
    ON a.machine_id = b.machine_id 
    and a.process_id = b.process_id
    and a.activity_type = 'start' 
    and b.activity_type = 'end'
GROUP BY
    a.machine_id;



/*
11) Problem: Employee Bonus
LeetCode: https://leetcode.com/problems/employee-bonus/?envType=study-plan-v2&envId=top-sql-50

Description:
Write a solution to report the name and bonus amount of each employee who satisfies either of the following:

The employee has a bonus less than 1000.
The employee did not get any bonus.
Return the result table in any order.

Return the result table in any order.

Approach:
Use LEFT JOIN to join the two tables and show the name and bonus amount of each employee who satisfies either of the following:
*/

SELECT 
    e.name, b.bonus
FROM 
    Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE 
    b.bonus < 1000 OR b.bonus IS NULL;


/*
12) Problem: Students and Examinations
LeetCode: https://leetcode.com/problems/students-and-examinations/description/?envType=study-plan-v2&envId=top-sql-50

Description:
Write a solution to find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.

Approach:
Use CROSS JOIN and LEFT JOIN to join the two tables and show the number of times each student attended each exam.
*/

SELECT
    s.student_id, s.student_name, sub.subject_name, COUNT(e.subject_name) as attended_exams
FROM
    students s
CROSS JOIN subjects_subject_name
LEFT JOIN examinations e 
    ON s.student_id = e.student_id 
    and sub.subject_name = e.subject_name
GROUP BY
    s.student_id, 
    sub.subject_name,
    s.student_name
ORDER BY
    s.student_id, 
    sub.subject_name;


/*
13) Problem: Not Boring Movies
LeetCode: https://leetcode.com/problems/not-boring-movies/description/?envType=study-plan-v2&envId=top-sql-50

Tables:
 Cinema
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+
id is the primary key (column with unique values) for this table.
Each row contains information about the name of a movie, its genre, and its rating.
rating is a 2 decimal places float in the range [0, 10]

Description:
Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table ordered by rating in descending order.


Approach:
Use WHERE clause to filter the movies that have an odd-numbered ID and a description that is not "boring".
Use ORDER BY to sort the result table by rating in descending order.

*/

SELECT 
    id, movie, description, rating
FROM 
    Cinema
WHERE 
    id % 2 = 1 AND description != 'boring'
ORDER BY 
    rating DESC;


/*
14) Problem: Average Selling Price
LeetCode: https://leetcode.com/problems/average-selling-price/description/?envType=study-plan-v2&envId=top-sql-50

Tables:
Prices

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| start_date    | date    |
| end_date      | date    |
| price         | int     |
+---------------+---------+
(product_id, start_date, end_date) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the price of the product_id in the period from start_date to end_date.
For each product_id there will be no two overlapping periods. That means there will be no two intersecting periods for the same product_id.
 

Table: UnitsSold

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| purchase_date | date    |
| units         | int     |
+---------------+---------+
This table may contain duplicate rows.
Each row of this table indicates the date, units, and product_id of each product sold.

Description:
Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. 
If a product does not have any sold units, its average selling price is assumed to be 0.

Return the result table in any order.


Approach:
Use LEFT JOIN to join the two tables and use CASE statement to find the average selling price for each product.

*/

SELECT 
    p.product_id,
    ROUND(
        IFNULL(
            SUM(u.units * p.price) / SUM(u.units),
            0
        ),
        2
    ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;


/*
15) Problem: Project Employees I
LeetCode: https://leetcode.com/problems/project-employees-i/description/?envType=study-plan-v2&envId=top-sql-50

Tables:
Project

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+
(project_id, employee_id) is the primary key of this table.
employee_id is a foreign key to Employee table.
Each row of this table indicates that the employee with employee_id is working on the project with project_id.
 

Table: Employee

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+
employee_id is the primary key of this table. It's guaranteed that experience_years is not NULL.
Each row of this table contains information about one employee.

Description:

Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
Return the result table in any order.

Approach:
Use LEFT JOIN to join the two tables and use CASE statement to find the average experience years of all the employees for each project.

*/

SELECT
    p.project_id, ROUND(AVG(e.experience_years), 2) as average_years
FROM
    Project p
LEFT JOIN Employee e 
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;

/*
16) Problem: Percentage of Users Attended a Contest
LeetCode: https://leetcode.com/problems/percentage-of-users-attended-a-contest/?envType=study-plan-v2&envId=top-sql-50

Tables:
Users

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| user_name   | varchar |
+-------------+---------+
user_id is the primary key (column with unique values) for this table.
Each row of this table contains the name and the id of a user.
 

Table: Register

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| contest_id  | int     |
| user_id     | int     |
+-------------+---------+
(contest_id, user_id) is the primary key (combination of columns with unique values) for this table.
Each row of this table contains the id of a user and the contest they registered into.

Description:

Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

Approach:
1) Use LEFT JOIN to join the two tables and use CASE statement to find the percentage of the users registered in each contest.
2) Use CROSS JOIN to join the two tables and use CASE statement to find the percentage of the users registered in each contest.

*/

SELECT
    r.contest_id, ROUND(COUNT(r.user_id) / (SELECT COUNT(*) FROM Users) * 100, 2) as percentage
FROM
    Register r
LEFT JOIN Users u ON r.user_id = u.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;

/*Another Approach: */

WITH total_users AS (
    SELECT COUNT(*) AS total
    FROM Users
)
SELECT
    r.contest_id,
    ROUND(COUNT(r.user_id) / total_users.total * 100, 2) AS percentage
FROM Register r
CROSS JOIN total_users t
GROUP BY r.contest_id, t.cnt
ORDER BY percentage DESC, r.contest_id ASC;
