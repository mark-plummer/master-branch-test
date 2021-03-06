---
title: [Bar charts]
last_updated: 3/9/2020
summary: Bar charts are like column charts, but oriented horizontally.
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
The bar chart is very similar to the column chart. The only difference is that
it is oriented horizontally, instead of vertically.

Bar charts display your data using horizontal rectangular bars. The length of
the bar is proportional to the data value.

![Bar chart]({{ site.baseurl }}/images/charts-bar.png "Bar chart")

Your search needs at least one attribute and one measure to be represented as a bar chart.

## Stacked bar charts {#stacked-bar-charts}

The stacked bar chart is similar to the bar chart, but with one major difference. It includes a legend, which divides each bar into additional sections by color.

Stacked bar charts are typically used when you want to compare aggregated
data and the data that it includes together. You can click on a configurable axis chip (any axis chip with a **>**) to show Detail Labels (summaries for each section of each bar) and Total Labels (show the sum of the stacks for each bar).

![Stacked bar chart with labels]({{ site.baseurl }}/images/charts-stacked-bar-labels.png "Stacked bar chart with labels")

You can also plot the x-axis as a percentage, adding up to 100%. Click on the measure or attribute chip that you are using to **slice with color**. Under **Format**, toggle **Stack 100%** on or off. You can also toggle **Stack 100%** from an axis chip, as in the image above. This feature is also available for stacked area and column charts.

![Stacked bar chart -- Stack 100 percent toggled on]({{ site.baseurl }}/images/charts-stacked-bar-100.png "Stacked bar chart -- Stack 100 percent toggled on")

Your search needs at least two attributes and one measure to be represented as a stacked bar chart.
