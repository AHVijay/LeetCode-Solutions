"""
1. Problem: Fredo and Array
Hackerearth: https://www.hackerearth.com/problem/algorithm/fredo-and-array-easy/

Description:

Fredo is learning bit manipulation and he is given an array A of N integers. 
Minimum value 'x' to which all elements of the given array must be updated 
such that the product of all elements of the array is strictly greater than the product of the original array.


Example:

Input:
5
1 2 3 4 5
Output:
4

Approach:
1) Use set operations to find the common elements, difference and union of sets.

Time Complexity: O(n)
Space Complexity: O(n)
"""

def findMinimumValue(n, a):
    product = 1
    for i in a:
        product *= i
    x = 1
    while x ** n <= product:
        x += 1
    return x