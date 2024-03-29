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

- ### CASE

  - Resource:
    - [PostgreSQL tutorial](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-case/)
  - Problems:
    - [Premium vs Freemium](../problems/README.md#id-10300-premium-vs-freemium)

- ### CAST

  - Resource:
    - https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-cast/
  - Options:
    - CAST operator
    - ```expression:type```
  - Problems:
    - [Risky Projects](../problems/README.md#id-10304-risky-projects)

- ### Common Table Expressions

  - Resource:
    - https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-cte/
    - Haki Benita discusses the issues with CTE and compares it against ```subquery``` in [his blog](https://hakibenita.com/be-careful-with-cte-in-postgre-sql).
  - Problems:
    - [Highest Cost Orders](../problems/README.md#id-9915-highest-cost-orders)

- ### RANK / DENSE_RANK

  - Resource:
    - [DENSE_RANK](https://www.postgresqltutorial.com/postgresql-window-function/postgresql-dense_rank-function/)
    - [RANK](https://www.postgresqltutorial.com/postgresql-window-function/postgresql-rank-function/)
  - Problems: 
    - [Ranking Most Active Guests](../problems/README.md#id-10159-ranking-most-active-guests)

- ### EXTRACT function

  - Resource:
    - [PostgreSQL Tutorial](https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-extract/)
  - Problems:
    - [Customer Revenue March](../problems/README.md#id-9782-customer-revenue-in-march)
      - Extraction of year, month from datetime.
    - [Monthly Percentage Difference](../problems/README.md#id-10319-monthly-percentage-difference)
      - Formatting function ```to_char()``` used as multiple fields needed to be extracted.

- ### GROUP BY

  - Resource:
    - https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-group-by/
  - PostgreSQL evaluates the ```GROUP BY``` clause after the ```FROM``` and ```WHERE``` clauses.

- ### INNER JOIN

  - **WHERE conditions**
    - [StackOverflow thread](https://dba.stackexchange.com/questions/155972/postgres-join-conditions-vs-where-conditions):
      - Erwin Brandstetter's answer
        - *Postgres is free to rearrange predicates in ```JOIN``` & ```WHERE``` clauses in its quest for the best query plan.*
        - *For **readability and maintainability** it makes sense to place conditions that connect tables in the respective JOIN clause and general conditions in the WHERE clause.*
      - OP's code shows how to put the various general conditions in the ```WHERE``` clause.
    - Problems:
      - [Number Of Units Per Nationality](../problems/README.md#id-10156-number-of-units-per-nationality)
        - Based on above suggestion, I have evolved [my solution](../src/sql/units_per_nationality.sql).
          - Earlier solution had the conditions in the WHERE clause of individual tables.
  
  - **Join vs Subquery**
    - [Linkedin collaborative article](https://www.linkedin.com/advice/0/how-do-you-decide-when-use-subquery-join-sql)
      - *Generally speaking, joins are faster than subqueries, because they can use indexes and other optimization techniques.*
    - Problems:
      - [Premium vs Freemium](../problems/README.md#id-10300-premium-vs-freemium)

- ### LAG

  - Resource
    - [PostgreSQL tutorial](https://www.postgresqltutorial.com/postgresql-window-function/postgresql-lag-function/)

- ### UNION [ALL]

  - Resource
    - [PostgreSQL tutorial](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-union/)

  - Problems
    - [Highest Energy Consumption](../problems/README.md#id-10064-highest-energy-consumption)

- ### reset_index()

  - Resource:
    - https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.reset_index.html
  - Problems:
    - [Popularity of Hack](../problems/README.md#id-10061-popularity-of-hack)
      - Appplying aggregation function on ```pandas.core.groupby.generic.DataFrameGroupBy``` object outputs row index of the column on which it was grouped. To output that as column we need to use the default False for ```drop``` parameter.

- ### Using ```filter``` for multiple counts

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

- ### Unique over multiple columns

  - [drop_duplicates](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.drop_duplicates.html)
    - [unique](https://pandas.pydata.org/docs/reference/api/pandas.unique.html) works over a single column only.

- ### Group by

  - [Pandas documentation](https://pandas.pydata.org/pandas-docs/stable/user_guide/groupby.html) explains split-apply-combine process.
    - [realpython](https://realpython.com/pandas-groupby/) explains with dataset examples.

- ### rank

  - [DataFrame.rank](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.rank.html)
  - Problems:
    - [Activity Rank](../problems/README.md#id-10351-activity-rank)
      - ```rank``` over multiple columns using ```tuple```.
