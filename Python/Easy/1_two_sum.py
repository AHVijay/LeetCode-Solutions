"""
Problem: Two Sum
LeetCode: https://leetcode.com/problems/two-sum/
Difficulty: Easy
Topics: Array, Hash Table

Description:
Given an array of integers nums and an integer target, return the indices 
of the two numbers that add up to target. You may assume that each input 
has exactly one solution, and you may not use the same element twice.

Example 1:
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: nums[0] + nums[1] == 9, so we return [0, 1].

Example 2:
Input: nums = [3,2,4], target = 6
Output: [1,2]

Example 3:
Input: nums = [3,3], target = 6
Output: [0,1]

Approach:
Use a hash map to store each number and its index. For each number, check 
if the complement (target - num) exists in the hash map. If it does, return 
both indices. This avoids the O(n²) nested loop approach.

Time Complexity: O(n)
Space Complexity: O(n)
"""

class Solution:
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        """
        Find two numbers in nums that add up to target.
        
        Args:
            nums: List of integers
            target: Target sum
            
        Returns:
            List of two indices whose values sum to target
        """
        # Dictionary to store value: index pairs
        seen = {}
        
        for i, num in enumerate(nums):
            complement = target - num
            
            # Check if complement exists in our dictionary
            if complement in seen:
                return [seen[complement], i]
            
            # Store current number and its index
            seen[num] = i
        
        # No solution found (shouldn't happen per problem statement)
        return []


# Test cases
if __name__ == "__main__":
    sol = Solution()
    
    # Test 1: Example from problem
    result = sol.twoSum([2, 7, 11, 15], 9)
    assert result == [0, 1], f"Expected [0, 1], got {result}"
    print("✓ Test 1 passed: [2,7,11,15] with target 9")
    
    # Test 2: Example from problem
    result = sol.twoSum([3, 2, 4], 6)
    assert result == [1, 2], f"Expected [1, 2], got {result}"
    print("✓ Test 2 passed: [3,2,4] with target 6")
    
    # Test 3: Example from problem
    result = sol.twoSum([3, 3], 6)
    assert result == [0, 1], f"Expected [0, 1], got {result}"
    print("✓ Test 3 passed: [3,3] with target 6")
    
    # Test 4: Negative numbers
    result = sol.twoSum([-1, -2, -3, 5, 10], 7)
    assert result == [1, 4], f"Expected [1, 4], got {result}"
    print("✓ Test 4 passed: Negative numbers")
    
    # Test 5: Large numbers
    result = sol.twoSum([1000000, 1000001], 2000001)
    assert result == [0, 1], f"Expected [0, 1], got {result}"
    print("✓ Test 5 passed: Large numbers")
    
    print("\n✅ All tests passed!")
