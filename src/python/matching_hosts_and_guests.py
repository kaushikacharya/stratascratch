# Import your libraries
import pandas as pd

# Start writing code
# airbnb_hosts.head()

pd.merge(left=airbnb_hosts, right=airbnb_guests, how="inner", on=["nationality", "gender"])[["host_id", "guest_id"]].drop_duplicates()
