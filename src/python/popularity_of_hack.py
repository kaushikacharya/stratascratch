# Import your libraries
import pandas as pd

# Start writing code
# facebook_employees.head()

merge_df = facebook_hack_survey[["employee_id","popularity"]].merge(facebook_employees[["id","location"]], left_on="employee_id", right_on="id", how="inner")[["location","popularity"]]
merge_df.groupby(by="location",as_index=True).mean().reset_index()
