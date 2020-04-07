---
title: [Configure columns for the X and Y axes]
last_updated: 2/25/2020
summary: "You can configure specific columns to be on the X and Y axes."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can specify which fields to show on the X axis and Y axis of a chart. When you first run a search, some measures or attributes may not be visualized. You can add them to the other measures or attributes on the axes of a chart by dragging these columns from the **not visualized** section to the correct axis.

You can only add attributes to the X axis, and measures to the Y axis. If you cannot add a column to a specific axis, the option to do so does not appear to you when you attempt to drag and drop the column. Attributes appear blue in the search bar and in the **Customize** menu, while measures appear green.

{% include note.html content="The X and Y axes on a bar chart work in a different way than other charts. In bar charts, attributes are on the Y axis, and measures are on the X axis." %}

You can also drop attributes and measures to the **not visualized** section. This removes them from the visualization, but not from your search.

1. Click the **chart configuration** icon ![]({{ site.baseurl }}/images/icon-gear-10px.png){: .inline} on the top right.

2. Drag and drop a measure or attribute from the **not visualized** section to the correct axis, or from an axis to the **not visualized** section.

   ![Configure x and y axis]({{ site.baseurl }}/images/chart-config-not-visualized.gif "Configure x and y axis")

In some cases, the y-axis labels appear on either side of the chart (left and right) instead of stacked on the same side, depending on the parameters of the analysis. Refer to  [change the position of the axis]({{ site.baseurl }}/end-user/search/chart-axes-options.html#position) and [change the grouping]({{ site.baseurl }}/end-user/search/chart-axes-options.html#grouping).

For a list of chart types to which this applies, see [Charts with multiple measures on the y-axis]({{ site.baseurl }}/end-user/search/about-charts.html#charts-with-multiple-measures-on-the-y-axis).
