# Repository Setup Guide

This guide will help you get started with the LeetCode Solutions repository.

## Prerequisites

- Git installed ([Download](https://git-scm.com/))
- GitHub account ([Create here](https://github.com/signup))
- Python 3.8+ (for Python/DSA/ML solutions)
- A code editor (VS Code recommended)

## Initial Setup

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/LeetCode-Solutions.git
cd LeetCode-Solutions
```

### 2. Create a Python Virtual Environment (Optional but Recommended)

```bash
# Windows
python -m venv venv
venv\Scripts\activate

# macOS/Linux
python3 -m venv venv
source venv/bin/activate
```

### 3. Install Dependencies (if any)

```bash
pip install -r requirements.txt
```

## Daily Workflow

### Adding a New Solution

1. **Create the file** in the appropriate category:
   ```bash
   # Example: Adding a Python solution
   touch Python/Easy/1_two_sum.py
   ```

2. **Use the template** from [GUIDELINES.md](GUIDELINES.md):
   - Include problem statement
   - Add your solution
   - Include test cases
   - Document time/space complexity

3. **Test your solution**:
   ```bash
   python Python/Easy/1_two_sum.py
   ```

4. **Commit your changes**:
   ```bash
   git add Python/Easy/1_two_sum.py
   git commit -m "Add solution for LeetCode Problem #1 - Two Sum"
   git push origin main
   ```

## Organizing Solutions by Category

### SQL Solutions
```
SQL/
├── Easy/
│   └── 175_combine_two_tables.sql
├── Medium/
└── Hard/
```

**When to use**: Database queries, joins, aggregations, window functions

### Python Solutions
```
Python/
├── Easy/
│   └── 1_two_sum.py
├── Medium/
└── Hard/
```

**When to use**: General Python problems, string manipulation, basic algorithms

### DSA (Data Structures & Algorithms)
```
DSA/
├── Arrays/
│   ├── Easy/
│   └── Medium/
├── Strings/
├── Trees/
├── Graphs/
├── Dynamic_Programming/
└── Sorting_Searching/
```

**When to use**: Algorithm-focused problems, data structure problems

### ML (Machine Learning)
```
ML/
├── Supervised_Learning/
│   ├── Regression/
│   └── Classification/
├── Unsupervised_Learning/
│   ├── Clustering/
│   └── Dimensionality_Reduction/
└── Reinforcement_Learning/
```

**When to use**: ML problems, model training, predictions, feature engineering

## Best Practices

### File Naming
✅ Good:
- `1_two_sum.py`
- `175_combine_two_tables.sql`
- `20_valid_parentheses.py`

❌ Bad:
- `solution.py`
- `problem1.py`
- `new_file.sql`

### Code Standards

**Python:**
- Follow PEP 8 style guide
- Use meaningful variable names
- Include type hints where appropriate
- Add docstrings

**SQL:**
- Use consistent indentation (2 or 4 spaces)
- Use UPPER CASE for SQL keywords
- Add comments for complex queries

### Commit Messages

Good format:
```
Add solution for LeetCode Problem #{number} - {Problem Name}

- Category: [SQL/Python/DSA/ML]
- Difficulty: [Easy/Medium/Hard]
- Time Complexity: O(...)
- Space Complexity: O(...)
```

Example:
```
Add solution for LeetCode Problem #1 - Two Sum

- Category: Python
- Difficulty: Easy
- Time Complexity: O(n)
- Space Complexity: O(n)
```

## Useful Commands

```bash
# Check status of your changes
git status

# See what you changed
git diff

# View commit history
git log --oneline

# Create a new branch for a feature
git checkout -b add/problem-number-name

# Update your local repository
git pull origin main

# Undo changes to a file
git checkout -- filename

# Remove a file from staging
git reset HEAD filename
```

## Testing Your Solutions

### Python Solutions
```bash
# Run a single solution file
python Python/Easy/1_two_sum.py

# Run all tests in a category
cd Python/Easy && for f in *.py; do python "$f"; done
```

### SQL Solutions
Use an online SQL executor:
- [LeetCode SQL IDE](https://leetcode.com)
- [SQL Fiddle](http://www.sqlfiddle.com/)
- [DB Fiddle](https://www.db-fiddle.com/)

## Updating Repository Statistics

After adding solutions, update the main [README.md](README.md):

```markdown
## 📊 Statistics

- **SQL**: 5 solutions
- **Python**: 10 solutions
- **DSA**: 20 solutions
- **ML**: 3 solutions

**Total**: 38 solutions
```

## Syncing with GitHub

### Initial Push (First Time)

```bash
git remote add origin https://github.com/yourusername/LeetCode-Solutions.git
git branch -M main
git push -u origin main
```

### Regular Pushes

```bash
git add .
git commit -m "Your commit message"
git push origin main
```

## Troubleshooting

### Issue: Changes not appearing on GitHub
```bash
# Make sure you've committed
git status

# Check if you've pushed
git log --oneline origin/main

# Force push (use with caution)
git push -u origin main --force
```

### Issue: Merge conflicts
```bash
# Pull latest changes
git pull origin main

# Fix conflicts in your editor
# Then:
git add .
git commit -m "Resolve merge conflicts"
git push origin main
```

## Resources

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Help](https://docs.github.com/)
- [LeetCode](https://leetcode.com)
- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/)

## Next Steps

1. Read [GUIDELINES.md](GUIDELINES.md) for detailed formatting
2. Check out category-specific README files
3. Start solving problems!
4. Make regular commits

---

Happy problem solving! 🚀
