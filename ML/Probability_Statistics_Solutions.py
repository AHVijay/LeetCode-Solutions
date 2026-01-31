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


"""
6) Problem: Compute posterior probability using Bayes' Theorem
Deep-ML: https://www.deep-ml.com/problems/336
Difficulty: Easy


Description:

Implement a function that calculates posterior probabilities for multiple hypotheses given observed evidence using Bayes' Theorem. 
Given a list of prior probabilities P(H_i) for each hypothesis and a list of likelihoods P(E|H_i) representing the probability of observing the evidence under each hypothesis, 
compute the posterior probabilities P(H_i|E) for all hypotheses. The priors list contains the initial belief in each hypothesis before observing evidence, 
and the likelihoods list contains the probability of the observed evidence assuming each hypothesis is true. The function should return a list of posterior probabilities that sum to 1.

Examples:
Input:
priors = [0.01, 0.99], likelihoods = [0.95, 0.05]
Output:
[0.161, 0.839]

Approach:
My approach is to first calculate the evidence P(E) using the prior probabilities and likelihoods. 
Then, I calculate the posterior probabilities using Bayes' Theorem.


Time Complexity: O(...)
Space Complexity: O(...)
"""

def bayes_theorem(priors: list[float], likelihoods: list[float]) -> list[float]:
	
    if not priors or not likelihoods:
        return []

    if len(priors) != len(likelihoods):
        raise ValueError("priors and likelihoods must have the same length")

    unnormalized = [
        p * l for p, l in zip(priors, likelihoods)
    ]

    evidence = sum(unnormalized)

    if evidence == 0:
        raise ValueError("Total evidence probability is zero")

    return [u / evidence for u in unnormalized]


"""
7) Problem: Binomial Distribution Probability
Deep-ML: https://www.deep-ml.com/problems/79
Difficulty: Medium


Description:

Write a Python function to calculate the probability of achieving exactly k successes in n independent Bernoulli trials, 
each with probability p of success, using the Binomial distribution formula.

Examples:
Input:
n = 6, k = 2, p = 0.5
Output:
0.23438

Approach:
My approach is to first calculate the binomial coefficient. 
Then, I calculate the probability of k successes and n-k failures. 
Then, I multiply the binomial coefficient by the probability of k successes and n-k failures.

Formula: 
P(X = k) = (n choose k) * p^k * (1-p)^(n-k)


Time Complexity: O(...)
Space Complexity: O(...)
"""


import math

def binomial_probability(n: int, k: int, p: float) -> float:

    if not 0 <= p <= 1:
        raise ValueError("p must be between 0 and 1")

    if k < 0 or k > n:
        return 0.0

    coefficient = math.comb(n, k)
    return coefficient * (p ** k) * ((1 - p) ** (n - k))


"""
8) Problem: Normal Distribution PDF Calculator
Deep-ML: http://deep-ml.com/problems/80
Difficulty: Medium


Description:

Write a Python function to calculate the probability density function (PDF) of the normal distribution for a given value, mean, and standard deviation. 
The function should use the mathematical formula of the normal distribution to return the PDF value rounded to 5 decimal places.

Examples:
Input:
x = 16, mean = 15, std_dev = 2.04
Output:
0.17342

Approach:
My approach is to use the scipy.stats.norm.pdf() function to calculate the PDF value.

Formula: 
P(X = k) = (n choose k) * p^k * (1-p)^(n-k)


Time Complexity: O(...)
Space Complexity: O(...)
"""

import numpy as np
from scipy.stats import norm

def normal_pdf(x: float, mean: float, std_dev: float) -> float:
    return round(norm.pdf(x, mean, std_dev), 5)


"""
9) Problem: Simulate Markov Chain
Deep-ML: https://www.deep-ml.com/problems/132
Difficulty: Medium


Description:

Implement a function to simulate a Markov Chain. The function should take a 2D numpy array representing the transition matrix
(where each row sums to 1), an integer for the initial state index, and an integer for the number of steps to simulate. 
It should return a numpy array containing the sequence of state indices over time, 
including the initial state. Use numpy for array operations and random selections.

Examples:
Input:
transition_matrix = np.array([[0.8, 0.2], [0.3, 0.7]]); print(simulate_markov_chain(transition_matrix, 0, 3))
Output:
[0 0 1 1]

Approach:
My approach is to select the next state based on the current state and the transition matrix.


Time Complexity: O(...)
Space Complexity: O(...)
"""

import numpy as np
def simulate_markov_chain(transition_matrix, initial_state, num_steps):
    if num_steps < 0:
        raise ValueError("steps must be non-negative")

    num_states = transition_matrix.shape[0]
    states = np.empty(num_steps + 1, dtype=int)
    states[0] = initial_state

    current_state = initial_state

    for i in range(1, num_steps + 1):
        current_state = np.random.choice(
            num_states,
            p=transition_matrix[current_state]
        )
        states[i] = current_state

    return states


"""
10) Problem: Calculate KL Divergence Between Two Multivariate Gaussian Distributions
Deep-ML: https://www.deep-ml.com/problems/136
Difficulty: Medium


Description:

KL divergence measures the dissimilarity between two probability distributions. 
In this problem, you'll implement a function to compute the KL divergence between two multivariate Gaussian distributions given their means and covariance matrices. 
Use the provided mathematical formulas and numerical considerations to ensure accuracy.

Examples:
Input:
mu_p, Cov_p, mu_q, Cov_q for two random multivariate Gaussians
Output:
A float representing the KL divergence

Approach:
My approach is to use the formula for KL divergence between two multivariate Gaussian distributions.


Time Complexity: O(...)
Space Complexity: O(...)
"""

import numpy as np

def multivariate_kl_divergence(mu_p: np.ndarray, Cov_p: np.ndarray, mu_q: np.ndarray, Cov_q: np.ndarray) -> float:
    mu_p = np.asarray(mu_p)
    mu_q = np.asarray(mu_q)
    Cov_p = np.asarray(Cov_p)
    Cov_q = np.asarray(Cov_q)

    d = mu_p.shape[0]

    Cov_q_inv = np.linalg.inv(Cov_q)

    sign_q, logdet_q = np.linalg.slogdet(Cov_q)
    sign_p, logdet_p = np.linalg.slogdet(Cov_p)

    if sign_q <= 0 or sign_p <= 0:
        raise ValueError("Covariance matrices must be positive definite")

    log_det_term = logdet_q - logdet_p
    trace_term = np.trace(Cov_q_inv @ Cov_p)

    mean_diff = mu_q - mu_p
    mahalanobis_term = mean_diff.T @ Cov_q_inv @ mean_diff

    kl = 0.5 * (log_det_term - d + trace_term + mahalanobis_term)

    return float(kl)


"""
11) Problem: Chi-square Probability Distribution
Deep-ML: https://www.deep-ml.com/problems/176
Difficulty: Medium


Description:

Calculate the probability of occurrence of x in a Chi-Squared distribution with the given sample value 'x' and degrees of freedom 'k'.

Examples:
Input:
x = 2, k = 2
Output:
0.184

Approach:
My approach is to use the scipy.stats.chi2.pdf() function to calculate the PDF value.


Time Complexity: O(...)
Space Complexity: O(...)
"""

import math

def chi_square_probability(x, k):
    return round((x ** (k / 2 - 1) * math.exp(-x / 2)) / (2 ** (k / 2) * math.gamma(k / 2)), 3)


"""
12) Problem: Conditional Probability from Joint Distribution
Deep-ML: https://www.deep-ml.com/problems/180
Difficulty: Medium


Description:

Write a Python function that computes the conditional probability P(A|B), 
given a joint probability distribution over events A and B. 
The distribution is provided as a dictionary with keys ('A','B'), ('A','B'), ('A','B'), ('A','B'), 
where the backtick ` denotes logical NOT.

Examples:
Input:
conditional_probability({('A','B'):0.2, ('A','`B'):0.3, ('`A','B'):0.1, ('`A','`B'):0.4})
Output:
0.6667

Approach:
My approach is to use the formula for conditional probability.


Time Complexity: O(...)
Space Complexity: O(...)
"""

def conditional_probability(joint_distribution: dict) -> float:
	
	# Your code here
    P_A_and_B = joint_distribution[('A', 'B')]
    P_B = (
        joint_distribution[('A', 'B')]
        + joint_distribution[('`A', 'B')]
    )
    return P_A_and_B / P_B


"""
13) Problem: Central Limit Theorem Simulation
Deep-ML: https://www.deep-ml.com/problems/182
Difficulty: Medium


Description:

Write a Python function to demonstrate the Central Limit Theorem (CLT). 
Your function should draw many samples from a chosen distribution, 
compute their sample means, standardize them to Z-scores, and return the mean and standard deviation of these standardized values. 
The implementation should handle at least the following distributions: Uniform(0,1), Exponential(scale=1.0), and Bernoulli(p=0.3).

Examples:
Input:
simulate_clt('exponential', n=30, runs=10000, seed=42)
Output:
{'mean': -0.003, 'std': 1.002}

Approach:
My approach is to first generate the number of samples with the given sample size and distribution. 
Then, I calculate the mean of each sample. Then, I standardize the mean of each sample. 
Finally, I calculate the mean and standard deviation of the standardized values.


Time Complexity: O(...)
Space Complexity: O(...)
"""

import numpy as np

def simulate_clt(distribution: str, n: int, runs: int = 10000, seed: int = 42) -> dict:

    import numpy as np

def simulate_clt(
    distribution: str,
    n: int,
    runs: int = 10000,
    seed: int = 42
) -> dict:
    if n <= 0 or runs <= 0:
        raise ValueError("n and runs must be positive")

    np.random.seed(seed)

    if distribution == "uniform":
        mu = 0.5
        sigma = np.sqrt(1 / 12)
        samples = np.random.uniform(0, 1, size=(runs, n))

    elif distribution == "exponential":
        mu = 1.0
        sigma = 1.0
        samples = np.random.exponential(1.0, size=(runs, n))

    elif distribution == "bernoulli":
        p = 0.3
        mu = p
        sigma = np.sqrt(p * (1 - p))
        samples = np.random.binomial(1, p, size=(runs, n))

    else:
        raise ValueError("Unsupported distribution")

    sample_means = samples.mean(axis=1)
    z_scores = (sample_means - mu) / (sigma / np.sqrt(n))

    return {
        "mean": float(np.mean(z_scores)),
        "std": float(np.std(z_scores, ddof=1))
    }
