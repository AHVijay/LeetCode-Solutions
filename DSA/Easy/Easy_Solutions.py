"""
1) Two sum problem : Google, Amazon, Microsoft, Meta

**Theory** : The two sumn problem tests understanding of hash tables (Dictionaries) and Space-time tradeoffs. 
The naive O(n^2) solution uses nested loops, but using hash map reduces this O(n) time with O(n) space.

---
**Problem** : Given an array of integers and a target sum, return indices of two numbers that add upto the target.

Approach: 
1) Use a hash map to store each number and its index.
2) For each number, check if the complement (target - num) exists in the hash map.

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

"""
2) Valid Parantheses : Google, Amazon, Bloomberg, Meta

**Theory** : Stack-based problems are fundamental. Stack follows LIFO principle. 
For matching problems, stacks help track opening brackets and match them with closing ones in reverse order.

---
**Problem** : Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

Approach: 
1) Use a stack to keep track of opening brackets.
2) For each character in the string:
    - If it's an opening bracket, push it onto the stack.
    - If it's a closing bracket, check if the stack is empty or the top of the stack doesn't match.

Time Complexity: O(n)
Space Complexity: O(n)
"""

from typing import Mapping
def is_valid_paranthesis(s):
    stack = []

    Mapping = {')':'(', '}':'{', ']':'['}

    for char in s:
        if char in Mapping:

            if stack and stack[-1] == Mapping[char]:
                stack.pop()
            else:
                return False
        else:
            stack.append(char)
    
    return True if not stack else False