/*
Problem: Big Countries
LeetCode: https://leetcode.com/problems/big-countries/description/?envType=study-plan-v2&envId=top-sql-50
Difficulty: Easy

Description:
A country is big if:

1)it has an area of at least three million (i.e., 3000000 km2), or
2)it has a population of at least twenty-five million (i.e., 25000000).
Write a solution to find the name, population, and area of the big countries.

Return the result table in any order.

Approach:
Use WHERE clause to filter the countries that are big.
*/

SELECT name, population, area
FROM World
    WHERE area >= 3000000 OR population >= 25000000;
