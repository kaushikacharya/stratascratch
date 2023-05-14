# Problems

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
