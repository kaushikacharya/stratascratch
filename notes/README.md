# Notes
1. [SQL](#sql)
2. [Pandas](#pandas)

## SQL
- ### BETWEEN
    - Resource:
        - https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-between/
    - *If you want to check a value against of date ranges, you should use the literal date in ISO 8601 format i.e., YYYY-MM-DD.*
    - Problems:
        - [Highest Cost Orders](../problems/README.md#id-9915-highest-cost-orders)

- ### Common Table Expressions
    - Resource:
        - https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-cte/
        - Haki Benita discusses the issues with CTE and compares it against ```subquery``` in [his blog](https://hakibenita.com/be-careful-with-cte-in-postgre-sql).
    - Problems:
        - [Highest Cost Orders](../problems/README.md#id-9915-highest-cost-orders)
- ### DENSE_RANK
    - Resource: 
        - https://www.postgresqltutorial.com/postgresql-window-function/postgresql-dense_rank-function/
    - Problems: 
        - [Ranking Most Active Guests](../problems/README.md#id-10159-ranking-most-active-guests)

- ### EXTRACT function
    - Resource:
        - https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-extract/
    - Problems:
        - [Customer Revenue March](../problems/README.md#id-9782-customer-revenue-in-march)
            - Extraction of year, month from datetime.

- ### GROUP BY:
    - Resource:
        - https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-group-by/
    - PostgreSQL evaluates the ```GROUP BY``` clause after the ```FROM``` and ```WHERE``` clauses.

- ### INNER JOIN:
    - ### WHERE conditions:
        - [StackOverflow thread](https://dba.stackexchange.com/questions/155972/postgres-join-conditions-vs-where-conditions):
            - Erwin Brandstetter's answer
                - *Postgres is free to rearrange predicates in ```JOIN``` & ```WHERE``` clauses in its quest for the best query plan.*
                - *For **readability and maintainability** it makes sense to place conditions that connect tables in the respective JOIN clause and general conditions in the WHERE clause.*
            - OP's code shows how to put the various general conditions in the ```WHERE``` clause.
        - Problems:
            - [Number Of Units Per Nationality](../problems/README.md#id-10156-number-of-units-per-nationality)
                - Based on above suggestion, I have evolved [my solution](../src/sql/units_per_nationality.sql).
                    - Earlier solution had the conditions in the WHERE clause of individual tables.

- ### reset_index()
    - Resource:
        - https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.reset_index.html
    - Problems:
        - [Popularity of Hack](../problems/README.md#id-10061-popularity-of-hack)
            - Appplying aggregation function on ```pandas.core.groupby.generic.DataFrameGroupBy``` object outputs row index of the column on which it was grouped. To output that as column we need to use the default False for ```drop``` parameter.

- ### Using ```filter``` for multiple counts:
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
            - [My solution](../src/sql/rate_processed_tickets_each_type.sql) follows D-Shih's answer
            - [Official solution](../src/sql/rate_processed_tickets_each_type_official_solution.sql) follows Johan's answer.

## Pandas
- ### Unique over multiple columns:
    - [drop_duplicates](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.drop_duplicates.html)
        - [unique](https://pandas.pydata.org/docs/reference/api/pandas.unique.html) works over a single column only.