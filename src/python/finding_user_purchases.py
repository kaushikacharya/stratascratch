# Import your libraries
import pandas as pd

# Start writing code
# amazon_transactions.head()

amazon_transactions.groupby(by="user_id").filter(lambda x: x["created_at"].sort_values().diff().dt.days.min() <= 7)["user_id"].unique()
