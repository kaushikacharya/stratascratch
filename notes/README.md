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

## Using ```filter``` for multiple counts:
- Resources:
    - https://stackoverflow.com/questions/72084303/filtering-in-count-function-postgresql
        - D-Shih's answer:
            - ```COUNT(<column>) FILTER(WHERE <condition>)```
    - https://popsql.com/learn-sql/postgresql/how-to-use-filter-to-have-multiple-counts-in-postgresql
        - ```COUNT(1) FILTER(WHERE <condition>)```
    - https://dba.stackexchange.com/questions/227603/count-items-on-condition
        - Johan's answer:
            - ```COUNT(CASE WHEN <condition> THEN 1 END) ```
- Problems:
    - [Find the rate of processed tickets for each type](../problems/README.md#id-9781-find-the-rate-of-processed-tickets-for-each-type)
        - [My solution](../src/sql/rate_processed_tickets_each_type.sql) followed D-Shih's answer
        - [Official solution](../src/sql/rate_processed_tickets_each_type_official_solution.sql) follows Johan's answer.
