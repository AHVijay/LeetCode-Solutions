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



