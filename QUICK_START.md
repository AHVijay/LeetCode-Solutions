# 🚀 Quick Start Guide

## ⚡ 30-Second Setup

1. Open this folder in VS Code
2. Initialize Git: `git init`
3. Create GitHub repository
4. Push initial structure: `git add . && git commit -m "Initial commit" && git push`

Done! Now you can start adding solutions.

## 📝 Adding Your First Solution

### Option 1: Python/DSA

```bash
# 1. Go to folder
cd Python/Easy

# 2. Create file: 1_two_sum.py
```

Copy this template:
```python
"""
Problem: Two Sum
LeetCode: https://leetcode.com/problems/two-sum/
Difficulty: Easy
Topics: Array, Hash Table

Description:
Given an array of integers nums and an integer target, return the indices 
of the two numbers that add up to target.

Approach:
Use a hash map to store numbers we've seen. For each number, check if 
the complement exists in the map.

Time Complexity: O(n)
Space Complexity: O(n)
"""

class Solution:
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        seen = {}
        for i, num in enumerate(nums):
            if target - num in seen:
                return [seen[target - num], i]
            seen[num] = i
        return []

if __name__ == "__main__":
    sol = Solution()
    assert sol.twoSum([2, 7, 11, 15], 9) == [0, 1]
    print("✅ Test passed!")
```

### Option 2: SQL

```bash
# 1. Go to folder
cd SQL/Easy

# 2. Create file: 175_combine_two_tables.sql
```

Copy this template:
```sql
/*
Problem: Combine Two Tables
LeetCode: https://leetcode.com/problems/combine-two-tables/
Difficulty: Easy

Description:
Join Person and Address to get first name, last name, city, state.
Show NULL for missing addresses.

Approach:
LEFT JOIN keeps all Person records.
*/

SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;
```

## 🔄 Commit Your Solution

```bash
# Test it (for Python)
python Python/Easy/1_two_sum.py

# Stage the file
git add Python/Easy/1_two_sum.py

# Commit
git commit -m "Add solution for LeetCode Problem #1 - Two Sum"

# Push
git push origin main
```

## 📁 Folder Structure at a Glance

```
LeetCode-Solutions/
├── SQL/
│   ├── Easy/
│   │   └── 175_combine_two_tables.sql
│   ├── Medium/
│   ├── Hard/
│   └── README.md
├── Python/
│   ├── Easy/
│   │   ├── 1_two_sum.py
│   │   └── 20_valid_parentheses.py
│   ├── Medium/
│   ├── Hard/
│   └── README.md
├── DSA/
│   ├── Arrays/
│   │   ├── Easy/
│   │   ├── Medium/
│   │   │   └── 287_find_duplicate_number.py
│   │   └── Hard/
│   ├── Strings/
│   ├── Trees/
│   ├── Graphs/
│   ├── Dynamic_Programming/
│   └── README.md
├── ML/
│   ├── Supervised_Learning/
│   ├── Unsupervised_Learning/
│   └── README.md
├── README.md          ← Project overview
├── GUIDELINES.md      ← Detailed rules
├── HOW_TO_WRITE_SOLUTIONS.md ← Complete guide with examples
├── SETUP.md          ← Development setup
└── .gitignore
```

## 🎯 File Naming Rules

| Type | Pattern | Example |
|------|---------|---------|
| Python | `{num}_{slug}.py` | `1_two_sum.py` |
| SQL | `{num}_{slug}.sql` | `175_combine_two_tables.sql` |
| DSA | `{num}_{slug}.py` | `287_find_duplicate_number.py` |
| ML | `{num}_{slug}.py` | `1_iris_classification.py` |

## ✅ Solution Checklist

Before pushing:
- [ ] File in correct folder with correct name
- [ ] Problem statement in comments
- [ ] Solution code works and is tested
- [ ] Time & space complexity documented
- [ ] Test cases included
- [ ] Code is readable and commented

## 📚 Helpful Resources

- **Problem statement & examples**: [LeetCode](https://leetcode.com)
- **Detailed guide**: [HOW_TO_WRITE_SOLUTIONS.md](HOW_TO_WRITE_SOLUTIONS.md)
- **Full guidelines**: [GUIDELINES.md](GUIDELINES.md)
- **Setup help**: [SETUP.md](SETUP.md)

## 🔗 Example Solutions Included

Already added to show you the format:
- ✅ `Python/Easy/1_two_sum.py` - Hash map approach
- ✅ `Python/Easy/20_valid_parentheses.py` - Stack approach
- ✅ `SQL/Easy/175_combine_two_tables.sql` - JOIN example
- ✅ `DSA/Arrays/Medium/287_find_duplicate_number.py` - Floyd's cycle detection

## 💡 Pro Tips

1. **Copy problem statement** - Paste directly from LeetCode
2. **Test locally first** - Run your Python/ML code before pushing
3. **Use meaningful commits** - Makes history readable
4. **Keep complexity documented** - Important for review
5. **Add edge cases** - Not just happy path tests

## ❓ Need Help?

1. Check [HOW_TO_WRITE_SOLUTIONS.md](HOW_TO_WRITE_SOLUTIONS.md) - Step-by-step guide with examples
2. Check [GUIDELINES.md](GUIDELINES.md) - Full detailed rules
3. Look at example solutions in the folders
4. Check [SETUP.md](SETUP.md) - Git and environment setup

## 🚀 Next Steps

1. Read [HOW_TO_WRITE_SOLUTIONS.md](HOW_TO_WRITE_SOLUTIONS.md)
2. Pick a problem from [LeetCode](https://leetcode.com)
3. Create a solution file following the template
4. Test it locally
5. Commit and push
6. Repeat! 🎉

---

Happy coding! 💻
