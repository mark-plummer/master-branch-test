---
title: [Join a worksheet to another data source]

last_updated: 11/18/2019
summary: "Learn how to define joins between a worksheet and a table or view."
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

Joining a worksheet to a table or view creates a relationship that allows them to be searched together. Choose a column to join on that both data sources contain (e.g. employee ID or product key). This process creates a [generic join]({{ site.baseurl }}/admin/loading/constraints.html) between the worksheet and the  table or view on the column you specify.

Note that creating a [foreign key relationship]({{ site.baseurl }}/admin/loading/constraints.html) is preferred over a generic relationship in most cases, except for when you need to do a range join. Foreign key relationships perform better and protect users from overcounting upon aggregation.

You must have either the **Can administer ThoughtSpot** privilege or the **Can manage data** privilege to create a join relationship. If you're not an administrator, you also need edit permissions on the table, view, or worksheet.

When creating a join between the columns in two data sources, the columns being linked must have the same data type, with the same meaning. That is, they must represent the same data.

To create a relationship through the Web interface:

1. To find your worksheet, click **Data** in the top menu, and choose **Worksheets**.

2. Click the name of your worksheet.

3. Click **Schema**. You will see the list showing existing joins within the worksheet.

4. To view the joins between the worksheet and other data sources, click **Joins within worksheets** and choose **Joins between worksheets**.

   ![]({{ site.baseurl }}/images/worksheet-join-chooser-between.png "Add join between worksheet")

5. Click the **+ Add Join** button on the upper right side of the screen.

   ![]({{ site.baseurl }}/images/ws-add-join.png "Add join")

6. Use the **Map source to destination** dialog to choose the destination table or view you want to join to.

   ![]({{ site.baseurl }}/images/ws-join-select-destination.png "Select destination table")

7. Choose the columns you want to join on from the worksheet (source) and destination data source. Click **Next**.

   ![]({{ site.baseurl }}/images/ws-join-select-col.png "Select columns to join on")

8. Give your join a name and description and click **ADD JOIN**.

9. Repeat these steps until all the joins you want to make have been created.

After creating the join, you may change its name and description by clicking the edit icon. If you want to change the data source or column being joined, you must delete the join and create a new one.

## Related Information

-   [Constraints]({{ site.baseurl }}/admin/loading/constraints.html)
