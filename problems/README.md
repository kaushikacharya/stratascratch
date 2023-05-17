# Problems

|   ID   | Problem  |
|--------|----------|
|   9782 |[Customer Revenue In March](#id-9782-customer-revenue-in-march)|
|  10061 |[Popularity of Hack](#id-10061-popularity-of-hack)|
|  10159 |[Ranking Most Active Guests](#id-10159-ranking-most-active-guests)|
|  10322 |[Finding User Purchases](#id-10322-finding-user-purchases)|
|  10354 |[Most Profitable Companies](#id-10354-most-profitable-companies)|

-------------------------------------------------------------

### ID 9782: [Customer Revenue In March](https://platform.stratascratch.com/coding/9782-customer-revenue-in-march?code_type=2)
- Problem Statement:
    - Calculate the total revenue from each customer in March 2019. Include only customers who were active in March 2019.
    Output the revenue along with the customer id and sort the results based on the revenue in descending order.

- Comparison between [official solution](../src/python/customer_revenue_march_official_solution.py) and [my solution](../src/python/customer_revenue_march.py):
    - ```sum``` applied over
        - ```series```
            - ```to_frame``` used for creating dataframe from series.
          vs 
        - ```dataframe```.
            - ```rename``` used for renaming the column name.

### ID 10061: [Popularity of Hack](https://platform.stratascratch.com/coding/10061-popularity-of-hack?code_type=1)
- Problem Statement:
    - Meta/Facebook has developed a new programing language called Hack.To measure the popularity of Hack they ran a survey with their employees. The survey included data on previous programing familiarity as well as the number of years of experience, age, gender and most importantly satisfaction with Hack. Due to an error location data was not collected, but your supervisor demands a report showing average popularity of Hack by office location. Luckily the user IDs of employees completing the surveys were stored.
    Based on the above, find the average popularity of the Hack per office location.  
    Output the location along with the average popularity.
- Approach:
    - Inner join followed by aggregate function to compute average.

### ID 10159: [Ranking Most Active Guests](https://platform.stratascratch.com/coding/10159-ranking-most-active-guests?code_type=1)
- Problem Statement:
    - Rank guests based on the number of messages they've exchanged with the hosts. Guests with the same number of messages as other guests should have the same rank. Do not skip rankings if the preceding rankings are identical.
Output the rank, guest id, and number of total messages they've sent. Order by the highest number of total messages first.
- Approach:
    - Created a subquery that computes total messages for each guest.
    - Applied DENSE_RANK function over athis result set.

### ID 10322: [Finding User Purchases](https://platform.stratascratch.com/coding/10322-finding-user-purchases?code_type=2)
- Problem Statement:
    - Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.

### ID 10354: [Most Profitable Companies](https://platform.stratascratch.com/coding/10354-most-profitable-companies?code_type=1)
- Problem Statement:
    - Find the 3 most profitable companies in the entire world.
Output the result along with the corresponding company name.
Sort the result based on profits in descending order.
- Challenge:
    - Though the solution seems to an easy one, but that's not the case. It may seem that, we just sort in descending order and then select the first three. There might be case where there are more than three companies whose profits are in the top 3 ranked ones.
        - Unfortunately, the test database in the website at the time of submission didn't had this case.
        - TODO Update my solution to tackle this.
