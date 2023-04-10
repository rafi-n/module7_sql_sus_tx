* Some fraudsters hack a credit card by making several small transactions (generally less than $2.00), which are typically ignored by cardholders. 

  * How can you isolate (or group) the transactions of each cardholder?
    
    Once the data is in a DataFrame, it can be grouped by any field (column) contained in it, using the 'groupby' method. 

  * Count the transactions that are less than $2.00 per cardholder. 

    30 - A count of all transactions less than $2.00 across all cards reveals that there are 30 such transactions.
    11 - A count of all transactions less than $2.00 for *cardholder 2* (CH2) reveals that there are 11 such transactions.
    19 - A count of all transactions less than $2.00 for *cardholder 18* (CH18) reveals that there are 19 such transactions.
    
  * Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.

    Based on the data above, it is possible that CH18 was hacked. CH18 has almost 2 times more low value transactions (under $2.00) than CH2. Also, each card held by CH18 has more low value transactions than CH2. However, card *344119623920892* has almost twice the number of low value transactions as the highest from CH2 (6 transactions). From observing the plot of all transactions for CH2 the spending pattern is sporadic and not seems to max out at round $20.00. However, CH18 has very periodic large transactions with a few small ones in between. It would be difficult to assess whether or not CH2 was hacked. It is more likely that CH18 was hacked if at all based on their transactions. It would be best to look at the patterns per card because some people use certain cards for specific purchases based on rewards, cash back, or other promotions offered by each card.
  
    `num_small_tx_df.groupby(['card','cardholder_id']).count()`
    
    |card|cardholder_id|id|amount|merchant_id|
    |--|:----:|:---------:|:--:|:-----------:|
    |344119623920892|18|11|11|11|
    |4498002758300|18|8|8|8|
    |4866761290278198714|2|5|5|5|
    |675911140852|2|6|6|6|

* Take your investigation a step futher by considering the time period in which potentially fraudulent transactions are made. 

  * What are the top 100 highest transactions made between 7:00 am and 9:00 am?
    There are fewer than 100 transactions for CH2 and CH18 during that time period, but they are listed below:

    `cust_trans_df.between_time('7:00', '9:00').sort_values('amount', ascending=False)`

    |date|cardholder_id|id|amount|card|id_merchant|
    |----|:-----------:|:-:|-----:|---:|:---------:|
    |2018-08-14 08:38:49|18|3019|18.54|4498002758300|55|
    |2018-02-27 08:27:00|2|2836|18.52|675911140852|6|
    |2018-02-18 08:54:19|18|2590|18.30|344119623920892|69|
    |2018-06-10 07:55:27|18|2717|16.16|4498002758300|10|
    |2018-05-28 07:57:39|2|3182|15.96|675911140852|128|
    |2018-03-10 08:52:09|2|929|13.53|675911140852|109|
    |2018-01-17 07:31:03|18|1889|12.67|4498002758300|89|
    |2018-12-29 08:11:55|18|1218|12.25|4498002758300|6|
    |2018-11-04 08:34:16|18|1808|11.64|4498002758300|9|
    |2018-09-29 07:16:40|2|1909|11.35|4866761290278198714|55|
    |2018-01-23 08:07:03|2|1379|10.47|4866761290278198714|7|
    |2018-09-30 07:38:44|18|1847|10.45|4498002758300|73|
    |2018-10-30 07:27:12|2|1692|10.45|675911140852|1|
    |2018-08-16 07:51:18|2|888|10.29|4866761290278198714|57|
    |2018-09-25 07:39:58|18|554|3.66|4498002758300|73|
    |2018-12-28 08:45:26|18|114|3.46|4498002758300|82|
    |2018-05-19 07:14:56|18|3417|3.22|4498002758300|2|
    |2018-09-28 07:31:10|18|2338|1.61|4498002758300|85|
    |2018-01-05 07:19:27|18|2077|1.36|344119623920892|30|

  * Do you see any anomalous transactions that could be fraudulent?
    
    There are some low value transactions within that time period ranging in value from $3.66 to $1.36. Although these are higher than $2.00 they do stand out from the rest of the values.

  * Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?

    No. There were more low value transactions outside the 7-9am period (28) than within it (2).

  * If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.

* What are the top 5 merchants prone to being hacked using small transactions?

    The top 5 are 'Baker Inc.', 'Hood-Phillips', 'Smith-Richards', 'Patton-Rivera', 'Allen, Ramos and Caroll'

* Create a view for each of your queries.
