/*
1) Problem: Managers with atleast 5 direct reports
LeetCode: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50

Description:
Write a solution to find managers with at least five direct reports.

Return the result table in any order.

Approach:
Use GROUP BY and HAVING with SUBQUERY to find managers with at least five direct reports.
*/

SELECT name
FROM 
    Employee
WHERE 
    id IN (
        SELECT managerId 
        FROM Employee 
        GROUP BY managerId 
        HAVING COUNT(*) >= 5);


/*
2) Problem: Confirmation Rate
LeetCode: https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50

Description:
The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. 
The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.
Write a solution to find the confirmation rate of each user.
Return the result table in any order.

Signups

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
+----------------+----------+

Confirmations

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
| action         | ENUM     |
+----------------+----------+

Approach:
Use LEFT JOIN to join the two tables and use CASE statement to find the confirmation rate of each user.

*/

SELECT 
    s.user_id,
    ROUND(
        IFNULL(
            SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(c.action),
            0
        ),
        2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id;


/*
3) Problem: Monthly Transactions I
LeetCode: https://leetcode.com/problems/monthly-transactions-i/description/?envType=study-plan-v2&envId=top-sql-50

Tables:
Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
id is the primary key of this table.
The table has information about incoming transactions.
The state column is an enum of type ["approved", "declined"].

Description:

Write an SQL query to find for each month and country, the number of transactions and their total amount, 
and the number of approved transactions and their total amount.

Return the result table in any order.

Approach:
1) Use 
*/

SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country, 
    COUNT(*) AS trans_count, 
    SUM(CASE WHEN state = 'approved ' THEN 1 ELSE 0 END) AS approved_count, 
    SUM(amount) AS trans_total_amount, 
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY DATE_FORMAT(trans_date , '%Y-%m'), country;