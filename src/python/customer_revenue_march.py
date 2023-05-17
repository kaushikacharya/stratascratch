# Import your libraries
import pandas as pd
from datetime import datetime

# Start writing code
# orders.head()

march_2019_orders = orders.loc[(orders["order_date"].dt.month == 3) & (orders["order_date"].dt.year == 2019), ["cust_id","total_order_cost"]]
# Alternative approach for the date range criteria
# march_2019_orders = orders.loc[(datetime(2019,3,1) <= orders["order_date"]) & (orders["order_date"] <= datetime(2019,3,31)), ["cust_id","total_order_cost"]]
march_2019_orders.groupby("cust_id").sum().rename(columns={"total_order_cost":"revenue"}).sort_values(by="revenue",ascending=False).reset_index(drop=False)
