---
title: [Join a table or view to another data source]
last_updated: 11/3/2018
summary: "Learn how to define joins between a table or view and another table, view, or worksheet"
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Joining a table or view to another table, view, or worksheet creates a relationship that allows them to be searched together. Choose a column to join on that both tables contain (e.g. employee ID or product key). This process creates a [generic join]({{ site.baseurl }}/admin/loading/constraints.html) between the table or view and the other table, view, or worksheet on the column you specify.

If you want to create a primary key/foreign key relationship, you need to [use TQL]({{ site.baseurl }}/admin/loading/constraints.html) rather than the web interface.

You must have either the [**Can administrator ThoughtSpot** or the **Can manage data** privilege]({{ site.baseurl }}/admin/users-groups/about-users-groups.html) to create a join relationship. If you're not an administrator, you also need edit permissions on the table, view, or worksheet.

When creating a join between the columns in two data sources, the linked columns must have the same data type, with the same meaning. That is, they must represent the same data. Normally, you can make this kind of link from a fact table column to a column in a dimension table that uniquely identifies a logical entity in your data such as Employee ID for a person, Product ID for a product, or Date Key for a specific date in a date lookup table.

To create a relationship through the Web interface:

1. To find your table or view, click **Data** in the top menu, and choose **Tables** or **Views**.

2. Click the name of your table or view.

3. Click **Schema**. You will see the list showing existing joins.

4. Click the **+ Add Join** button on the upper right side of the screen.

   ![]({{ site.baseurl }}/images/table-add-join.png "Add join")

5. Use the **Map source to destination** dialog to choose the destination table, view, or worksheet you want to join to.

   ![]({{ site.baseurl }}/images/table-join-select-destination.png "Select destination table")

6. Choose the columns you want to join on from the table or view (source) and destination table, view, or worksheet. Click **Next**.

   ![]({{ site.baseurl }}/images/table-join-select-col.png "Select columns to join on")

7. Give your join a name and description and click **ADD JOIN**.

8.  Repeat these steps until all the joins you want to make have been created.

After creating the join, you may change its name and description by clicking the edit icon. If you want to change the data source or column being joined, you must delete the join and create a new one.

## Related Information

-   [Constraints]({{ site.baseurl }}/admin/loading/constraints.html)
