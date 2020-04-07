---
title: [Formula function reference]
summary: Learn the operators and functions you can use to create formulas in ThoughtSpot.
last_updated: 11/19/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
ThoughtSpot allows you to create derived columns in worksheets using formulas.
You create these columns by building formulas using the **Formula Assistant**.
An individual formula is constructed from _n_ combination of operators and
functions.

This reference lists the various operators and functions you can use to create
formulas.

{: id="operators"}
## Operators

{% include content/operators.md %}

{: id="aggregate-functions"}
## Aggregate functions (group aggregate)

Use the following functions to aggregate data.

{% include content/aggregate.md %}

{: id="conversion-functions"}
## Conversion functions

Use these functions to convert data from one data type into another data type.

ThoughtSpot does not support _date_ data type conversion.

{% include content/conversion-func.md %}

{: id="date-functions"}
## Date functions

{% include content/date-func.md %}

{: id="mixed-functions"}
## Mixed functions

These functions can be used with text and numeric data types.

{% include content/mixed-func.md %}

{: id="number-functions"}
## Number functions

{% include content/number-func.md %}

{: id="text-functions"}
## Text functions

{% include content/text-func.md %}
