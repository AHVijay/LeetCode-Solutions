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
