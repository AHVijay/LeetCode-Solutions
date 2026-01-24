/*
Problem: Combine Two Tables
LeetCode: https://leetcode.com/problems/combine-two-tables/
Difficulty: Easy
Database: MySQL

Tables:
Person: PersonId, FirstName, LastName
Address: AddressId, PersonId, City, State

Description:
Write a SQL query to report the first name, last name, city, and state 
of each person in the Person table. If the address of a person is not 
present in the Address table, report their city and state as null.

Approach:
Use LEFT JOIN to combine Person and Address tables. This ensures all 
records from Person table are included even if they don't have a matching 
address entry. The join condition is PersonId.

Time Complexity: O(n + m) where n is Person records, m is Address records
*/

SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;

/*
Explanation:
- LEFT JOIN keeps all rows from the Person table (left table)
- For each person, we try to find a matching address
- If no address exists, city and state will be NULL
- This satisfies the requirement to show NULL for missing addresses
*/
