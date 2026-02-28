"""
1) Two sum problem : Google, Amazon, Microsoft, Meta

**Theory** : The two sumn problem tests understanding of hash tables (Dictionaries) and Space-time tradeoffs. 
The naive O(n^2) solution uses nested loops, but using hash map reduces this O(n) time with O(n) space.

---
**Problem** : Given an array of integers and a target sum, return indices of two numbers that add upto the target.

Approach:

Time Complexity: O(n)
Space Complexity: O(n)
"""

def two_sum( nums, target):

    seen = {}

    for i, num in enumerate(nums):
        complement = target - num

        if complement in seen:
            return [seen[complement], i]
        
        seen[num] = i
    
    return []
print(two_sum([2,7,11,15], 9))