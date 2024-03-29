---
title: [Search results contain too many blanks]
summary: Learn how to fix the problem when your search results contain too many blanks.
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
If you find that your search results contain too many blanks when your data source is a worksheet, there is a simple adjustment you can make to fix this.

If you find that the charts and tables built on a worksheet contain a large number of null values (which display as \{blank\} in the web browser), you can fix this by changing the [inclusion rule]({{ site.baseurl }}/admin/worksheets/about-inclusion-rule.html#) for the worksheet.

An inclusion rule that specifies **Exclude Empty Rows (Inner Join)** will reduce the number of null values in the result. Imagine a worksheet that includes data about a retail grocery store. There are rows in the worksheet from these source tables:

|Table Name|Description|
|----------|-----------|
|sales|Fact table with sales made per product per store.|
|products|Dimension table with information about every product.|
|stores|Dimension table with information about every store.|

When creating the worksheet, suppose you choose **Include Empty Rows (Left Outer Join)** for the inclusion rule and **Progressive Joins** for the join rule. In this case, if you type "product name" in your search, you can see a list of all the products that exist. Suppose you then add "store name" to your search. You will see a lot of null (\{blank\}) values in the result. This happens because the columns "store name" and "product name" are joined through the fact table, "sales". So for every product that has never been sold in a particular store, you can see \{blank\} in the "store name" column. This may be what you want to see, in which case, you can leave the worksheet as is, and choose **Exclude** for the \{blank\} values in your table or chart, whenever you don't want to see them.

However, in may cases, including all the \{blank\} values could confuse end users. So if you encounter this problem, you can [edit the worksheet, and change the inclusion rule]({{ site.baseurl }}/admin/worksheets/change-inclusion-rule.html#) to **Exclude Empty Rows (Inner Join)**. Now when searching for "store name" and "product name" on the worksheet, users will not be overwhelmed by null values. They'll only see the rows where a particular product has been sold in a particular store.
