# Notes

## DENSE_RANK
- Resource: 
    - https://www.postgresqltutorial.com/postgresql-window-function/postgresql-dense_rank-function/
- Problems: 
    - [Ranking Most Active Guests](../problems/README.md#id-10159-ranking-most-active-guests)

## EXTRACT function
- Resource:
    - https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-extract/
- Problems:
    - [Customer Revenue March](../problems/README.md#id-9782-customer-revenue-in-march)
        - Extraction of year, month from datetime.

## GROUP BY:
- Resource:
    - https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-group-by/
- PostgreSQL evaluates the ```GROUP BY``` clause after the ```FROM``` and ```WHERE``` clauses.

## reset_index()
- Resource:
    - https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.reset_index.html
- Problems:
    - [Popularity of Hack](../problems/README.md#id-10061-popularity-of-hack)
        - Appplying aggregation function on ```pandas.core.groupby.generic.DataFrameGroupBy``` object outputs row index of the column on which it was grouped. To output that as column we need to use the default False for ```drop``` parameter.