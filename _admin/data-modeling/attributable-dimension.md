---
title: [Change the Attribution Dimension]

toc: true
last_updated: 11/15/2019
summary: "The Attribution Dimension setting applies only to tables that are related through a chasm trap. If your schema does not include these, you can ignore this setting."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

The **Attribution Dimension** setting only applies to tables that join over a
[Chasm Trap]({{ site.baseurl }}/admin/loading/chasm-trap.html#). By default, the attribution dimension
setting will be set to `YES`, but you can override that by setting the column's
attribution dimension property to `NO`, as described here.

## Understand chasm traps and attribute dimension

In the classic chasm trap, two fact tables are related through a shared dimension
table. When the two fact tables are joined, the shared column(s) in the
dimension table are used to attribute rows in one fact table to match with rows
in the other fact table.

Usually, all goes well using this method. But sometimes an incorrect or
illogical attribution can result. This can happen because the column chosen is
not meaningful for performing this attribution. If you are seeing unexpected
results in searches that include tables across a chasm trap, this setting is for
you.

Below is an example of a column that is not an attribution dimension. Suppose you have two fact tables, Wholesale Purchases and Retail Sales, that share a common dimension Date.

![]({{ site.baseurl }}/images/NOT_attribution_dim.png "Example where a column is not an attribution dimension")

In this example, the date column in the Date dimension should not be used for
attribution, since unrelated rows in both of the fact tables could share the
same row in the Date table. Why? Because if Sally bought oranges wholesale on
April 25, 2005 and made a retail sale of apples on the same day, there is no
logical relationship between those two events. Combining the two events using
the date they share will not create any meaningful information.


If matching rows in two fact tables over a chasm trap depends on the values in a
column contained in a dimension table, that column is known as an attribution
dimension.

![]({{ site.baseurl }}/images/IS_attribution_dim.png "Attribution dimension example")


In this example, the Product ID column in the Products dimension table is an
attribution dimension. For rows where the Product ID in the Wholesale Purchases
and in the Retail Sales tables is a match, those rows are logically related in a
meaningful way. They can be combined in charts and reports to produce a logical,
expected outcome.

## How to set attribute dimension

You cannot configure this setting in the model file. You can only configure it
on a table-by-table basis. To designate a column as not being an attribution
dimension (not producing any meaningful attribution across a chasm trap):

1. Find the column that is not an attribution dimension.
2. Select its **Attribution Dimension**.
3. Set the value to `NO`.
  If you're using the modeling file, set it to **FALSE**.
4. Save your changes.


## Related information  

[Model the data for searching]({{ site.baseurl }}/admin/data-modeling/about-data-modeling-intro.html)
