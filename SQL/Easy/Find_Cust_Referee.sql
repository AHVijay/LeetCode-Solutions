/*
Problem: Find Customer Referee
LeetCode: https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan-v2&envId=top-sql-50
Difficulty: Easy

Description:
Find the names of the customer that are either:

1) referred by any customer with id != 2.
2) not referred by any customer.
Return the result table in any order.

Approach:
Use WHERE clause to filter the customers that are referred by any customer with id != 2 or not referred by any customer.
*/

SELECT product_id
FROM Products
    WHERE referee_id != 2 OR referee_id IS NULL;
