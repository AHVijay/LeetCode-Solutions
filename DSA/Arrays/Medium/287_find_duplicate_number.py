"""
Problem: Find the Duplicate Number
LeetCode: https://leetcode.com/problems/find-the-duplicate-number/
Difficulty: Medium
Data Structure: Array
Topics: Array, Linked List, Two Pointers

Description:
Given an array of n + 1 integers where each integer is in the range [1, n] 
inclusive, find the one number that appears more than once (could be more 
than twice) and find an integer that is missing. You must solve the problem 
without modifying the array and using only O(1) extra space.

Example 1:
Input: nums = [1,3,4,2,2]
Output: 2

Example 2:
Input: nums = [3,1,3,4,2]
Output: 3

Constraints:
- 1 <= n <= 10^5
- nums.length == n + 1
- 1 <= nums[i] <= n
- All integers in nums appear only once except for one integer which appears 
  two or more times.

Approach:
Treat the array as a linked list where the value at each index is a pointer 
to the next index. The duplicate number will be at the entrance of a cycle 
in this linked list. Use Floyd's Cycle Detection Algorithm (tortoise and hare):
1. Find if cycle exists (slow and fast pointers)
2. Find the entrance to the cycle (the duplicate number)

This is the most efficient solution with O(n) time and O(1) space.

Alternative Approaches (for reference):
- Hash Set: O(n) time, O(n) space
- Sorting: O(n log n) time, O(1) space
- Math: O(n) time, O(1) space (sum approach)

Time Complexity: O(n)
Space Complexity: O(1)
"""

class Solution:
    def findDuplicate(self, nums: list[int]) -> int:
        """
        Find the duplicate number using Floyd's Cycle Detection Algorithm.
        
        Args:
            nums: List of integers where one number appears more than once
            
        Returns:
            The duplicate number
        """
        # Phase 1: Find intersection point in cycle
        slow = nums[0]
        fast = nums[0]
        
        # Move slow by 1 step and fast by 2 steps
        while True:
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast:
                break
        
        # Phase 2: Find the entrance to the cycle
        slow = nums[0]
        while slow != fast:
            slow = nums[slow]
            fast = nums[fast]
        
        return slow
    
    def findDuplicate_HashSet(self, nums: list[int]) -> int:
        """
        Alternative approach using hash set.
        Time: O(n), Space: O(n)
        """
        seen = set()
        for num in nums:
            if num in seen:
                return num
            seen.add(num)
        return -1
    
    def findDuplicate_Math(self, nums: list[int]) -> int:
        """
        Alternative approach using math (sum).
        Time: O(n), Space: O(1)
        """
        n = len(nums) - 1
        expected_sum = n * (n + 1) // 2
        actual_sum = sum(nums)
        return actual_sum - expected_sum


# Test cases
if __name__ == "__main__":
    sol = Solution()
    
    # Test 1: Example from problem
    result = sol.findDuplicate([1, 3, 4, 2, 2])
    assert result == 2, f"Expected 2, got {result}"
    print("✓ Test 1 passed: [1,3,4,2,2] → 2")
    
    # Test 2: Example from problem
    result = sol.findDuplicate([3, 1, 3, 4, 2])
    assert result == 3, f"Expected 3, got {result}"
    print("✓ Test 2 passed: [3,1,3,4,2] → 3")
    
    # Test 3: Duplicate at beginning
    result = sol.findDuplicate([2, 5, 9, 6, 4, 3, 8, 9, 7, 1])
    assert result == 9, f"Expected 9, got {result}"
    print("✓ Test 3 passed: Duplicate 9")
    
    # Test 4: Small array
    result = sol.findDuplicate([1, 4, 4, 2, 4])
    assert result == 4, f"Expected 4, got {result}"
    print("✓ Test 4 passed: [1,4,4,2,4] → 4")
    
    # Test 5: Compare with alternative approaches
    test_nums = [3, 1, 3, 4, 2]
    r1 = sol.findDuplicate(test_nums)
    r2 = sol.findDuplicate_HashSet(test_nums)
    r3 = sol.findDuplicate_Math(test_nums)
    assert r1 == r2 == r3 == 3
    print("✓ Test 5 passed: All approaches give same result")
    
    print("\n✅ All tests passed!")
