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