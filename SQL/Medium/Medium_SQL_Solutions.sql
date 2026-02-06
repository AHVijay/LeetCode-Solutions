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

/*
_____________________________________________________________________________________________________________
5) Problem: Game Play Analysis IV
LeetCode: https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50

Tables:
Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key (combination of columns with unique values) of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.

Description:

Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. 
In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.

Approach 1:
1) Use MIN() to find the earliest login date of each player.
2) Use LEFT JOIN to join the two tables and find the number of players who logged in on the day immediately following their initial login.
*/

SELECT 
    ROUND(COUNT(DISTINCT a2.player_id) / COUNT(DISTINCT a1.player_id), 2) AS fraction
FROM (
    SELECT 
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) a1
LEFT JOIN Activity a2
    ON a1.player_id = a2.player_id
    AND a2.event_date = DATEADD(day, 1, a1.first_login);

/*
Approach 2:
1) Use SUBQUERY to find the earliest login date of each player and the next day login date.
2) Use CASE statement to find the number of players who logged in on the day immediately following their initial login.
*/

SELECT 
    ROUND(
        SUM(CASE WHEN next_day_login IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraction
FROM (
    SELECT 
        a1.player_id,
        a1.first_login,
        a2.event_date AS next_day_login
    FROM (
        SELECT player_id, MIN(event_date) AS first_login
        FROM Activity
        GROUP BY player_id
    ) a1
    LEFT JOIN Activity a2
        ON a1.player_id = a2.player_id
        AND a2.event_date = DATEADD(day, 1, a1.first_login)
) player_logins;


/*
_____________________________________________________________________________________________________________
6) Problem: Product Sales Analysis III
LeetCode: https://leetcode.com/problems/product-sales-analysis-iii/description/?envType=study-plan-v2&envId=top-sql-50

Tables:
Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key (combination of columns with unique values) of this table.
Each row records a sale of a product in a given year.
A product may have multiple sales entries in the same year.
Note that the per-unit price.

Description:

Write a solution to find all sales that occurred in the first year each product was sold.
For each product_id, identify the earliest year it appears in the Sales table.
Return all sales entries for that product in that year.
Return a table with the following columns: product_id, first_year, quantity, and price.
Return the result in any order.

Approach 1:
1) Use MIN() to find the earliest year each product was sold.
2) Use JOIN to join the two tables and find all sales that occurred in the first year each product was sold.
*/

SELECT 
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM Sales s
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) first_years
ON s.product_id = first_years.product_id
AND s.year = first_years.first_year;

/*
_____________________________________________________________________________________________________________
Approach 2:
1) Use Window function RANK() to assign a rank to each year for each product.
2) Use WHERE clause to filter out the rows where year_rank is 1.
*/

SELECT 
    product_id,
    year AS first_year,
    quantity,
    price
FROM (
    SELECT 
        product_id,
        year,
        quantity,
        price,
        RANK() OVER(PARTITION BY product_id ORDER BY year) AS year_rank
    FROM Sales
) ranked
WHERE year_rank = 1;


/*
_____________________________________________________________________________________________________________
7) Problem: Customer Who bought all products
LeetCode: https://leetcode.com/problems/customers-who-bought-all-products/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Customer
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+
This table may contain duplicates rows. 
customer_id is not NULL.
product_key is a foreign key (reference column) to Product table.

Product
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+
product_key is the primary key (column with unique values) for this table

Description:

Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
Return the result table in any order.

Approach 1:
1) Use COUNT() to find the number of products each customer bought.
2) Use COUNT(*) to find the number of products in the Product table.
3) Use HAVING clause to filter out the customers who bought all the products.
*/

SELECT 
    c.customer_id
FROM Customer c
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (
    SELECT COUNT(*) FROM Product
);
    
/*
_____________________________________________________________________________________________________________
Approach 2:
1) Use NOT EXISTS to filter out the customers who did not buy all the products.
*/

SELECT DISTINCT c.customer_id
FROM Customer c
WHERE NOT EXISTS (
    SELECT p.product_key
    FROM Product p
    WHERE NOT EXISTS (
        SELECT 1
        FROM Customer c2
        WHERE c2.customer_id = c.customer_id
          AND c2.product_key = p.product_key
    )
);