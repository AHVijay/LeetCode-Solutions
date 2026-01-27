"""
1) Problem: Empirical Probability Mass Function (PMF)
Deep-ML: https://www.deep-ml.com/problems/184
Difficulty: Easy


Description:

Given a list of integer samples drawn from a discrete distribution, implement a function to compute the empirical Probability Mass Function (PMF). 
The function should return a list of (value, probability) pairs sorted by the value in ascending order. 
If the input is empty, return an empty list.

Examples:
Input:
samples = [1, 2, 2, 3, 3, 3]
Output:
[(1, 0.16666666666666666), (2, 0.3333333333333333), (3, 0.5)]

Approach:
My approach is to first count the frequency of each value in the list. 
Then, I divide the frequency of each value by the total number of samples to get the probability.

Time Complexity: O(...)
Space Complexity: O(...)
"""

from collections import Counter

def pmf(samples: list[int]) -> list[tuple[int, float]]:
    if not samples:
        return []
    
    count = Counter(samples)
    total = len(samples)

    return sorted((value, count / total) for value, count in count.items())

# Test cases
assert pmf([1, 2, 2, 3, 3, 3]) == [(1, 0.16666666666666666), (2, 0.3333333333333333), (3, 0.5)]
assert pmf([]) == []


"""
2) Problem: Poisson Distribution Probability Calculator
Deep-ML: https://www.deep-ml.com/problems/81
Difficulty: Easy


Description:

Write a Python function to calculate the probability of observing exactly k events in a fixed interval using the Poisson distribution formula.
The function should take k (number of events) and lam (mean rate of occurrences) as inputs and return the probability rounded to 5 decimal places.

Examples:
Input:
k = 3, lam = 5
Output:
0.14037

Approach:
My approach is to use the Poisson distribution formula to calculate the probability.


Time Complexity: O(...)
Space Complexity: O(...)
"""

import math

def poisson_probability(k: int, lam: float) -> float:
    """
    Calculate the probability of observing exactly k events
    using the Poisson distribution.

    Args:
        k: Number of events
        lam: Mean rate of occurrences

    Returns:
        Probability rounded to 5 decimal places
    """
    probability = (math.exp(-lam) * lam ** k) / math.factorial(k)
    return round(probability, 5)

# Test cases
assert poisson_probability(3, 5) == 0.14037
assert poisson_probability(0, 2) == 0.13534


"""
3) Problem: Calculate Conditional Probability from Data
Deep-ML: https://www.deep-ml.com/problems/168
Difficulty: Easy


Description:

Given a dataset of observations as a list of tuples, each tuple is of the form (X, Y), 
where X and Y are categorical variables (e.g., color, animal). Implement a function to compute the conditional probability 
P(Y=y∣X=x), the probability that Y equals a specific value y, given that X equals a specific value x.

Your Task: Write a function conditional_probability(data, x, y) that takes as input:

data: List of (X, Y) tuples.
x: Value for variable X to condition on.
y: Value for variable Y whose probability you want given X=x.
The function should return the probability 

P(Y=y∣X=x). Return 0.0 if there are no instances where X=x.

Examples:
data = [
    ('red', 'cat'),
    ('blue', 'dog'),
    ('red', 'dog'),
    ('red', 'cat'),
    ('blue', 'cat'),
    ('red', 'dog')
]
print(conditional_probability(data, 'red', 'cat'))   # 0.5
print(conditional_probability(data, 'blue', 'cat'))  # 0.5
print(conditional_probability(data, 'green', 'cat')) # 0.0

Approach:
My approach is to first count the number of times x appears in the data. 
Then, I count the number of times y appears in the data when x is also present. 
Then, I divide the number of times y appears when x is present by the number of times x appears.

Time Complexity: O(...)
Space Complexity: O(...)
"""

def conditional_probability(data, x, y):

    count_x = 0
    count_x_y = 0

    for x_val, y_val in data:
      if x_val == x:
        count_x += 1
        if y_val == y:
          count_x_y += 1

    if count_x == 0:
      return 0.0

    return round((count_x_y / count_x),4)


"""
4) Problem: Expected value and Variance of an n-sided die
Deep-ML: https://www.deep-ml.com/problems/179
Difficulty: Easy


Description:

Write a Python function that computes the expected value and variance of a fair n-sided die roll. 
The die has faces numbered 1 through n, each equally likely. The function should return a tuple (expected_value, variance).

Examples:
Input:
dice_statistics(6)
Output:
(3.5, 2.9167)

Approach:
My approach is to first calculate the expected value of the die. 
Then, I calculate the variance of the die.


Time Complexity: O(...)
Space Complexity: O(...)
"""

def dice_statistics(n: int) -> tuple[float, float]:
   
   expected_value = (n + 1) / 2
   variance = (n **2 - 1) / 12

   return (expected_value, variance)


"""
5) Problem: Sampling Distribution of the Mean
Deep-ML: https://www.deep-ml.com/problems/181
Difficulty: Easy


Description:

Write a Python function that demonstrates the sampling distribution of the mean. 
The function should take as input the number of samples, the sample size, and the distribution type ('uniform' or 'exponential'). 
It should return the mean of the sample means.

Requirements
For 'uniform': Draw from Uniform(0, 1) using np.random.uniform(0, 1, sample_size)
For 'exponential': Draw from Exponential with scale=1 using np.random.exponential(1, sample_size)
Generate num_samples independent samples, each of size sample_size
Compute the mean of each sample, then return the mean of all sample means

Examples:
Input:
simulate_clt(num_samples=1000, sample_size=30, distribution='uniform')
Output:
0.4996

Approach:
My approach is to first generate the number of samples with the given sample size and distribution. 
Then, I calculate the mean of each sample. 


Time Complexity: O(...)
Space Complexity: O(...)
"""

import numpy as np

def simulate_clt(num_samples: int, sample_size: int, distribution: str = 'uniform') -> float:

    if num_samples <= 0 or sample_size <= 0:
        raise ValueError("num_samples and sample_size must be positive")

    sample_means = []

    for _ in range(num_samples):
        if distribution == "uniform":
            sample = np.random.uniform(0, 1, sample_size)
        elif distribution == "exponential":
            sample = np.random.exponential(1, sample_size)
        else:
            raise ValueError("distribution must be 'uniform' or 'exponential'")

        sample_means.append(sample.mean())

    return float(np.mean(sample_means))