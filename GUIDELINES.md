# Contribution Guidelines

This document outlines how to add LeetCode solutions to this repository.

## 📋 File Naming Convention

Use the following naming convention for all solution files:

```
{problem_number}_{problem_name_slug}.{extension}
```

**Examples:**
- `1_two_sum.py` (Python)
- `2_add_two_numbers.sql` (SQL)
- `3_longest_substring.py` (DSA - Python)
- `4_median_sorted_arrays.py` (DSA - Python)

## 📁 Directory Structure by Category

### SQL Solutions
```
SQL/
├── Easy/
│   ├── 175_combine_two_tables.sql
│   └── 176_second_highest_salary.sql
├── Medium/
├── Hard/
└── README.md
```

### Python Solutions
```
Python/
├── Easy/
│   ├── 1_two_sum.py
│   └── 2_valid_parentheses.py
├── Medium/
├── Hard/
└── README.md
```

### DSA (Data Structures and Algorithms)
```
DSA/
├── Arrays/
│   ├── Easy/
│   │   └── 1_two_sum.py
│   └── Medium/
├── Strings/
├── Trees/
├── Graphs/
├── Dynamic_Programming/
├── Sorting_Searching/
└── README.md
```

### ML (Machine Learning)
```
ML/
├── Supervised_Learning/
│   ├── 1_prediction_problem.py
│   └── README.md
├── Unsupervised_Learning/
└── README.md
```

## 📝 Solution Format

### Python & DSA Solutions
```python
"""
Problem: [Problem Title]
LeetCode: [Link to problem]
Difficulty: Easy/Medium/Hard
Topics: [tag1, tag2, tag3]

Description:
[Brief description of what the problem asks]

Approach:
[Explain your approach and time/space complexity]

Time Complexity: O(n)
Space Complexity: O(n)
"""

# Solution code here

class Solution:
    def methodName(self, param: type) -> type:
        """
        Solution implementation
        """
        pass

# Test cases
if __name__ == "__main__":
    sol = Solution()
    print(sol.methodName(...))  # Expected output: ...
```

### SQL Solutions
```sql
/*
Problem: [Problem Title]
LeetCode: [Link to problem]
Difficulty: Easy/Medium/Hard
Database: MySQL/PostgreSQL/MSSQL

Description:
[Brief description of the problem]

Approach:
[Explain your approach]

Time Complexity: O(n)
*/

-- Solution query here
SELECT ...
FROM ...
WHERE ...
```

### ML Solutions
```python
"""
Problem: [Problem Title]
Type: Supervised/Unsupervised Learning
Difficulty: Easy/Medium/Hard
Libraries: [numpy, pandas, scikit-learn, etc.]

Description:
[Brief description of the ML task]

Approach:
[Explain your approach and methodology]

Evaluation Metric:
[Accuracy, F1-score, etc.]
"""

import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split

# Solution code here

if __name__ == "__main__":
    # Test implementation
    pass
```

## 📋 Template Examples

### Example 1: Python Easy Problem
```python
"""
Problem: Two Sum
LeetCode: https://leetcode.com/problems/two-sum/
Difficulty: Easy
Topics: Array, Hash Table

Description:
Given an array of integers nums and an integer target, return the indices of 
the two numbers that add up to target. You may assume that each input has 
exactly one solution, and you may not use the same element twice.

Approach:
Use a hash map to store each number and its index. For each number, check if 
the complement (target - num) exists in the hash map. If it does, return both indices.

Time Complexity: O(n)
Space Complexity: O(n)
"""

class Solution:
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        # Dictionary to store value: index
        seen = {}
        
        for i, num in enumerate(nums):
            complement = target - num
            if complement in seen:
                return [seen[complement], i]
            seen[num] = i
        
        return []

# Test cases
if __name__ == "__main__":
    sol = Solution()
    
    # Test 1
    assert sol.twoSum([2, 7, 11, 15], 9) == [0, 1]
    
    # Test 2
    assert sol.twoSum([3, 2, 4], 6) == [1, 2]
    
    # Test 3
    assert sol.twoSum([3, 3], 6) == [0, 1]
    
    print("All test cases passed!")
```

### Example 2: SQL Easy Problem
```sql
/*
Problem: Combine Two Tables
LeetCode: https://leetcode.com/problems/combine-two-tables/
Difficulty: Easy
Database: MySQL

Description:
Write a SQL query to report the first name, last name, city, and state 
of each person in the Person table. If the address of a person is not 
present in the Address table, report their city and state as null.

Approach:
Use LEFT JOIN to combine Person and Address tables, keeping all records 
from Person table even if they don't have a matching address.

Time Complexity: O(n + m) where n is Person records, m is Address records
*/

SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;
```

## ✅ Checklist Before Committing

- [ ] File named correctly: `{problem_number}_{slug}.{extension}`
- [ ] File placed in correct category folder
- [ ] Problem statement included
- [ ] Solution is well-commented
- [ ] Time and space complexity mentioned
- [ ] Test cases included (for Python/DSA)
- [ ] Code is formatted and readable
- [ ] No unnecessary imports or code

## 🔄 Git Workflow

```bash
# 1. Create a new branch
git checkout -b add/problem-number-name

# 2. Add your solution
git add SQL/Easy/175_combine_two_tables.sql

# 3. Commit with a descriptive message
git commit -m "Add solution for LeetCode Problem #175 - Combine Two Tables"

# 4. Push to remote
git push origin add/problem-number-name

# 5. Create a Pull Request on GitHub
```

## 📝 Commit Message Format

```
Add/Update solution for LeetCode Problem #{number} - {Problem Name}

- Category: [SQL/Python/DSA/ML]
- Difficulty: [Easy/Medium/Hard]
- Complexity: Time O(...), Space O(...)
```

## 🚫 Things to Avoid

- ❌ Don't commit without problem statement
- ❌ Don't use generic filenames like `solution.py` or `code.sql`
- ❌ Don't include personal comments or code from other sources without attribution
- ❌ Don't commit without testing your solution
- ❌ Don't place files in wrong category folders

## 📈 Updating Statistics

After adding a new solution, update the README.md file with the new count:
- SQL: X solutions
- Python: Y solutions
- DSA: Z solutions
- ML: W solutions

---

**Questions?** Refer to LeetCode's problem statement for the exact requirements of each problem.
