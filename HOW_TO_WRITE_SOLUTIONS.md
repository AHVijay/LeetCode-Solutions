# How to Write Solutions - Quick Reference Guide

This guide shows you exactly how to write and format your LeetCode solutions for this repository.

## 📋 Quick Checklist

- [ ] File named correctly: `{problem_number}_{slug}.{ext}`
- [ ] File in correct category folder
- [ ] Problem statement included
- [ ] Solution code written
- [ ] Time & space complexity documented
- [ ] Test cases included and passing
- [ ] Code follows style guidelines
- [ ] Commit message is descriptive

## 🚀 Step-by-Step Process

### Step 1: Find Your Problem
Go to [LeetCode.com](https://leetcode.com), find a problem you want to solve.

### Step 2: Create the File

**Location**: Determine which folder based on your problem:
- **SQL** → `SQL/Easy/` or `SQL/Medium/` or `SQL/Hard/`
- **Python** → `Python/Easy/` or `Python/Medium/` or `Python/Hard/`
- **DSA** → `DSA/{DataStructure}/{Difficulty}/`
- **ML** → `ML/{Category}/`

**Filename Format**:
```
{problem_number}_{problem_name_in_snake_case}.{extension}
```

Examples:
- `1_two_sum.py`
- `175_combine_two_tables.sql`
- `287_find_duplicate_number.py`

### Step 3: Write the Solution

Follow the appropriate template below.

---

## 📝 Solution Templates

### Python/DSA Template

```python
"""
Problem: [EXACT PROBLEM TITLE]
LeetCode: [Copy full URL from problem page]
Difficulty: Easy/Medium/Hard
Topics: [List 2-3 main topics]

Description:
[Copy the problem description here - 2-3 sentences max of the key requirement]

Examples:
[Include 1-2 key examples from the problem]

Approach:
[Your approach in 2-3 sentences]
[Why this approach? What's the key insight?]

Time Complexity: O(...)
Space Complexity: O(...)
"""

class Solution:
    def methodName(self, param: type) -> type:
        """
        [Brief description of what this method does]
        
        Args:
            param: Description
            
        Returns:
            Description
        """
        # Your solution here
        pass


# Test cases
if __name__ == "__main__":
    sol = Solution()
    
    # Test 1: [Description]
    result = sol.methodName(...)
    assert result == expected, f"Expected {expected}, got {result}"
    print("✓ Test 1 passed: [description]")
    
    # More tests...
    
    print("\n✅ All tests passed!")
```

### SQL Template

```sql
/*
Problem: [EXACT PROBLEM TITLE]
LeetCode: [Copy full URL]
Difficulty: Easy/Medium/Hard
Database: MySQL/PostgreSQL/MSSQL

Description:
[Brief description of what you need to do]

Approach:
[Your approach in 1-2 sentences]

Time Complexity: O(...)
*/

-- Your solution query here
SELECT ...
FROM ...
WHERE ...
```

### ML Template

```python
"""
Problem: [PROBLEM TITLE]
Type: Supervised/Unsupervised/etc
Difficulty: Easy/Medium/Hard
Libraries: [List libraries: numpy, pandas, scikit-learn]

Description:
[What's the ML task?]

Approach:
[Your approach]

Evaluation Metric:
[Accuracy, F1-score, etc.]
"""

import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split

class MLSolution:
    def prepare_data(self, X, y):
        """Prepare data"""
        pass
    
    def train(self, X_train, y_train):
        """Train model"""
        pass
    
    def predict(self, X_test):
        """Make predictions"""
        pass


if __name__ == "__main__":
    # Example usage
    pass
```

---

## 💡 Real Examples

### Python Example: Easy Problem

**File**: `Python/Easy/1_two_sum.py`

```python
"""
Problem: Two Sum
LeetCode: https://leetcode.com/problems/two-sum/
Difficulty: Easy
Topics: Array, Hash Table

Description:
Given an array of integers nums and an integer target, return the indices 
of the two numbers that add up to target.

Example:
Input: nums = [2,7,11,15], target = 9
Output: [0,1]

Approach:
Use a hash map to store numbers we've seen with their indices. For each 
number, check if (target - number) exists in our map. This gives us O(n) 
instead of O(n²).

Time Complexity: O(n)
Space Complexity: O(n)
"""

class Solution:
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        seen = {}
        for i, num in enumerate(nums):
            complement = target - num
            if complement in seen:
                return [seen[complement], i]
            seen[num] = i
        return []


if __name__ == "__main__":
    sol = Solution()
    
    assert sol.twoSum([2, 7, 11, 15], 9) == [0, 1]
    assert sol.twoSum([3, 2, 4], 6) == [1, 2]
    
    print("✅ All tests passed!")
```

### SQL Example: Easy Problem

**File**: `SQL/Easy/175_combine_two_tables.sql`

```sql
/*
Problem: Combine Two Tables
LeetCode: https://leetcode.com/problems/combine-two-tables/
Difficulty: Easy

Description:
Join Person and Address tables to show first name, last name, city, state.
Include people with no address (showing NULL).

Approach:
LEFT JOIN to keep all Person records, matching Address when available.
*/

SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;
```

### DSA Example: Medium Problem

**File**: `DSA/Arrays/Medium/287_find_duplicate_number.py`

```python
"""
Problem: Find the Duplicate Number
LeetCode: https://leetcode.com/problems/find-the-duplicate-number/
Difficulty: Medium
Data Structure: Array
Topics: Array, Linked List, Two Pointers

Description:
Find one number appearing more than once in array of n+1 integers 
from range [1,n]. Use O(1) space only.

Example:
Input: [1,3,4,2,2]
Output: 2

Approach:
Treat array as linked list (value = next index). Duplicate creates a cycle.
Use Floyd's Cycle Detection (tortoise & hare) to find cycle entrance.

Time Complexity: O(n)
Space Complexity: O(1)
"""

class Solution:
    def findDuplicate(self, nums: list[int]) -> int:
        slow = fast = nums[0]
        
        while True:
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast:
                break
        
        slow = nums[0]
        while slow != fast:
            slow = nums[slow]
            fast = nums[fast]
        
        return slow


if __name__ == "__main__":
    sol = Solution()
    
    assert sol.findDuplicate([1, 3, 4, 2, 2]) == 2
    assert sol.findDuplicate([3, 1, 3, 4, 2]) == 3
    
    print("✅ All tests passed!")
```

---

## ✨ Writing Tips

### Problem Description Tips
- Copy the key part of the problem statement
- Include 1-2 examples with input/output
- Keep it concise (don't copy everything)
- Bold important constraints: **You must use O(1) space**

### Approach Tips
- Explain your algorithm in 2-3 sentences
- Mention why this approach works
- Highlight the key insight or trick
- If using unusual technique, explain it briefly

### Code Style

**Python:**
```python
# Good: Clear variable names
seen = {}
for i, num in enumerate(nums):

# Avoid: Single letter vars for complex logic
s = {}
for i, n in enumerate(nums):
```

**SQL:**
```sql
-- Good: Clear aliases and formatting
SELECT 
    p.firstName,
    a.city
FROM Person p
LEFT JOIN Address a ON p.id = a.person_id;

-- Avoid: Hard to read
select p.firstname, a.city from person p left join address a on p.id=a.person_id;
```

### Test Cases

Include various test cases:
- ✅ Example from problem
- ✅ Edge cases (empty, single element, large numbers)
- ✅ Different patterns (worst case, best case)
- ✅ Boundary conditions

```python
# Bad: Only one test
assert sol.twoSum([2, 7], 9) == [0, 1]

# Good: Multiple meaningful tests
assert sol.twoSum([2, 7, 11, 15], 9) == [0, 1]      # Normal case
assert sol.twoSum([3, 3], 6) == [0, 1]              # Duplicate values
assert sol.twoSum([-1, 10], 9) == [0, 1]            # Negative numbers
```

---

## 🔄 Git Workflow

```bash
# 1. Create and modify file
# (write your solution in the file)

# 2. Test locally
python Python/Easy/1_two_sum.py

# 3. Stage the file
git add Python/Easy/1_two_sum.py

# 4. Commit with descriptive message
git commit -m "Add solution for LeetCode Problem #1 - Two Sum

- Category: Python
- Difficulty: Easy
- Time: O(n), Space: O(n)
- Approach: Hash map"

# 5. Push to GitHub
git push origin main
```

---

## ❌ Common Mistakes to Avoid

| Mistake | ✅ Correct |
|---------|-----------|
| `solution.py` | `1_two_sum.py` |
| `Python/1_two_sum.py` | `Python/Easy/1_two_sum.py` |
| No comments | Well-documented code |
| Missing test cases | Comprehensive tests |
| Wrong complexity | Accurate O(n) analysis |
| No examples in docstring | Clear examples included |

---

## 📚 Resources

- [LeetCode](https://leetcode.com)
- [Big O Cheat Sheet](https://www.bigocheatsheet.com/)
- [Python Style Guide (PEP 8)](https://pep8.org/)
- [SQL Style Guide](https://www.sqlstyle.guide/)

---

## 🎯 Summary

1. **Create file** with correct name in correct folder
2. **Write solution** following the template
3. **Document** problem statement, approach, complexity
4. **Add test cases** that actually run
5. **Commit** with clear message
6. **Push** to GitHub

That's it! You're ready to start solving! 🚀
