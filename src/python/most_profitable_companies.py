# Import your libraries
import pandas as pd

# Start writing code
# forbes_global_2010_2014.head()

forbes_global_2010_2014.sort_values(by="profits",ascending=False).reset_index(drop=True).loc[:2,["company","profits"]]

# forbes_global_2010_2014.sort_values(by="profits",ascending=False)[["company","profits"]].head(3)
