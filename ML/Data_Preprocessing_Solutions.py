"""
1) Problem: Min-Max Scaling of Features
Deep-ML: https://www.deep-ml.com/problems/112
Difficulty: Easy
Topics: [List 2-3 main topics]

Description:
Implement a function that performs Min-Max Normalization on a list of integers,scaling all values according to the formula. 
Min-Max normalization helps ensure that all features contribute equally to a model by scaling them to a common range.

Examples:
Input:
    min_max([1, 2, 3, 4, 5])
Output:
    [0.0, 0.25, 0.5, 0.75, 1.0]

Approach:
My approach is to first find the minimum and maximum values in the list. 
Then, I subtract the minimum value from each value in the list and divide by the range of the list.

Why this approach? What's the key insight?
This approach is simple and easy to understand. It is also very efficient as it only requires two passes over the data.

Time Complexity: O(...)
Space Complexity: O(...)
"""


def min_max(x: list[float]) -> list[float]:
    """
    Perform Min-Max normalization to scale values to [0, 1].
    
    Args:
        x: A list of numerical values
    
    Returns:
        A new list with values normalized to [0, 1]
    """
    # Your code here
    if not x:
        return []

    min_val = min(x)
    max_val = max(x)

    if min_val == max_val:
        return [0.0] * len(x)

    range_val = max_val - min_val
    
    return [(value - min_val) / range_val for value in x]

# Test cases
assert min_max([1, 2, 3, 4, 5]) == [0.0, 0.25, 0.5, 0.75, 1.0]
assert min_max([10, 20, 30]) == [0.0, 0.5, 1.0]


"""
2) Problem: Min-Max Scaling of Features
Deep-ML: https://www.deep-ml.com/problems/112
Difficulty: Easy
Topics: [List 2-3 main topics]

Description:
Implement a function that performs Min-Max Normalization on a list of integers,scaling all values according to the formula. 
Min-Max normalization helps ensure that all features contribute equally to a model by scaling them to a common range.

Examples:
Input:
    min_max([1, 2, 3, 4, 5])
Output:
    [0.0, 0.25, 0.5, 0.75, 1.0]

Approach:
[Your approach in 2-3 sentences]
[Why this approach? What's the key insight?]

Time Complexity: O(...)
Space Complexity: O(...)
"""