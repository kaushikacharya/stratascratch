import pandas as pd
import numpy as np

result = google_gmail_emails.groupby(
    ['from_user']).size().to_frame('total_emails').reset_index()
result['rank'] = result['total_emails'].rank(method='first', ascending=False)
result = result.sort_values(by=['total_emails', 'from_user'], ascending=[False, True])
