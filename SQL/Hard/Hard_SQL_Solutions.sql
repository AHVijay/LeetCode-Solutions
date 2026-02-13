/*
_____________________________________________________________________________________________________________
11) Problem: Department Top Three Salaries
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