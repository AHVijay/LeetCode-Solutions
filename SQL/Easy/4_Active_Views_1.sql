/*
Problem: Acive Users
LeetCode: https://leetcode.com/problems/article-views-i/?envType=study-plan-v2&envId=top-sql-50Difficulty: Easy

Description:
Write a solution to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.

Approach 1:
Use WHERE clause to filter the authors that viewed at least one of their own articles.
Use GROUP BY to group the authors by id.
Use ORDER BY to sort the result table by id in ascending order.

Approach 2:
Use WHERE clause to filter the authors that viewed at least one of their own articles.
Use DISTINCT to remove duplicate ids.
Use ORDER BY to sort the result table by id in ascending order.
*/

select author_id as id
from Views
    where author_id = viewer_id
    group by author_id
    order by id;

-- Another approach
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;

