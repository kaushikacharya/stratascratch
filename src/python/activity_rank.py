# Import your libraries
import pandas as pd

# Start writing code
google_gmail_emails.head()

"""
google_gmail_emails[["id", "from_user"]].groupby(by="from_user", as_index=False).count().rename(columns={"id": "total_emails"}).sort_values(by=["total_emails", "from_user"], ascending=[False, True], inplace=True)
google_gmail_emails["rank"] = google_gmail_emails.index+1
google_gmail_emails[["from_user", "total_emails", "rank"]]
"""

# Aggregate count for each from_user group
df = google_gmail_emails.groupby(by="from_user", as_index=False)["id"].count().rename(columns={"id":"total_emails"})
# Compute rank
df["rank"] = df.apply(lambda x: tuple([-1*x[1],x[0]]), axis=1).rank(method="min").astype(int)
# Order by rank
df.sort_values(by="rank", ascending=True)
