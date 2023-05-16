# Notes

## DENSE_RANK
- Resource: 
    - https://www.postgresqltutorial.com/postgresql-window-function/postgresql-dense_rank-function/
- Problems: 
    - [Ranking Most Active Guests](../problems/README.md#id-10159-ranking-most-active-guests)

## reset_index()
- Resource:
    - https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.reset_index.html
- Problems:
    - [Popularity of Hack](../problems/README.md#id-10061-popularity-of-hack)
        - Appplying aggregation function on ```pandas.core.groupby.generic.DataFrameGroupBy``` object outputs row index of the column on which it was grouped. To output that as column we need to use the default False for ```drop``` parameter.
