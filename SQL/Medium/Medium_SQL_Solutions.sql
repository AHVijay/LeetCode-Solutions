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
1) Use DATE_FORMAT to format the date in YYYY-MM format.
2) Use GROUP BY to group the result table by month and country.
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


/*
4) Problem: Immediate Food Delivery II
LeetCode: https://leetcode.com/problems/immediate-food-delivery-ii/?envType=study-plan-v2&envId=top-sql-50

Tables:
Delivery

+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+
delivery_id is the column of unique values of this table.
The table holds information about food delivery to customers that make orders at some date 
and specify a preferred delivery date (on the same order date or after it).

Description:

If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, 
it is called scheduled.
The first order of a customer is the order with the earliest order date that the customer made. 
It is guaranteed that a customer has precisely one first order.
Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

Approach 1:
1) Use ROW_NUMBER() to assign a row number to each order of a customer.
2) Use CASE statement to find the percentage of immediate orders in the first orders of all customers.
*/

SELECT 
    ROUND(
        AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100,
        2
    ) AS immediate_percentage
FROM (
    SELECT 
        customer_id,
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM Delivery
) AS ranked
WHERE rn = 1;

/*
Approach 2:
1) Use MIN() to find the earliest order date of each customer.
2) Use CASE statement to find the percentage of immediate orders in the first orders of all customers.
*/

SELECT 
    ROUND(
        AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100,
        2
    ) AS immediate_percentage
FROM Delivery d1
WHERE order_date = (
    SELECT MIN(order_date)
    FROM Delivery d2
    WHERE d2.customer_id = d1.customer_id
);

/*
Approach 3:
1) Use MIN() to find the earliest order date of each customer.
2) Use JOIN to join the two tables and find the percentage of immediate orders in the first orders of all customers.
*/

SELECT 
    ROUND(
        AVG(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END) * 100,
        2
    ) AS immediate_percentage
FROM Delivery d
JOIN (
    SELECT customer_id, MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
) first_orders
ON d.customer_id = first_orders.customer_id
AND d.order_date = first_orders.first_order_date;