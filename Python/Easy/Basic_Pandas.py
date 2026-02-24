"""
1. Problem: Create a DataFrame from List
LeetCode: https://leetcode.com/problems/create-a-dataframe-from-list/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Difficulty: Easy
Topics: Pandas, DataFrame

Description:
Write a solution to create a DataFrame from a 2D list called student_data. This 2D list contains the IDs and ages of some students.
The DataFrame should have two columns, student_id and age, and be in the same order as the original 2D list.


Approach:
Use the DataFrame constructor from the pandas library to create a DataFrame from the 2D list. The columns parameter is used to specify the column names.

Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd
from typing import List
def createDataframe(student_data: List[List[int]]) -> pd.DataFrame:
    column_names = ['student_id', 'age']
    return pd.DataFrame(student_data, columns = column_names)
    

"""
2. Problem: Get the Size of a DataFrame
LeetCode: https://leetcode.com/problems/get-the-size-of-a-dataframe/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Difficulty: Easy
Topics: Pandas, DataFrame

Description:
Write a solution to calculate and display the number of rows and columns of players.
Return the result as an array:
[number of rows, number of columns]

Approach:
Use the shape attribute of the DataFrame to get the number of rows and columns.

Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd

def getDataframeSize(players: pd.DataFrame) -> List[int]:
    row, col = players.shape
    return [row, col]

"""
3. Problem: Display the first 3 rows
LeetCode: https://leetcode.com/problems/display-the-first-three-rows/description/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Difficulty: Easy
Topics: Pandas, DataFrame

Description:
Write a solution to display the first 3 rows of this DataFrame.

Approach:


Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd

def selectFirstRows(employees: pd.DataFrame) -> pd.DataFrame:
    return employees.head(3)

"""
4. Problem: Select Data
LeetCode: https://leetcode.com/problems/select-data/description/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Topics: Pandas, DataFrame

Description:
Write a solution to select the name and age of the student with student_id = 101.

Approach:


Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd

def selectData(students: pd.DataFrame) -> pd.DataFrame:
    return students.loc[students['student_id'] == 101, ['name', 'age']]

"""
5. Problem: Create a new column
LeetCode: https://leetcode.com/problems/create-a-new-column/description/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Topics: Pandas, DataFrame

Description:
A company plans to provide its employees with a bonus.
Write a solution to create a new column name bonus that contains the doubled values of the salary column.

Approach:
Use the assign method of the DataFrame to create a new column.

Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd

def createBonusColumn(employees: pd.DataFrame) -> pd.DataFrame:
    employees['bonus'] = employees['salary'] * 2
    return employees


"""
6. Problem: Drop Duplicate Rows
LeetCode: https://leetcode.com/problems/drop-duplicate-rows/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Topics: Pandas, DataFrame

Description:
There are some duplicate rows in the DataFrame based on the email column.
Write a solution to remove these duplicate rows and keep only the first occurrence.

Approach:
Use the drop_duplicates method of the DataFrame to remove duplicate rows.

Time Complexity: O(n)
Space Complexity: O(n)
"""


import pandas as pd

def dropDuplicateEmails(customers: pd.DataFrame) -> pd.DataFrame:
     return customers.drop_duplicates(subset="email", keep="first")


"""
7. Problem: Drop Missing Data
LeetCode: https://leetcode.com/problems/drop-missing-data/description/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Topics: Pandas, DataFrame

Description:
There are some rows having missing values in the name column.
Write a solution to remove the rows with missing values.

Approach:
Use the dropna method of the DataFrame to remove rows with missing values.

Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd

def dropMissingData(students: pd.DataFrame) -> pd.DataFrame:
    return students.dropna(subset=['name'])


"""
8. Problem: Modify Column
LeetCode: https://leetcode.com/problems/modify-columns/description/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Topics: Pandas, DataFrame

Description:
A company intends to give its employees a pay rise.
Write a solution to modify the salary column by multiplying each salary by 2.

Approach:
Use the assign method of the DataFrame to modify the salary column.

Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd

def modifySalaryColumn(employees: pd.DataFrame) -> pd.DataFrame:
     employees['salary'] = employees['salary'] * 2
     return employees


"""
9. Problem: Rename Columns
LeetCode: https://leetcode.com/problems/rename-columns/description/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Topics: Pandas, DataFrame

Description:
Write a solution to rename the columns as follows:

id    to student_id
first to first_name
last  to last_name
age   to age_in_years

Approach:
Use the rename method of the DataFrame to rename the columns.

Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd

def renameColumns(students: pd.DataFrame) -> pd.DataFrame:
    students = students.rename(columns={'id': 'student_id',
                                        'first': 'first_name',
                                        'last': 'last_name',
                                        'age': 'age_in_years'})
    return students


"""
10. Problem: Change Data Type
LeetCode: https://leetcode.com/problems/change-data-type/description/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Topics: Pandas, DataFrame

Description:
Write a solution to correct the errors:
The grade column is stored as floats, convert it to integers.

Approach:
Use the astype method of the DataFrame to convert the grade column to integers.

Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd

def changeDatatype(students: pd.DataFrame) -> pd.DataFrame:
    students['grade'] = students['grade'].astype('int64')
    return students


"""
11. Problem: Fill Missing Data
LeetCode: https://leetcode.com/problems/fill-missing-data/description/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Topics: Pandas, DataFrame

Description:
Write a solution to fill in the missing value as 0 in the quantity column.
Approach:
Use the fillna method of the DataFrame to fill the missing values.

Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd

def fillMissingValues(products: pd.DataFrame) -> pd.DataFrame:
    products['quantity'] = products['quantity'].fillna(0)
    return products


"""
12. Problem: Reshape Data Concatenate
LeetCode: https://leetcode.com/problems/reshape-data-concatenate/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Topics: Pandas, DataFrame

Description:
Write a solution to concatenate these two DataFrames vertically into one DataFrame.

Approach:
Use the concat method of the pandas library to concatenate the two DataFrames.

Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd

def concatenateTables(df1: pd.DataFrame, df2: pd.DataFrame) -> pd.DataFrame:
    return pd.concat([df1, df2])


"""
13. Problem: Reshape Data Pivot
LeetCode: https://leetcode.com/problems/reshape-data-pivot/description/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Topics: Pandas, DataFrame

Description:
Write a solution to pivot the data so that each row represents temperatures for a specific month, and each city is a separate column.

Approach:
Use the pivot method of the DataFrame to pivot the data.

Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd

def pivotTable(weather: pd.DataFrame) -> pd.DataFrame:
    return weather.pivot(index='month', columns='city', values='temperature')


"""
14. Problem: Reshape Data Melt
LeetCode: https://leetcode.com/problems/reshape-data-melt/description/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Topics: Pandas, DataFrame

Description:
Write a solution to reshape the data so that each row represents sales data for a product in a specific quarter.

Approach:
Use the melt method of the DataFrame to reshape the data.

Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd

def meltTable(report: pd.DataFrame) -> pd.DataFrame:
    return pd.melt(report, 
                   id_vars='product', 
                   var_name='quarter', 
                   value_name='sales')


"""
15. Problem: Method Chaining
LeetCode: https://leetcode.com/problems/method-chaining/description/?envType=study-plan-v2&envId=introduction-to-pandas&lang=pythondata
Topics: Pandas, DataFrame

Description:
Write a solution to list the names of animals that weigh strictly more than 100 kilograms.
Return the animals sorted by weight in descending order.

Approach:
Use the query method of the DataFrame to filter the data.
Use the sort_values method of the DataFrame to sort the data.

Time Complexity: O(n)
Space Complexity: O(n)
"""

import pandas as pd

def findHeavyAnimals(animals: pd.DataFrame) -> pd.DataFrame:
    return animals.loc[animals['weight'] > 100].sort_values(by='weight', ascending=False)[['name']]

# or

    return animals.query('weight > 100').sort_values(by='weight', ascending=False)[['name']]


"""
16. Problem: Check the status
GeeksForGeeks: https://www.geeksforgeeks.org/problems/check-the-status/1?page=1&category=python&sortBy=submissions

Description:
Given two integer variables a and b, and a boolean variable flag. The task is to check the status and return accordingly.
Return True for the following cases:

Either a or b (not both) is non-negative and the flag is false.
Both a and b are negative and the flag is true.

Approach:
1) Use if-else to check the status.

Time Complexity: O(1)
Space Complexity: O(1)
"""
class Solution:
    def checkStatus(self, a, b, flag):
        # code here
        if flag:
            return a<0 and b<0
        else: 
            return (a>=0) ^ (b>=0)
        

"""
17. Problem: Mark Even and Odd
GeeksForGeeks: https://www.geeksforgeeks.org/problems/mark-even-and-odd/1?page=1&category=python&sortBy=submissions

Description:
Given a positive integer x. Your task is to check, if it is even or 
odd (Any number that gives zero as remainder when divided by 2 is an even number).
Note: Return "Even" if the number is even; otherwise, return "Odd".

Approach:
1) Use if-else to check the status.

Time Complexity: O(1)
Space Complexity: O(1)
"""

def checkOddEven(self, x):
    # Code here
    if x % 2 == 0:
        return "Even"
    else:
        return "Odd"
    

"""
18. Problem: The FizzBuzz
GeeksForGeeks: https://www.geeksforgeeks.org/problems/the-fizzbuzz-program/1?page=1&category=python&sortBy=submissions

Description:
You are given a number  and you have to print your answer according to the following:
If the number is divisible by 3, you print "Fizz" (without quotes)
If the number is divisible by 5, you print "Buzz" (without quotes)
If the number is divisible by both 3 and 5, you print "FizzBuzz" (without quotes)
In any other case, you print the number itself

Note: You should add a newline character after print() statement.

Approach:
1) Use if-elif-else to check the status.

Time Complexity: O(1)
Space Complexity: O(1)
"""

def fizzBuzz(number):
    # Write your code here.
    if number % 15 == 0:
        print("FizzBuzz")
    elif number % 3 == 0:
        print("Fizz")
    elif number % 5 == 0:
        print("Buzz")
    else:
        print(number)


"""
19. Problem: If conditional statement
GeeksForGeeks: https://www.geeksforgeeks.org/problems/if-loop-python/1?page=1&category=python&sortBy=submissions

Description:
There are two friends, John and Smith, and the parameters j_angry and s_angry to indicate if each is angry. You are in trouble if both of them are angry or no one of them is angry.

Now, complete the function which returns true if you are in trouble, else return false

Example 1:

Input:
j_angry = True, s_angry = True
Output:
True
Explanation:
Since both of them are angry, you are in trouble.
Example 2:

Input:
j_angry = True, s_angry = False
Output:
False
Explanation:
Only one of them is angry, you are not in trouble.

Approach:
1) Use if-elif-else to check the status.

Time Complexity: O(1)
Space Complexity: O(1)
"""

def friends_in_trouble(j_angry, s_angry):
    if (j_angry == True and s_angry == True) or (j_angry == False and s_angry == False):
        return 'True'
    else:
        return 'False'
    

"""
20. Problem: Zero Converter
GeeksForGeeks: https://www.geeksforgeeks.org/problems/zero-converter-python/1?page=1&category=python&sortBy=submissions

Description:
You are given a number n. The number n can be negative or positive. If n is negative, print numbers from n to 0 by adding 1 to n in the neg function. If positive, print numbers from n-1 to 0 by subtracting 1 from n in the pos function.

Note:- You don't have to return anything, you just have to print the array.

Example 1:
Input:
n = 4
Output:
3 2 1 0

Example 2:
Input:
n = -3
Output:
-3 -2 -1 0

Approach:
1) Use while loop to print the numbers.

Time Complexity: O(|n|)
Space Complexity: O(1)
"""

def pos(n):
    ## Write the code
    i = n - 1
    while i >= 0:
        print(i, end =" ")
        i -= 1
           
    
def neg(n):
    ##Write the code
    i = n
    while i <= 0:
        print(i, end =" ")
        i += 1

"""
21. Problem: Jumping through While
GeeksForGeeks: https://www.geeksforgeeks.org/problems/jumping-through-while-python/1?page=1&category=python&sortBy=submissions

Description:
Given a positive integer x, the task is to print the numbers from 1 to x in the order as 12, 22, 32, 42, 52, ... (in increasing order).

Example:

Input: x = 10
Output: 1 4 9
Explanation:From 1 to 10, numbers in powers of 2 are, 12, 22, 32 as 1, 4 and 9.
Constraints:
2 <= x <= 103

Approach:
1) Use while loop to print the numbers.
2) Use i**2 <= x to check if the number is less than or equal to x.

Time Complexity: O(√x)
Space Complexity: O(1)
"""

def printIncreasingPower(x):

    i = 1
    # Loop to jump in powers of 2
    while(i**2 <= x):
        
        print (i**2 , end = " ")
        i += 1

"""
22. Problem: For Loop
GeeksForGeeks: https://www.geeksforgeeks.org/problems/for-loop-python/1?page=1&category=python&sortBy=submissions

Description:

Writing for loop in Python is a tad different from C++ and Java counterparts. In this question, we'll learn to print table by using the for loop.
You are given a number N, you need to print its multiplication table.

Note: Please go through the range function to understand why it's useful in for loops.

Example:

Example 1:
Input:
N = 5
Output:
5 10 15 20 25 30 35 40 45 50

Example 2:
Input:
N = 6
Output:
6 12 18 24 30 36 42 48 54 60

Approach:
1) Use for loop to print the numbers.

Time Complexity: O(10)
Space Complexity: O(1)
"""

def MutliplicationTable(N):

    for i in range(1, 11):
        print(N * i, end = " ")


"""
23. Problem: The FizzBuzz Program
GeeksForGeeks: https://www.geeksforgeeks.org/problems/the-fizzbuzz-program--125723/1?page=1&category=python&sortBy=submissions

Description:

You are given a number a and you have to print your answer according to the following:

If the number is divisible by 3, you print "Fizz" (without quotes)
If the number is divisible by 5, you print "Buzz" (without quotes)
If the number is divisible by both 3 and 5, you print "FizzBuzz" (without quotes)
In any other case, you print the number itself

Note: You should add a new-line character after print statement.

Examples:

Input: a = 3
Output: Fizz
Explanation: Here, the number is divisible by 3, so Fizz is printed.

Input: a = 5
Output: Buzz
Explanation: Here the number is divisible by 5, so Buzz is printed.

Input: a = 15
Output: FizzBuzz
Explanation: Here, the number 15 is divisible by both 3 and 5, so FizzBuzz is printed.

Approach:
1) Use if-elif-else to check the status.

Time Complexity: O(10)
Space Complexity: O(1)
"""

a = int(input())
if a % 3 == 0 and a % 5 == 0:
    print("FizzBuzz")
elif a % 3 == 0:
    print("Fizz")
elif a % 5 == 0:
    print("Buzz")
else:
    print(a)

"""
24. Problem: Calculator
GeeksForGeeks: https://www.geeksforgeeks.org/problems/calculator/1?page=1&category=python&sortBy=submissions

Description:

Given two numbers a and b; you need to perform basic mathematical operation on them. You will be provided an integer named as operator. 
If operator equals to 1 add a and b, then print the result as a string.
If operator equals to 2 subtract b from a, then print the result as a string.
If operator equals to 3 multiply a and b, then print the result as a string.
If operator equals to any another number, print "Invalid Input"(without quotes).
Note: Do not add a new line at the end

Examples:

Input: a = 1, b = 2, opr = 3
Output: 2
Explanation: 1 * 2 = 2
Input: a = 2, b = 2, opr = 2
Output: 0
Explanation: 2 - 2 = 0

Approach:
1) Use if-elif-else to check the status.

Time Complexity: O(1)
Space Complexity: O(1)
"""

def utility(a, b, opr):
    #code here
    if opr == 1:
        print(a + b, end = " ")
    elif opr == 2:
        print(a - b,end = " ")
    elif opr == 3:
        print(a * b,end = " ")
    else:
        print("Invalid Input", end = " ")