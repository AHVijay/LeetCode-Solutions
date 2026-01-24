"""
Problem: Valid Parentheses
LeetCode: https://leetcode.com/problems/valid-parentheses/
Difficulty: Easy
Topics: String, Stack

Description:
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']',
determine if the input string is valid. An input string is valid if:
1. Open brackets must be closed by the same type of brackets.
2. Open brackets must be closed in the correct order.
3. Every close bracket has a corresponding open bracket of the same type.

Example 1:
Input: s = "()"
Output: true

Example 2:
Input: s = "()[]{}"
Output: true

Example 3:
Input: s = "(]"
Output: false

Example 4:
Input: s = "([{}])"
Output: true

Approach:
Use a stack to keep track of opening brackets. For each character:
- If it's an opening bracket, push it to the stack
- If it's a closing bracket, check if it matches the top of the stack
- At the end, the stack should be empty if the string is valid

Time Complexity: O(n) where n is the length of string
Space Complexity: O(n) for the stack in worst case (all opening brackets)
"""

class Solution:
    def isValid(self, s: str) -> bool:
        """
        Check if parentheses are valid.
        
        Args:
            s: String containing brackets
            
        Returns:
            True if valid, False otherwise
        """
        # Mapping of closing to opening brackets
        closing_to_opening = {
            ')': '(',
            ']': '[',
            '}': '{'
        }
        
        stack = []
        
        for char in s:
            if char in closing_to_opening:
                # It's a closing bracket
                # Check if stack is empty or top doesn't match
                if not stack or stack[-1] != closing_to_opening[char]:
                    return False
                stack.pop()
            else:
                # It's an opening bracket
                stack.append(char)
        
        # Valid only if stack is empty
        return len(stack) == 0


# Test cases
if __name__ == "__main__":
    sol = Solution()
    
    # Test 1: Simple valid case
    assert sol.isValid("()") == True
    print("✓ Test 1 passed: '()' is valid")
    
    # Test 2: Multiple types
    assert sol.isValid("()[]{}") == True
    print("✓ Test 2 passed: '()[]{}' is valid")
    
    # Test 3: Invalid - mismatched brackets
    assert sol.isValid("(]") == False
    print("✓ Test 3 passed: '(]' is invalid")
    
    # Test 4: Nested brackets
    assert sol.isValid("([{}])") == True
    print("✓ Test 4 passed: '([{}])' is valid")
    
    # Test 5: Closing without opening
    assert sol.isValid(")") == False
    print("✓ Test 5 passed: ')' is invalid")
    
    # Test 6: Empty string
    assert sol.isValid("") == True
    print("✓ Test 6 passed: Empty string is valid")
    
    # Test 7: Complex nested
    assert sol.isValid("([]){}") == True
    print("✓ Test 7 passed: '([]){}' is valid")
    
    # Test 8: Invalid nesting
    assert sol.isValid("([)]") == False
    print("✓ Test 8 passed: '([)]' is invalid")
    
    print("\n✅ All tests passed!")
