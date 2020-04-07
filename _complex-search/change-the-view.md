---
title: [Change result display options]
last_updated: 1/16/2020
summary: "You can change how your search results (Answers) appear."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Your search results, or Answers, have various display options. You can change the
visualization used to display your results, their sort order, how ThoughtSpot groups the data, and what data ThoughtSpot includes.

## Change the view

You can change the view of your answer so it appears as either a table or a chart. To
change the view of your answer:

1. View your answer.
2. Toggle between either a table or a chart type.

    ![Select table or chart]({{ site.baseurl }}/images/changeview-chartortable.png "Select table or chart")

When you display your data as a chart, ThoughtSpot automatically selects the type of chart that works best for your data. If you want to use another type, click the change visualization icon ![]({{ site.baseurl }}/images/icon-chart-type-10px.png){: .inline} and select the type of chart you want. Refer to [understand charts]({{ site.baseurl }}/end-user/search/about-charts.html).

## Sort your search

Sorting your search allows you to order your answer, making it easier to read.
To sort your search:

* If you are in the data (table) view, click the column header you would like to sort on.

   By default, sorting applies in descending order. For example, if the column has numerical values, it would start at the highest number and decrease. Click the column header again to sort in ascending order.

   {% include tip.html content="Hold shift and click another column to add a secondary sort. You can even add tertiary sorting and so on by continuing to use this trick." %}

* If you are in the chart view, click the axis label of your chart that you would like to sort and select **Sort**. You can choose to sort in ascending or descending order.

## Change the date bucketing (grouping)

You can change the date _bucketing_ on tables and charts for columns with date
values.  Bucketing is a method for grouping a column in your data. To bucket your data in a table view, click the ellipsis icon ![]({{ site.baseurl }}/images/icon-more-10px.png){: .inline} that appears when you hover over a column name on a table.

You can specify date bucketing at many granularities, from **detailed** (to the minute or second) to **yearly**, depending on your data. You can also specify bucketing based on the position of a bucket relative to another, larger bucket. For example, you can group data by **month of quarter**, or **week of month**.

![Choose a date bucket on a table]({{ site.baseurl }}/images/changeview-bucket.png "Choose a date bucket on a table")

To bucket your data in a chart view, click the dropdown icon ![]({{ site.baseurl }}/images/icon-dropdown-down-20px.png){: .inline} that appears when you hover near the axis labels on a chart.

![Choose a date bucket on a chart]({{ site.baseurl }}/images/changeview-chartbucket.png "Choose a date bucket on a chart")

ThoughtSpot chooses a default date bucket for you when you search. This default
takes the entire search result into account. For example, if your search
includes last month, dates are bucketed daily instead of monthly.

## Exclude and include row values

You can include or exclude row values from your answer.

To exclude or include row values:

1. Right-click the visualization or table cell of interest.
2. Select **Exclude "value"** or **Only Include "value"** if available.

     ![Exclude or include a value]({{ site.baseurl }}/images/changeview-exclude.png "Exclude or include a value")
