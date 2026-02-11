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


/*
_____________________________________________________________________________________________________________
8) Problem: Consecutive Numbers
LeetCode: https://leetcode.com/problems/consecutive-numbers/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column starting from 1.

Description:

Find all numbers that appear at least three times consecutively.
Return the result table in any order.

Approach 1:
1) Use JOIN to join the table with itself twice to find the consecutive numbers.
*/

SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id - 1
JOIN Logs l3 ON l1.id = l3.id - 2
WHERE l1.num = l2.num
  AND l1.num = l3.num;

/*
_____________________________________________________________________________________________________________
Approach 2:
1) Use LEAD() window function to find the next two numbers.
*/

SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        LEAD(num, 1) OVER(ORDER BY id) AS next_num,
        LEAD(num, 2) OVER(ORDER BY id) AS next_next_num
    FROM Logs
) consecutive
WHERE num = next_num
  AND num = next_next_num;

/*
_____________________________________________________________________________________________________________
Approach 3:
1) Use ROW_NUMBER() to find the group of consecutive numbers.
*/

SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        id - ROW_NUMBER() OVER(PARTITION BY num ORDER BY id) AS grp
    FROM Logs
) grouped
GROUP BY num, grp
HAVING COUNT(*) >= 3;


/*
_____________________________________________________________________________________________________________
9) Problem: Product Price at a Given Date
LeetCode: https://leetcode.com/problems/product-price-at-a-given-date/?envType=study-plan-v2&envId=top-sql-50

Tables:

Products
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.

Description:

Initially, all products have price 10.
Write a solution to find the prices of all products on the date 2019-08-16.

Return the result table in any order.

Approach 1:
1) Use UNION to combine the two queries.
*/

-- Part 1: Products that had price changes on or before 2019-08-16
SELECT 
    product_id,
    new_price AS price
FROM (
    SELECT 
        product_id,
        new_price,
        ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
) latest
WHERE rn = 1

UNION

-- Part 2: Products that never had a price change before 2019-08-16
SELECT DISTINCT 
    product_id,
    10 AS price
FROM Products
WHERE product_id NOT IN (
    SELECT product_id
    FROM Products
    WHERE change_date <= '2019-08-16'
);

/*
_____________________________________________________________________________________________________________
Approach 2:
1) Use COALESCE to replace NULL with 10.
*/

SELECT 
    DISTINCT product_id,
    IFNULL(
        (SELECT TOP 1 new_price 
         FROM Products p2 
         WHERE p2.product_id = p1.product_id 
           AND p2.change_date <= '2019-08-16'
         ORDER BY p2.change_date DESC),
        10
    ) AS price
FROM Products p1;

/*
_____________________________________________________________________________________________________________
Approach 3:
1) Use LEFT JOIN to find the latest price change for each product before the given date.
*/

SELECT 
    all_products.product_id,
    IFNULL(latest_prices.new_price, 10) AS price
FROM (
    SELECT DISTINCT product_id FROM Products
) all_products
LEFT JOIN (
    SELECT 
        product_id,
        new_price
    FROM (
        SELECT 
            product_id,
            new_price,
            ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rn
        FROM Products
        WHERE change_date <= '2019-08-16'
    ) ranked
    WHERE rn = 1
) latest_prices
ON all_products.product_id = latest_prices.product_id;


/*
_____________________________________________________________________________________________________________
10) Problem: Last Person to Fit in the Bus
LeetCode: https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Queue
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| person_id   | int     |
| person_name | varchar |
| weight      | int     |
| turn        | int     |
+-------------+---------+
person_id column contains unique values.
This table has the information about all people waiting for a bus.
The person_id and turn columns will contain all numbers from 1 to n, where n is the number of rows in the table.
turn determines the order of which the people will board the bus, where turn=1 denotes the first person to board and turn=n denotes the last person to board.
weight is the weight of the person in kilograms.

Description:

There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, 
so there may be some people who cannot board.
Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit. 
The test cases are generated such that the first person does not exceed the weight limit.

Note that only one person can board the bus at any given turn.

Approach 1:
1) Use SUM() to find the cumulative weight of all people in the queue.
2) Use WHERE clause to filter out the people who exceed the weight limit.
3) Use ORDER BY clause to sort the people by cumulative weight in descending order.
4) Use TOP 1 to return the last person who can fit in the bus.
*/

SELECT TOP 1 person_name
FROM (
    SELECT
        person_name,
        SUM(weight) OVER(ORDER BY turn) AS cumulative_weight
    FROM Queue
) weighted
WHERE cumulative_weight <= 1000
ORDER BY cumulative_weight DESC;

/*
_____________________________________________________________________________________________________________
Approach 2:
1) Use JOIN to join the table with itself to find the cumulative weight of all people in the queue.
2) Use GROUP BY to group the result table by turn and person_name.
3) Use HAVING clause to filter out the people who exceed the weight limit.
4) Use ORDER BY clause to sort the people by turn in descending order.
5) Use TOP 1 to return the last person who can fit in the bus.
*/

SELECT TOP 1q1.person_name
FROM Queue q1
JOIN Queue q2 ON q1.turn >= q2.turn
GROUP BY q1.turn, q1.person_name
HAVING SUM(q2.weight) <= 1000
ORDER BY q1.turn DESC;

/*
_____________________________________________________________________________________________________________
Approach 3:
1) Use CTE to find the cumulative weight of all people in the queue.
2) Use WHERE clause to filter out the people who exceed the weight limit.
3) Use ORDER BY clause to sort the people by turn in descending order.
4) Use TOP 1 to return the last person who can fit in the bus.
*/

SELECT TOP 1 person_name
FROM (
    SELECT
        person_name,
        SUM(weight) OVER (ORDER BY turn) AS cumulative_weight
    FROM Queue
) weighted
WHERE cumulative_weight <= 1000
ORDER BY cumulative_weight DESC;

/*
_____________________________________________________________________________________________________________
11) Problem: Count Salary Categories
LeetCode: https://leetcode.com/problems/count-salary-categories/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Accounts

+-------------+------+
| Column Name | Type |
+-------------+------+
| account_id  | int  |
| income      | int  |
+-------------+------+
account_id is the primary key (column with unique values) for this table.
Each row contains information about the monthly income for one bank account.

Description:

Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

"Low Salary": All the salaries strictly less than $20000.
"Average Salary": All the salaries in the inclusive range [$20000, $50000].
"High Salary": All the salaries strictly greater than $50000.
The result table must contain all three categories. If there are no accounts in a category, return 0.

Return the result table in any order.

Approach 1:
1) Use UNION to combine the three queries.
*/

SELECT 'Low Salary' AS category, COUNT(account_id) AS accounts_count
FROM Accounts
WHERE income < 20000

UNION 

SELECT 'Average Salary' AS category, COUNT(account_id) AS accounts_count
FROM Accounts
WHERE income BETWEEN 20000 AND 50000

UNION 

SELECT 'High Salary' AS category, COUNT(account_id) AS accounts_count
FROM Accounts
WHERE income > 50000;

/*
_____________________________________________________________________________________________________________
Approach 2:
1) Use CASE statement to categorize the salaries.
2) Use LEFT JOIN to join the result table with the categories table.
*/

WITH categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
)
SELECT 
    c.category,
    COALESCE(t.accounts_count, 0) AS accounts_count
FROM categories c
LEFT JOIN (
    SELECT 
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category,
        COUNT(*) AS accounts_count
    FROM Accounts
    GROUP BY category
) t
ON c.category = t.category;


/*
_____________________________________________________________________________________________________________
12) Problem: Exchange Seats
LeetCode: https://leetcode.com/problems/exchange-seats/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Seat
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
The ID sequence always starts from 1 and increments continuously.

Description:

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, 
the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

Approach 1:
1) Use CASE statement to swap the seat id of every two consecutive students.
*/

SELECT 
    CASE
        WHEN id % 2 = 1 AND id < (SELECT COUNT(*) FROM Seat) THEN id + 1
        WHEN id % 2 = 1 AND id = (SELECT COUNT(*) FROM Seat) THEN id
        ELSE id - 1
    END AS id,
    student
FROM Seat
ORDER BY id;


/*
_____________________________________________________________________________________________________________
12) Problem: Movie Rating
LeetCode: https://leetcode.com/problems/movie-rating/?envType=study-plan-v2&envId=top-sql-50

Tables:

Movies
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.
Each movie has a unique title.

Table: Users
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
The column 'name' has unique values.

Table: MovieRating
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the user's review date. 

Description:

Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

Approach 1:
1) Use UNION to combine the two queries.
2) Use JOIN to join the MovieRating table with the Users and Movies tables.
3) Use GROUP BY to group the result table by user_id and movie_id.
4) Use ORDER BY to sort the result table by the number of ratings and the average rating.
*/

-- First part: top rater by number of ratings
SELECT TOP 1
    u.name AS results
FROM MovieRating mr
JOIN Users u ON mr.user_id = u.user_id
GROUP BY u.user_id, u.name
ORDER BY COUNT(*) DESC, u.name ASC

UNION ALL

-- Second part: top movie by average rating for February 2020
SELECT TOP 1
    m.title AS results
FROM MovieRating mr
JOIN Movies m ON mr.movie_id = m.movie_id
WHERE mr.created_at >= '2020-02-01' AND mr.created_at < '2020-03-01'
GROUP BY m.movie_id, m.title
ORDER BY AVG(mr.rating) DESC, m.title ASC;

/*
_____________________________________________________________________________________________________________
13) Problem: Restaurant Growth
LeetCode: https://leetcode.com/problems/restaurant-growth/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Customer

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+
In SQL,(customer_id, visited_on) is the primary key for this table.
This table contains data about customer transactions in a restaurant.
visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
amount is the total paid by a customer.

Description:

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).
Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). 
average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order.

Approach 1:
1) Use SUM() to find the total amount paid by customers in a seven days window.
2) Use AVG() to find the average amount paid by customers in a seven days window.
3) Use ROUND() to round the average amount to two decimal places.
*/

SELECT
    a.visited_on,
    SUM(b.daily_amount) AS amount,
    ROUND(AVG(b.daily_amount), 2) AS average_amount
FROM (
    SELECT visited_on, SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
) a
JOIN (
    SELECT visited_on, SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
) b ON b.visited_on BETWEEN DATEADD(DAY, -6, a.visited_on)
                         AND a.visited_on
WHERE a.visited_on >= (
    SELECT DATEADD(DAY, 6, MIN(visited_on))
    FROM Customer
)
GROUP BY a.visited_on
ORDER BY a.visited_on;


/*
_____________________________________________________________________________________________________________
14) Problem: Friend Requests II: Who Has the Most Friends
LeetCode: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, 
and the date when the request was accepted.

Description:

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

Approach 1:
1) Use UNION to combine the two queries.
2) Use GROUP BY to group the result table by id.
3) Use ORDER BY to sort the result table by the number of friends.
4) Use TOP 1 to return the person who has the most friends.
*/

SELECT TOP 1
  id,
  COUNT(*) AS num
FROM (
  -- All friend connections (both directions)
  SELECT requester_id AS id FROM RequestAccepted
  UNION ALL
  SELECT accepter_id AS id FROM RequestAccepted
) AS friends
GROUP BY id
ORDER BY num DESC;

/*
_____________________________________________________________________________________________________________
Approach 2:
1) Use CTE to find all friend connections (both directions).
2) Use GROUP BY to group the result table by id.
3) Use ORDER BY to sort the result table by the number of friends.
4) Use TOP 1 to return the person who has the most friends.
*/

WITH all_friends AS (
  SELECT requester_id AS id FROM RequestAccepted
  UNION ALL
  SELECT accepter_id AS id FROM RequestAccepted
)
SELECT TOP 1
  id,
  COUNT(*) AS num
FROM all_friends
GROUP BY id
ORDER BY num DESC;