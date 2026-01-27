"""
1) Problem: Empirical Probability Mass Function (PMF)
Deep-ML: https://www.deep-ml.com/problems/184
Difficulty: Easy


Description:

Given a list of integer samples drawn from a discrete distribution, implement a function to compute the empirical Probability Mass Function (PMF). 
The function should return a list of (value, probability) pairs sorted by the value in ascending order. 
If the input is empty, return an empty list.

Examples:
Input:
samples = [1, 2, 2, 3, 3, 3]
Output:
[(1, 0.16666666666666666), (2, 0.3333333333333333), (3, 0.5)]

Approach:
[Your approach in 2-3 sentences]
[Why this approach? What's the key insight?]

Time Complexity: O(...)
Space Complexity: O(...)
"""

from collections import Counter

def pmf(samples: list[int]) -> list[tuple[int, float]]:
    if not samples:
        return []
    
    count = Counter(samples)
    total = len(samples)

    return sorted((value, count / total) for value, count in count.items())

# Test cases
assert pmf([1, 2, 2, 3, 3, 3]) == [(1, 0.16666666666666666), (2, 0.3333333333333333), (3, 0.5)]
assert pmf([]) == []
