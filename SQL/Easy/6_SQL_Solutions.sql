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
    ON w1.recordDate = DATEADD(day, 1, w2.recordDate)
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


/*
17) Problem: Queries Quality and Percentage
LeetCode: https://leetcode.com/problems/queries-quality-and-percentage/?envType=study-plan-v2&envId=top-sql-50

Tables:
Queries

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+
This table may have duplicate rows.
This table contains information collected from some queries on a database.
The position column has a value from 1 to 500.
The rating column has a value from 1 to 5. Query with rating less than 3 is a poor query.

Description:

We define query quality as -> The average of the ratio between query rating and its position.
We also define poor query percentage as -> The percentage of all queries with rating less than 3.

Write a solution to find each query_name, the quality and poor_query_percentage.
Both quality and poor_query_percentage should be rounded to 2 decimal places.

Return the result table in any order.

Approach:
1) Use CASE statement to find the quality and poor_query_percentage.
2) Use WHERE clause to filter out the rows where query_name is NULL.
3) Use GROUP BY to group the result table by query_name.

*/

SELECT 
    query_name, 
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY query_name;


/*
_______________________________________________________________________________________________________________
18) Problem: Number of Unique Subjects Taught by Each Teacher
LeetCode: https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/description/?envType=study-plan-v2&envId=top-sql-50

Tables:
Teacher

+-------------+------+
| Column Name | Type |
+-------------+------+
| teacher_id  | int  |
| subject_id  | int  |
| dept_id     | int  |
+-------------+------+
(subject_id, dept_id) is the primary key (combinations of columns with unique values) of this table.
Each row in this table indicates that the teacher with teacher_id teaches the subject subject_id in the department dept_id.

Description:

Write a solution to calculate the number of unique subjects each teacher teaches in the university.

Return the result table in any order.

Approach:
1) Use COUNT() and DISTINCT to find the number of unique subjects each teacher teaches.
2) Use GROUP BY to group the result table by teacher_id.

*/

SELECT
    teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM
    Teacher
GROUP BY teacher_id;


/*
_______________________________________________________________________________________________________________
19) Problem: User Activity for the Past 30 Days I
LeetCode: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/?envType=study-plan-v2&envId=top-sql-50

Tables:
Activity

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| session_id    | int     |
| activity_date | date    |
| activity_type | enum    |
+---------------+---------+
This table may have duplicate rows.
The activity_type column is an ENUM (category) of type ('open_session', 'end_session', 'scroll_down', 'send_message').
The table shows the user activities for a social media website. 
Note that each session belongs to exactly one user.

Description:

Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
A user was active on someday if they made at least one activity on that day.

Return the result table in any order.

Approach 1:
1) Use BETWEEN to filter the rows where activity_date is between 2019-06-28 and 2019-07-27.
2) Use COUNT() and DISTINCT to find the number of unique users for each day.
3) Use GROUP BY to group the result table by activity_date.

*/

SELECT
    activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM
    Activity
WHERE
    activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;

/*
_______________________________________________________________________________________________________________
Approach 2:
1) Use DATEDIFF to filter the rows where activity_date is between 2019-07-27 and 2019-06-28.
2) Use COUNT() and DISTINCT to find the number of unique users for each day.
3) Use GROUP BY to group the result table by activity_date.
*/

SELECT
    activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM
    Activity
WHERE
    DATEDIFF('2019-07-27', activity_date) < 30
GROUP BY activity_date;


/*
_______________________________________________________________________________________________________________
20) Problem: Classes With at Least 5 Students
LeetCode: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/?envType=study-plan-v2&envId=top-sql-50

Tables:
Courses

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled.

Description:

Write a solution to find all the classes that have at least five students.
Return the result table in any order.

Approach 1:
1) Use GROUP BY to group the result table by class.
2) Use HAVING to filter the classes that have at least five students.
*/

SELECT
    class
FROM
    Courses
GROUP BY class
HAVING COUNT(*) >= 5;


/*
_______________________________________________________________________________________________________________
21) Problem: Find Followers Count
LeetCode: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/?envType=study-plan-v2&envId=top-sql-50

Tables:
Followers

+-------------+------+
| Column Name | Type |
+-------------+------+
| user_id     | int  |
| follower_id | int  |
+-------------+------+
(user_id, follower_id) is the primary key (combination of columns with unique values) for this table.
This table contains the IDs of a user and a follower in a social media app where the follower follows the user.

Description:

Write a solution that will, for each user, return the number of followers.

Return the result table ordered by user_id in ascending order.

Approach 1:
1) Use GROUP BY to group the result table by user_id.
2) Use COUNT() to find the number of followers for each user.
3) Use ORDER BY to sort the result table by user_id in ascending order.
*/

SELECT
    user_id, COUNT(follower_id) AS followers_count
FROM
    Followers
GROUP BY user_id
ORDER BY user_id;


/*
_______________________________________________________________________________________________________________
22) Problem: Biggest Single Number
LeetCode: https://leetcode.com/problems/biggest-single-number/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

MyNumbers
+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+
This table may contain duplicates (In other words, there is no primary key for this table in SQL).
Each row of this table contains an integer.

Description:

A single number is a number that appeared only once in the MyNumbers table.
Find the largest single number. If there is no single number, report null.

Approach 1: MYSQL APPROACH
1) Use GROUP BY to group the result table by num.
2) Use HAVING to filter the numbers that appear only once.
3) Use MAX() to find the largest single number.
*/

SELECT MAX(num) AS num
FROM (
    SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(*) =1
) AS t;

/*
_______________________________________________________________________________________________________________
Approach 2: SQL SERVER APPROACH
1) Use TOP 1 to find the largest single number.
2) Use ORDER BY to sort the result table by num in descending order.
3) Use ISNULL to replace NULL with 0.
*/

SELECT ISNULL(
    (SELECT TOP 1 num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
    ORDER BY num DESC),
    NULL
) AS num;


/*
*Advanced SELECT and JOIN concepts*
_______________________________________________________________________________________________________________
23) Problem: The Number of Employees Which Report to Each Employee
LeetCode: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Employees
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| reports_to  | int      |
| age         | int      |
+-------------+----------+
employee_id is the column with unique values for this table.
This table contains information about the employees and the id of the manager they report to. 
Some employees do not report to anyone (reports_to is null). 

Description:

For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, 
and the average age of the reports rounded to the nearest integer.

Return the result table ordered by employee_id.

Approach 1: MYSQL APPROACH
1) Use INNER JOIN to join the two tables and find the number of employees who report directly to each manager.
2) Use GROUP BY to group the result table by employee_id and name.
3) Use ROUND to round the average age to the nearest integer.
4) Use ORDER BY to sort the result table by employee_id.
*/

SELECT 
    m.employee_id,
    m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(AVG(e.age)) AS average_age
FROM Employees m
INNER JOIN Employees e
    ON m.employee_id = e.reports_to
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;


/*
_______________________________________________________________________________________________________________
24) Problem: Primary Department for Each Employee
LeetCode: https://leetcode.com/problems/primary-department-for-each-employee/?envType=study-plan-v2&envId=top-sql-50

Tables:

Employee
+---------------+---------+
| Column Name   |  Type   |
+---------------+---------+
| employee_id   | int     |
| department_id | int     |
| primary_flag  | varchar |
+---------------+---------+
(employee_id, department_id) is the primary key (combination of columns with unique values) for this table.
employee_id is the id of the employee.
department_id is the id of the department to which the employee belongs.
primary_flag is an ENUM (category) of type ('Y', 'N'). If the flag is 'Y', the department is the primary department for the employee. 
If the flag is 'N', the department is not the primary.

Description:

Employees can belong to multiple departments. When the employee joins other departments, 
they need to decide which department is their primary department. Note that when an employee belongs to only one department, 
their primary column is 'N'.
Write a solution to report all the employees with their primary department. For employees who belong to one department, 
report their only department.

Return the result table in any order.

Approach 1: MYSQL APPROACH
1) Use UNION to combine the two queries.
*/

SELECT 
    employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'
UNION
SELECT 
    employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(department_id) = 1;

/*
_______________________________________________________________________________________________________________
Approach 2: 
1) Use OR to combine the two queries.
*/

SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'
   OR employee_id IN (
       SELECT employee_id
       FROM Employee
       GROUP BY employee_id
       HAVING COUNT(*) = 1
   );

/*
_______________________________________________________________________________________________________________
Approach 3: 
1) Use WINDOW FUNCTION to find the number of departments for each employee.
2) Use OR to combine the two queries.
*/

SELECT employee_id, department_id
FROM (
    SELECT 
        employee_id,
        department_id,
        primary_flag,
        COUNT(*) OVER(PARTITION BY employee_id) AS dept_count
    FROM Employee
) e
WHERE primary_flag = 'Y' OR dept_count = 1;

/*
_______________________________________________________________________________________________________________
25) Problem: Triangle Judgement
LeetCode: http://leetcode.com/problems/triangle-judgement/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Triangle
+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
In SQL, (x, y, z) is the primary key column for this table.
Each row of this table contains the lengths of three line segments.

Description:

Report for every three line segments whether they can form a triangle.

Return the result table in any order.

Approach 1: MYSQL APPROACH
1) Use CASE statement to find whether the three line segments can form a triangle.
*/

SELECT 
    x, y, z,
    CASE WHEN
            x > 0 AND y > 0 AND z > 0
            AND x + y > z
            AND x + z > y
            AND y + z > x
        THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;


/*
_______________________________________________________________________________________________________________
26) Problem: Employees Whose Manager Left the Company
LeetCode: https://leetcode.com/problems/employees-whose-manager-left-the-company/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Employees

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| manager_id  | int      |
| salary      | int      |
+-------------+----------+
In SQL, employee_id is the primary key for this table.
This table contains information about the employees, their salary, and the ID of their manager. 
Some employees do not have a manager (manager_id is null). 

Description:

Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. 
When a manager leaves the company, their information is deleted from the Employees table, 
but the reports still have their manager_id set to the manager that left.

Return the result table ordered by employee_id.

Approach 1: MYSQL APPROACH
1) Use NOT IN to find the employees whose manager left the company.
*/

SELECT employee_id
FROM Employees
    WHERE salary < 30000 AND
    manager_id IS NOT NULL AND
    manager_id NOT IN
    (
        SELECT employee_id
        FROM EMployees
    )
ORDER BY employee_id;

/*
_______________________________________________________________________________________________________________
Approach 2: 
1) Use LEFT JOIN to find the employees whose manager left the company.
*/

SELECT e1.employee_id
FROM Employees e1
LEFT JOIN Employees e2
    ON e1.manager_id = e2.employee_id
WHERE e1.salary < 30000
  AND e1.manager_id IS NOT NULL
  AND e2.employee_id IS NULL
ORDER BY e1.employee_id;

/*
_______________________________________________________________________________________________________________
27) Problem: Fix Names in a Table
LeetCode: https://leetcode.com/problems/fix-names-in-a-table/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Users

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| name           | varchar |
+----------------+---------+
user_id is the primary key (column with unique values) for this table.
This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.

Description:

Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by user_id.

Approach 1: MYSQL APPROACH
1) Use CONCAT to concatenate the first character of the name in uppercase and the rest of the name in lowercase.
*/

SELECT 
    user_id,
    CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM Users
ORDER BY user_id;

/*
_______________________________________________________________________________________________________________
28) Problem: Patients With a Condition
LeetCode: https://leetcode.com/problems/patients-with-a-condition/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Patients

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| patient_id   | int     |
| patient_name | varchar |
| conditions   | varchar |
+--------------+---------+
patient_id is the primary key (column with unique values) for this table.
'conditions' contains 0 or more code separated by spaces. 
This table contains information of the patients in the hospital.

Description:

Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. 
Type I Diabetes always starts with DIAB1 prefix.

Return the result table in any order.

Approach 1: MYSQL APPROACH
1) Use OR to combine the two conditions.
*/

SELECT patient_id,
    patient_name,
    conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%'       
   OR conditions LIKE '% DIAB1%';

/*
_______________________________________________________________________________________________________________
29) Problem: Delete Duplicate Emails
LeetCode: https://leetcode.com/problems/delete-duplicate-emails/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.

Description:

Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

For Pandas users, please note that you are supposed to modify Person in place.

After running your script, the answer shown is the Person table. 
The driver will first compile and run your piece of code and then show the Person table. 
The final order of the Person table does not matter.

Approach 1: MYSQL APPROACH
1) Use DELETE statement to delete all duplicate emails, keeping only one unique email with the smallest id.
*/

DELETE FROM Person
WHERE id NOT IN (
SELECT min_id FROM (
SELECT MIN(id) AS min_id
FROM Person
GROUP BY email
) AS t
);

/*
_______________________________________________________________________________________________________________
30) Problem: Group Sold Products By The Date
LeetCode: https://leetcode.com/problems/group-sold-products-by-the-date/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Activities:

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+
There is no primary key (column with unique values) for this table. It may contain duplicates.
Each row of this table contains the product name and the date it was sold in a market.

Description:

Write a solution to find for each date the number of different products sold and their names.

The sold products names for each date should be sorted lexicographically.

Return the result table ordered by sell_date.

Approach 1: MYSQL APPROACH
1) Use GROUP_CONCAT to concatenate distinct products
*/

SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

/*
Approach 2: SQL SERVER APPROACH
1) Use STRING_AGG to concatenate distinct products
Note: For SQL Server, we need to use a subquery to get distinct products first
*/

SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM (
    SELECT DISTINCT sell_date, product
    FROM Activities
) AS distinct_products
GROUP BY sell_date
ORDER BY sell_date;

/*
_______________________________________________________________________________________________________________
31) Problem: List the Products Ordered in a Period
LeetCode: https://leetcode.com/problems/list-the-products-ordered-in-a-period/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Products
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| product_id       | int     |
| product_name     | varchar |
| product_category | varchar |
+------------------+---------+
product_id is the primary key (column with unique values) for this table.
This table contains data about the company's products.
 

Table: 

Orders
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| order_date    | date    |
| unit          | int     |
+---------------+---------+
This table may have duplicate rows.
product_id is a foreign key (reference column) to the Products table.
unit is the number of products ordered in order_date.

Description:

Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

Return the result table in any order.

Approach 1: MYSQL APPROACH
1) Use JOIN to join the two tables and use BETWEEN to find the products ordered in February 2020.
2) Use GROUP BY to group the result table by product_name.
3) Use HAVING to filter the products ordered in February 2020.
*/

SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM Products p
JOIN Orders o 
    ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;

/*
_______________________________________________________________________________________________________________
Approach 2: 
1) Use JOIN to join the two tables and use YEAR() and MONTH() to find the products ordered in February 2020.
*/

SELECT p.product_name, SUM(o.unit) AS unit
FROM Products p
JOIN Orders o
    ON p.product_id = o.product_id
WHERE YEAR(o.order_date) = 2020 AND MONTH(o.order_date) = 2
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;


/*
_______________________________________________________________________________________________________________
32) Problem: Find Users With Valid E-Mails
LeetCode: https://leetcode.com/problems/find-users-with-valid-e-mails/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
| mail          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
This table contains information of the users signed up in a website. Some e-mails are invalid.

Description:

Write a solution to find the users who have valid emails.
A valid e-mail has a prefix name and a domain where:

The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'. 
The prefix name must start with a letter.
The domain is '@leetcode.com'.
Return the result table in any order.

Approach 1: SQL SERVER APPROACH
1) Use LIKE with pattern matching and additional conditions
*/

SELECT user_id, name, mail
FROM Users
WHERE mail LIKE '[a-zA-Z]%@leetcode.com'
  AND mail NOT LIKE '%[^a-zA-Z0-9_.-]%@leetcode.com'
  AND LEFT(mail, CHARINDEX('@', mail) - 1) NOT LIKE '[^a-zA-Z]%';

/*
Approach 2: MYSQL APPROACH (commented out - uncomment if using MySQL)
1) Use REGEXP for pattern matching

-- SELECT user_id, name, mail
-- FROM Users
-- WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$';
*/

/*
_______________________________________________________________________________________________________________
33) Problem: Combine Two Tables
LeetCode: https://leetcode.com/problems/find-users-with-valid-e-mails/description/?envType=study-plan-v2&envId=top-sql-50

Tables:

Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| personId    | int     |
| lastName    | varchar |
| firstName   | varchar |
+-------------+---------+
personId is the primary key (column with unique values) for this table.
This table contains information about the ID of some persons and their first and last names.
 

Table: Address

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| addressId   | int     |
| personId    | int     |
| city        | varchar |
| state       | varchar |
+-------------+---------+
addressId is the primary key (column with unique values) for this table.
Each row of this table contains information about the city and state of one person with ID = PersonId.

Description:

Write a solution to report the first name, last name, city, and state of each person in the Person table. 
If the address of a personId is not present in the Address table, report null instead.

Return the result table in any order.

Approach 1: SQL SERVER APPROACH
1) Use LEFT JOIN to join the two tables and show the first name, last name, city, and state of each person in the Person table.
*/

SELECT 
    p.firstName, 
    p.lastName, 
    a.city, 
    a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;


/*
_______________________________________________________________________________________________________________
34) Problem: Employees Earning More Than Their Managers
LeetCode: https://leetcode.com/problems/employees-earning-more-than-their-managers/description/?envType=problem-list-v2&envId=db-db1-sql-i

Tables:

Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.

Description:

Write a solution to find the employees who earn more than their managers.

Return the result table in any order.

Approach 1: SQL SERVER APPROACH
1) Use JOIN to join the two tables and find the employees who earn more than their managers.
*/

SELECT 
    e1.name AS Employee
FROM Employee e1
JOIN Employee e2 ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;

