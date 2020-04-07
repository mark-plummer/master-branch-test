---
title: [Reaggregation scenarios in practice]
summary: "We provide real world scenarios for using flexible aggregation in ThoughtSpot."
last_updated: 12/05/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

The following scenarios showcase the use of the <code>group_aggregate</code> function in the real world. We provide them to demonstrate to you how the function works, and the scenarios where it proved useful.

* [Scenario 1: Supplier tendering by job](#supplier-tendering)
* [Scenario 2: Average rates of exchange](#average-rates-exchange)
* [Scenario 3: Average period value for semi-additive numbers I](#average-period-value-semi-additive-numbers-1)
* [Scenario 4: Average period value for semi-additive numbers II](#average-period-value-semi-additive-numbers-2)

{% include content/flexible-aggregation-best-practices.md %}

{: id="supplier-tendering"}
## Scenario 1: Supplier tendering by job

We have a fact table at a job or supplier tender response aggregation level. There are many rows for each job, where each row is a single row from a supplier. A competitive tender is a situation when multiple suppliers bid on the same job.

Our objective is to determine what percentage of jobs had more than 1 supplier response. We want to see high numbers, which indicate that many suppliers bid on the job, so we can select the best response.

### Valid solution

{% include content/intro-valid-solution.md %}

<pre>
<code>
sum(group_aggregate(if(sum(# trades tendered ) > 1) then 1 else 0, 
                    query_groups() + {claimid, packageid}, 
                    query_filters())) 
           </code>
</pre>

![Supplier tendering by job, aggregated result]({{ site.baseurl }}/images/supplier-tender-job-1.png "Supplier tendering by job, aggregated result")

### Resolution

<ol>
  <li><p>The <code><strong>sum ( # trades tendered )</strong></code> function aggregates to these attributes:</p>

  <ul>
    <li>
      <code><strong>{claimid, packageid}</strong></code>
      <p>The job-level identifier</p></li>
    <li>
      <code><strong>query_groups( )</strong></code>
      <p>Adds any additional columns in the search to this aggregation. Here, this is the <code><strong>datelogged</strong></code> column at the yearly level.</p></li>
    <li>
      <code><strong>query_filters ( )</strong></code>
      <p>Applies any filters entered in the search. Here, there are no filters.</p></li>
  </ul></li>

<li><p>For each row in this virtual table, the conditional <code><strong>if() then else</strong></code> function  applies. So, if the sum of tendered responses is greater than 1, then the result returns 1, or else it returns 0.</p></li>

<li><p>The outer function, <code><strong>sum()</strong></code>, reaggregates the final output as a single row for each <code><strong>datelogged</strong></code> yearly value.</p>

  <ul>
    <li>This reaggregation is possible because the conditional statement is inside the <code><strong>group_aggregate</strong></code> function.</li>
    <li>Rather than return a row for each <code><strong>{claimid,packageid}</strong></code>, the function returns a single row for <code><strong>datelogged yearly</strong></code>.</li>
    <li>The default aggregation setting does not reaggregate the result set.</li>
  </ul></li></ol>

###  Non-Aggregated Result

{% include content/intro-non-aggregated.md %}

In the following scenario, the next statement is the conditional <code><strong>if</strong></code> clause. Because of this, the overall expression does not reaggregate. The returned result is a row for each <code><strong>{claimid,packageid}</strong></code>.

<pre><code>
<strong>sum(if</strong>(group_aggregate (sum (# trades tendered),
                              query_groups() + {claimid, packageid},
                              query_filters ( ) )<strong>>1) then 1 else 0)</strong></code></pre>

![Supplier tendering by job, non-aggregated result]({{ site.baseurl }}/images/supplier-tender-job-2.png "Supplier tendering by job, non-aggregated result")

{: id="average-rates-exchange"}
## Scenario 2: Average rates of exchange

The Average rate of exchange calculates for the selected period.
These average rates provide a mechanism to hedge the value of loans against price fluctuations in the selected period. We apply the average rate _after the aggregation_.

The pseudo-logic that governs the value of loans is <code>sum(loans) * average(rate)</code>.

The data model has two tables: a primary fact table, and a dimension table for `rates`.
 * The `loans` column is from the primary fact table.
 * The `rate` column is from the `rates` table.

These tables are at different levels of aggregation:
 *	The primary fact table uses a lower level of aggregation, on `product`, `department`, or `customer`.
 *	The `rates` dimension table use a higher level of aggregation, on `daily`, `transaction currency`, or `reporting currency`.

The two tables are joined through a relationship join on `date` and `transaction currency`.

To simplify the scenario, we only use a single `reporting currency`. The join ensures that a single rate value returns each day for each transaction currency.

### Valid solution

{% include content/intro-valid-solution.md %}

```
sum(group_aggregate (sum(loans)*average (rate),
                     query_groups () + {transaction_currency}, 
                     query_filters () )) 
```

The following search and resulting response returns the dollar value for each year, for each target reporting currency. Note that the dataset contains both euro (&#8364;) and US dollars (&#36;). The <code>&#36; Loans Avg. Rate</code>  calculates the average rate of exchange for the entire period. The <code>&#36; Loans Spot Rate</code> applies the rate of exchange on the day of the transaction.

![Average rates of exchange, aggregated result]({{ site.baseurl }}/images/average-rate-exchange-1.png "Average rates of exchange, aggregated result")

### Resolution

<ol>
  <li><p>The <code><strong>sum(loans)</strong></code> function aggregates to these attributes:</p>

    <ul>
      <li>
      <code><strong>{transaction_currency}</strong></code> and  <code><strong>query_groups()</strong></code>
      <p>Add additional search columns to this aggregation. Here, this at the level of <code>reporting currency</code> and <code>year</code>.</p></li>

     <li>
    <code><strong>query_filters( )</strong></code>
    <p>Applies any filters entered in the search. Here, there are no filters.</p></li>
  </ul></li>

<li><p>Similarly, the <code><strong>average(rate)</strong></code> function aggregates to these attributes:</p>

  <ul>
    <li>
    <code><strong>{transaction_currency}</strong></code> and  <code><strong>query_groups()</strong></code>
    <p>Add additional search columns to this aggregation. Here, this at the level of <code>reporting currency</code> and <code>year</code>.</p></li>

  <li>
  <code><strong>query_filters( )</strong></code>
  <p>Applies any filters entered in the search. Here, there are no filters.</p></li>
  </ul></li>

<li><p>For each row in this virtual table, the exchange rate applies to the sum of loans: <code><strong>sum(loans) * average(rate)</strong></code>.</p></li>

<li><p>The outer <code><strong>sum()</strong></code> function reaggregates the final output as a single row for each yearly reporting currency value.</p>
  <p>Note that the default aggregation setting does not reaggregate the result set.</p></li>
</ol>  

###  Non-Aggregated Result

{% include content/intro-non-aggregated.md %}

In the following scenario, the formula assumes that the default aggregation applies. Here, the result returns 1 row for each `transaction currency`.

```
group_aggregate (sum(loans )*average (rate ),
                 query_groups() + {transaction_currency}, 
                 query_filters())
```

![Average rates of exchange, non-aggregated result]({{ site.baseurl }}/images/average-rate-exchange-2.png "Average rates of exchange, non-aggregated result")

{: id="average-period-value-semi-additive-numbers-1"}
## Scenario 3: Average period value for semi-additive numbers I

**Semi-additive** numbers may be aggregated across some, but not all, dimensions. They commonly apply to specific time positions. In this scenario, we have daily position values for home loans, and therefore cannot aggregate on the date dimension.

### Valid solution

{% include content/intro-valid-solution.md %}

```
average(group_aggregate(sum(loan balance),
                        query_groups() + {date(balance date)},
                        query_filters())) 
```

![Average period value semi-additive numbers, aggregated result]({{ site.baseurl }}/images/avg-period-non-additive-1-1.png "Average period value semi-additive numbers, aggregated result")

### Resolution

<ol>
  <li><p>The <code><strong>sum(loan balance)</strong></code> function aggregates to the following attributes:</p>

<ul>
  <li>
    <code><strong>{date(balance date)}</strong></code> and <code><strong>query_groups()</strong></code>
    <p>Add additional search columns to this aggregation. Here, this at the <code>yearly</code> level.</p></li>
  <li>
    <code><strong>query_filters ( )</strong></code>
    <p>Applies any filters entered in the search. Here, there are no filters.</p></li>
</ul></li>

<li><p>The <code><strong>sum(loan balance)</strong></code> function returns a result for each row in this virtual table.</p></li>

<li><p>The outer <code><strong>average()</strong></code> function reaggregates the final output as a single row for each <code><strong>year</strong></code> value.</p></li>
</ol>

{: id="average-period-value-semi-additive-numbers-2"}
## Scenario 4: Average period value for semi-additive numbers II

**Semi-additive** numbers may be aggregated across some, but not all, dimensions. They commonly apply to specific time positions. In this scenario, we have daily position values for home loans, and therefore cannot aggregate on the date dimension.

Here, we consider a somewhat different situation than in [Scenario 3](#average-period-value-semi-additive-numbers-1). In some financial circumstances, the average daily balance has to be calculated, even if the balance does not exist. For example, if a banking account was opened on the 15th of June, business requirements have to consider all the days in the same month, starting with the 1st of June. Importantly, we cannot add these ‘missing’ data rows to the data set; note that the solution used in [Scenario 3](#average-period-value-semi-additive-numbers-1) returns an average only for the period that has data, such as June 15th to 30th, not for the entire month of June. The challenge is to ensure that in the daily average formula, the denominator returns the total days in the selected period, not just the days that have transactions:

<pre><code>sum(loans) / sum(days_in_period)</code></pre>

To solve for this, consider the data model:
  * The fact table `transactions` reports the daily position for each account, and uses a  `loan` column.
  * The dimension table `date` tracks information for each date, starting with the very first transaction, all the way through the most recent transaction. This table includes the expected `date` column, and `days_in_period` column that has a value of 1 in each row.
  * Worksheets use the `date` column with keywords such as _weekly_, _monthly_, _yearly_ to change the selected period.
  * When users run a search with the _monthly_ keyword, the denominator must reflect the number of days in each month.

### Valid solution

{% include content/intro-valid-solution.md %}

The following code _in the denominator definition_ returns the total number of days for the period, regardless whether there are transactions, or what filters apply:

```
group_aggregate (sum(days_in_period),{Date},{})
```

### Resolution

<ol>
<li>
<p>The <code><strong>sum(days_in_period)</strong></code> function aggregates to:</p>
<ul>
<li><code><strong>{Date}</strong></code>
<p>No other search columns appear.</p>
</li>
<li><code>{}</code>
<p>We require the entire period, so there are no filters.</p>
</li>
</ul>
<p>Note that the <code>date</code> keywords <em>yearly</em>, <em>quarterly</em>, <em>monthly</em>, and <em>weekly</em>&nbsp;apply because we use the same column in both the search and the aggregation function. So, the function will result in the following output when it runs with the <em>yearly</em> keyword in search:</p>
<table>
<thead>
<tr>
<th>Year</th>
<th>Result</th>
</tr>
</thead>
<tbody>
<tr>
<td>2016</td>
<td>366</td>
</tr>
<tr>
<td>2017</td>
<td>365</td>
</tr>
<tr>
<td>2018</td>
<td>365</td>
</tr>
<tr>
<td>2019</td>
<td>365</td>
</tr>
<tr>
<td>2020</td>
<td>366</td>
</tr>
</tbody>
</table>
</li>
<li>
<p>This data is not reaggregated because we want to return the result at the appropriate <code>date</code> level.</p>
</li>
</ol>

###  Alternate Solution

To return only the number of days that have existing transactions, use the following code in the denominator:

```
sum(days_in_period)
```
