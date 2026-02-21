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