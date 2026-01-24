/*
Problem: Invalid Tweets
LeetCode: https://leetcode.com/problems/invalid-tweets/?envType=study-plan-v2&envId=top-sql-50Difficulty: Easy

Description:
Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

Return the result table in any order.

Approach:
Use WHERE clause to filter the tweets that are invalid.
*/

select tweet_id
from Tweets
    where length(content) > 15;