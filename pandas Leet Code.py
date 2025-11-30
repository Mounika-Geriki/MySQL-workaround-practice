## pandas Leet Code

#1) ##2877. Create a DataFrame from List
import pandas as pd
from typing import List

def createDataframe(student_data: List[List[int]]) -> pd.DataFrame:
    return pd.DataFrame(student_data, columns=["student_id","age"])

#2) ###2878. Get the Size of a DataFrame
## gives number of columns and rows
import pandas as pd
from typing import List

def getDataframeSize(players: pd.DataFrame) -> List[int]:
    return [players.shape[0], players.shape[1]]
# Output:[10, 5]
# Explanation:This DataFrame contains 10 rows and 5 columns.


#3) ## 2879. Display the First Three Rows
import pandas as pd

def selectFirstRows(employees: pd.DataFrame) -> pd.DataFrame:
    return employees.head(3)

#4) 2880. Select Data
import pandas as pd

def selectData(students: pd.DataFrame) -> pd.DataFrame:
    return students[students["student_id"] == 101][["name", "age"]]

#5) 