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

print(is_valid_paranthesis("()[]{}"))


"""
3) Linked List Cycle Detection : Microsoft, Amazon, Apple

**Theory** : Floyd's Cycle Detection ( Tortoise and Hare) uses two pointers moving at different speeds. 
If there's a cycle, the fast pointer will eventually meet the slow pointer. 
This demonstrates pointer manipulation and optimal space usage.

---
**Problem** : Given the head of a linked list, determine if the linked list has a cycle in it.

Approach: 
1) Use two pointers, slow and fast.
2) Move slow by one step and fast by two steps.
3) If they meet, there's a cycle.

Time Complexity: O(n)
Space Complexity: O(n)
"""

class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

    @staticmethod
    def has_cycle(head):
        if not head or not head.next:
            return False
        
        slow = head
        fast = head.next

        while fast and fast.next:
            if slow == fast:
                return True
            
            slow = slow.next
            fast = fast.next.next
        
        return False


"""
4) Binary Search : Google, Meta, Amazon, Apple

**Theory** : Binary search works on sorted array, repeatedly dividing the search space in half. 
It's the foundation for many optimization problems, Time complexity is O(logn) because we eliminate half the elements each iteration.

---
**Problem** : Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. 
If target exists, then return its index. Otherwise, return -1.

Approach: 
1) Use two pointers, left and right.
2) Find the middle element.
3) If the middle element is the target, return its index.
4) If the target is less than the middle element, move the right pointer to the left of the middle element.
5) If the target is greater than the middle element, move the left pointer to the right of the middle element.

Time Complexity: O(logn)
Space Complexity: O(1)
"""

def binary_serach(nums, target):

    left, right = 0, len(nums) - 1

    while left <= right:
        mid = left +(right - left) // 2

        if nums[mid] == target:
            return mid
        elif nums[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    
    return -1

print(binary_serach([-1,0,3,5,9,12], 9))


"""
5)Merge Intervals : Google, Meta, Amazon, Microsoft

**Theory** : Interval problems often require sorting first. Sorting by start time, we can process intervals linearly and merge overlapping ones. 
This pattern appears in scheduling, resource allocation problems. [Greedy Approach]

---
**Problem** : You are given an array of non-overlapping intervals where 
intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starting. 
You are also given an interval newInterval = [start, end] that represents the start and end of another interval.
Insert newInterval into intervals such that intervals is still sorted in ascending order by starting time,
and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).

Approach: 
1) Use two pointers, left and right.
2) If the current interval ends before newInterval starts, add the current interval to the result.
3) If the current interval starts after newInterval ends, add the newInterval to the result and set newInterval to the current interval.
4) If the current interval overlaps with newInterval, merge them and update newInterval.

Time Complexity: O(nlogn)
Space Complexity: O(1)
"""

def merge_intervals(intervals):

    if not intervals:
        return []
    
    intervals.sort(key=lambda x: x[0])
    merged = intervals[0]

    for current in intervals:
        last = merged[-1]
        if current[0] <= last:
            merged[-1] = [last[0], max[(last[1], current[1])]]
        else:
            merged.append(current)
    
    return merged

print(merge_intervals([[1,3],[2,6],[8,10],[15,18]]))


"""
6)Binary Tree Level order Traversal : Amazon, Meta, Microsoft, Apple

**Theory** : BFS(Breadth-First-Search) uses a QUEUE to visit nodes level by level. This is crucial for shortest path problems, 
tree traversals, and graph exploration. Unlike DFS(which uses a STACK), BFS explores neighbors before going deeper.

---
**Problem** : Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

Approach: 
1) Use a queue to keep track of nodes at each level.
2) For each level, add the node values to the result.
3) Add the left and right children of the current node to the queue.

Time Complexity: O(n)
Space Complexity: O(n)
"""

from collections import deque

class TreeNode:
    def __init__(self, val = 0, left = None, right = None):
        self.val = val
        self.left = left
        self.right = right

    def level_order(self, root):
        if not root:
            return []
        
        result = []
        queue = deque([root])

        while queue:
            level_size = len(queue)
            cur_level = []

            for _ in range(level_size):
                node = queue.popleft()
                cur_level.append(node.val)

                if node.left:
                    queue.append(node.left)
                if node.right:
                    queue.append(node.right)

            result.append(cur_level)
        
        return result
    

"""
7)Longest Substring without Repeating Characters : Amazon, Google, Meta, Bloomberg

**Theory** : Sliding window is a pattern for substring/subarray problems. We maintain a window of vlid elements and expand/contract it. 
Using a set or dictionary tracks seen characters for O(1) lookups.

---
**Problem** : Given a string s, find the length of the longest substring without repeating characters.

Approach: 
1) Use a set to keep track of seen characters.
2) Use two pointers, left and right.
3) Move the right pointer to the right until we see a repeating character.
4) Move the left pointer to the right until we remove the repeating character.

Time Complexity: O(n)
Space Complexity: O(min(n,m))
"""

def length_of_longest_substring(s):
  """
  Time: O(n), Space: O(min(n,m)) where m is charset size
  Sliding window to track seen characters
  """
  char_set = set()
  left = 0
  longest = 0

  for right in range(len(s)):
    # Shrink window until no duplicates
    while s[right] in char_set:
      char_set.remove(s[left])
      left += 1

    char_set.add(s[right])
    longest = max(longest, right - left + 1)

  return longest

print(length_of_longest_substring("pwwkew"))
print(length_of_longest_substring("abcabcbb"))
print(length_of_longest_substring("bbbbb"))


"""
8) Group Anagrams : Amazon, Meta, Uber, Meta

**Theory** : Anagrams have identical character frequencies, Sorting creates a conical form for grouping. 
Using sorted strings as dictionary keys groups anagrams together in O(n*k log k) time, where k is average string length.

---
**Problem** : Given an array of strings strs, group the anagrams together. You can return the answer in any order.

Approach: 
1) Use a dictionary to group anagrams.
2) For each string, sort the string and use it as a key.
3) Append the string to the list of values for the key.

Time Complexity: O(nklogk)
Space Complexity: O(nk)
"""

from collections import defaultdict
def group_anagrams(strs):

    ans = defaultdict(list)

    for word in strs:
        key = "".join(sorted(word))
        ans[key].append(word)

    return list(ans.values())

print(group_anagrams(["eat","tea","tan","ate","nat","bat"]))
