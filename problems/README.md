# Problems

|   ID   | Problem  |
|--------|----------|
|   9781 |[Find the rate of processed tickets for each type](#id-9781-find-the-rate-of-processed-tickets-for-each-type)
|   9782 |[Customer Revenue In March](#id-9782-customer-revenue-in-march)|
|   9915 |[Highest Cost Orders](#id-9915-highest-cost-orders)|
|  10061 |[Popularity of Hack](#id-10061-popularity-of-hack)|
|  10064 |[Highest Energy Consumption](#id-10064-highest-energy-consumption)|
|  10078 |[Find matching hosts and guests in a way that they are both of the same gender and nationality](#id-10078-find-matching-hosts-and-guests-in-a-way-that-they-are-both-of-the-same-gender-and-nationality)
|  10156 |[Number Of Units Per Nationality](#id-10156-number-of-units-per-nationality)|
|  10159 |[Ranking Most Active Guests](#id-10159-ranking-most-active-guests)|
|  10300 |[Premium vs Freemium](#id-10300-premium-vs-freemium)|
|  10304 |[Risky Projects](#id-10304-risky-projects)
|  10322 |[Finding User Purchases](#id-10322-finding-user-purchases)|
|  10351 |[Activity Rank](#id-10351-activity-rank)|
|  10354 |[Most Profitable Companies](#id-10354-most-profitable-companies)|

-------------------------------------------------------------

### ID 9781: [Find the rate of processed tickets for each type](https://platform.stratascratch.com/coding/9781-find-the-rate-of-processed-tickets-for-each-type?code_type=1)

- Problem Statement:
  - Find the rate of processed tickets for each type.
- Solutions:
  - [Official](../src/sql/rate_processed_tickets_each_type_official_solution.sql)
  - [Mine](../src/sql/ranking_most_active_guests.sql)

### ID 9782: [Customer Revenue In March](https://platform.stratascratch.com/coding/9782-customer-revenue-in-march?code_type=2)

- Problem Statement:
  - *Calculate the total revenue from each customer in March 2019. Include only customers who were active in March 2019.  
  Output the revenue along with the customer id and sort the results based on the revenue in descending order.*

- Comparison between [official solution](../src/python/customer_revenue_march_official_solution.py) and [my solution](../src/python/customer_revenue_march.py):
  - ```sum``` applied over
    - ```series```
      - ```to_frame``` used for creating dataframe from series.
      vs
    - ```dataframe```.
      - ```rename``` used for renaming the column name.

### ID 9915: [Highest Cost Orders](https://platform.stratascratch.com/coding/9915-highest-cost-orders?code_type=1)

- Problem Statement:
  - Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. If customer had more than one order on a certain day, sum the order costs on daily basis. Output customer's first name, total cost of their items, and the date.  
  For simplicity, you can assume that every first name in the dataset is unique.
  - Tables: customers, orders
- Approach:
  - Use [Common Table Expressions](../notes/README.md#common-table-expressions) as we need the [row with max value](https://www.postgresqltutorial.com/postgresql-aggregate-functions/postgresql-max-function/) for a column.
- Learnings:
  - The first solution I tried threw the exception:
    ```(psycopg2.errors.GroupingError) aggregate function calls cannot be nested```
    as I tried ```MAX(SUM(<column>))```
    - Solution: One needs to use subselect to get nested aggregate functions as mentioned in the [StackOverflow thread](https://stackoverflow.com/questions/43117033/aggregate-function-calls-cannot-be-nested-postgresql).
- Solution:
  - [Kaushik](../src/sql/highest_cost_orders.sql)
  - [Official Solution](../src/sql/highest_cost_orders_official_solution.sql)
    - Here the join of the tables are done inside the CTE, whereas in my solution join is done in the final query.

### ID 10061: [Popularity of Hack](https://platform.stratascratch.com/coding/10061-popularity-of-hack?code_type=1)

- Problem Statement:
  - Meta/Facebook has developed a new programing language called Hack.To measure the popularity of Hack they ran a survey with their employees. The survey included data on previous programing familiarity as well as the number of years of experience, age, gender and most importantly satisfaction with Hack. Due to an error location data was not collected, but your supervisor demands a report showing average popularity of Hack by office location. Luckily the user IDs of employees completing the surveys were stored.
  Based on the above, find the average popularity of the Hack per office location.  
  Output the location along with the average popularity.
- Approach:
  - Inner join followed by aggregate function to compute average.

### ID 10064: [Highest Energy Consumption](https://platform.stratascratch.com/coding/10064-highest-energy-consumption)

- Problem Statement:
  - Find the date with the highest total energy consumption from the Meta/Facebook data centers. Output the date along with the total energy consumption across all data centers.

- Approach:
  - Utilized
    - [Common Table Expressions](../notes/README.md#common-table-expressions)
    - [Union All](../notes/README.md#union-all)
  - Alternative:
    - Using [FETCH [WITH TIES]](https://stackoverflow.com/questions/50030508/postgresql-select-all-rows-which-have-max-value-in-one-column)
      - Haleemur Ali's answer
      - Works on newer versions of PostgreSQL only.

- Solutions:
  - [Kaushik](../src/sql/highest_energy_consumption.sql)
    - Multiple submissions showing how the code was refined.
    - Difference with official solution:
      - [Rank](../notes/README.md#rank--dense_rank) used instead of ```Join``` to extract rows with max value for a column.
  - [Official](../src/sql/highest_cost_orders_official_solution.sql)
    - Common Table Expressions used to define sequence of queries.
    - ```Join``` used to extract the rows with max value for a column.

### ID 10078: [Find matching hosts and guests in a way that they are both of the same gender and nationality](https://platform.stratascratch.com/coding/10078-find-matching-hosts-and-guests-in-a-way-that-they-are-both-of-the-same-gender-and-nationality?code_type=1)
- Problem Statement:
    - Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
Output the host id and the guest id of matched pair.
- Learning:
    - Use [drop_duplicates](../notes/README.md#unique-over-multiple-columns) to remove duplicate rows.

### ID 10156: [Number Of Units Per Nationality](https://platform.stratascratch.com/coding/10156-number-of-units-per-nationality?code_type=1)
- Problem Statement:
    - Find the number of apartments per nationality that are owned by people under 30 years old. Output the nationality along with the number of apartments. Sort records by the apartments count in descending order.
- [Approach](../src/sql/units_per_nationality.sql):
    - Inner join followed by group by.

### ID 10159: [Ranking Most Active Guests](https://platform.stratascratch.com/coding/10159-ranking-most-active-guests?code_type=1)

- Problem Statement:
  - Rank guests based on the number of messages they've exchanged with the hosts. Guests with the same number of messages as other guests should have the same rank. Do not skip rankings if the preceding rankings are identical.
Output the rank, guest id, and number of total messages they've sent. Order by the highest number of total messages first.
- Approach:
  - Created a subquery that computes total messages for each guest.
  - Applied DENSE_RANK function over this result set.

### ID 10300: [Premium vs Freemium](https://platform.stratascratch.com/coding/10300-premium-vs-freemium?code_type=1)

- Problem Statement:
  - Find the total number of downloads for paying and non-paying users by date. Include only records where non-paying customers have more downloads than paying customers. The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads.
- Approach:
  - Create a subquery that calculates the total downloads for paying and non-paying users by date.
  - Filter the results from the above subquery.
- Solutions:
  - [Kaushik](../src/sql/premium_vs_freemium.sql)
    - Best practice: Unlike my solution, official solution uses mulitple joins instead of subqueries to calculate the total downloads.
  - [Official solution](../src/sql/premium_vs_freemium_official_solution.sql)

### ID 10304: [Risky Projects](https://platform.stratascratch.com/coding/10304-risky-projects?code_type=1)

- Problem Statement:
  - *Identify projects that are at risk for going overbudget. A project is considered to be overbudget if the cost of all employees assigned to the project is greater than the budget of the project.  
  You'll need to prorate the cost of the employees to the duration of the project. For example, if the budget for a project that takes half a year to complete is $10K, then the total half-year salary of all employees assigned to the project should not exceed $10K. Salary is defined on a yearly basis, so be careful how to calculate salaries for the projects that last less or more than one year.  
  Output a list of projects that are overbudget with their project name, project budget, and prorated total employee expense (rounded to the next dollar amount).  
  HINT: to make it simpler, consider that all years have 365 days. You don't need to think about the leap years.*

- Observation:
  - IMHO, duration should be ```(end_date - start_date) + 1``` instead of ```(end_date - start_date)```.

- Approach:
  - In [official solution](../src/sql/risky_projects_official_solution.sql), all the three tables are joined first and then select logic is applied.
  - In [my solution](../src/sql/risky_projects.sql), inner join applied over sub-queries.

### ID 10322: [Finding User Purchases](https://platform.stratascratch.com/coding/10322-finding-user-purchases?code_type=2)

- Problem Statement:
  - *Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.*

### ID 10351: [Activity Rank](https://platform.stratascratch.com/coding/10351-activity-rank?code_type=1)

- Problem Statement:
  - Find the email activity rank for each user. Email activity rank is defined by the total number of emails sent. The user with the highest number of emails sent will have a rank of 1, and so on. Output the user, total emails, and their activity rank. Order records by the total emails in descending order. Sort users with the same number of emails in alphabetical order.  
  In your rankings, return a unique value (i.e., a unique rank) even if multiple users have the same number of emails. For tie breaker use alphabetical order of the user usernames.
- Solutions:
  - PostgreSQL:
    - [Kaushik](../src/sql/activity_rank.sql)
      - [rank](https://www.postgresqltutorial.com/postgresql-window-function/postgresql-rank-function/) function utilized.
    - [Official Solution](../src/sql/activity_rank_official_solution.sql)
      - [row_number](https://www.postgresqltutorial.com/postgresql-window-function/postgresql-row_number/) function utilized.
  - Python
    - [Kaushik](../src/python/activity_rank.py)
      - ```rank``` over multiple columns:
        - Implemented by creating tuple of ```from_user``` and ```total_emails```.
        - Resource: User B. M.'s answer in the [stackoverflow thread](https://stackoverflow.com/questions/41974374/pandas-rank-by-multiple-columns).
    - [Official Solution](../src/python/activity_rank_official_solution.py)
      - Usage of [aggregation method](https://pandas.pydata.org/pandas-docs/stable/user_guide/groupby.html#built-in-aggregation-methods) ```size``` whereas my solution used ```count```. ```size``` is better as ```count``` only considers non-NA.
      - ```groupby``` produces ```Series``` instead of ```DataFrame```.
      - IMHO, ```rank``` is computed based on only ```total_emails```. How would it assign rank to the users in alphabetical order which have the same ```total_emails```?

### ID 10354: [Most Profitable Companies](https://platform.stratascratch.com/coding/10354-most-profitable-companies?code_type=1)

- Problem Statement:
  - Find the 3 most profitable companies in the entire world.
Output the result along with the corresponding company name.
Sort the result based on profits in descending order.
- Challenge:
  - Though the solution seems to an easy one, but that's not the case. It may seem that, we just sort in descending order and then select the first three. There might be case where there are more than three companies whose profits are in the top 3 ranked ones.
    - Unfortunately, the test database in the website at the time of submission didn't had this case.
    - TODO Update my solution to tackle this.
