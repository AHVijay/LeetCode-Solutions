/*
Problem: Recyclable and low fat products
LeetCode: https://leetcode.com/problems/recyclable-and-low-fat-products/description/?envType=study-plan-v2&envId=top-sql-50
Difficulty: Easy

Description:
Write a solution to find the ids of products that are both low fat and recyclable.
Return the result table in any order.

Approach:
Use WHERE clause to filter the products that are both low fat and recyclable..
*/

SELECT product_id
FROM Products
    WHERE low_fats = 'Y' AND recyclable = 'Y';
