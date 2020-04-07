---
title: [About date formulas]
summary: Learn about date formulas.
last_updated: 11/15/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Date functions are useful when you want to compare data collected between two
date periods. Date formulas allow you to apply date related functions to your
formulas.

## Date formulas

The date formulas include:

{% include content/date-func.md %}

## Calculate date formulas

Calculating date formulas is useful when you want to compare data from different date periods. Here are some examples of using date formulas:

### Example 1

The following example shows you how to create formulas that you can use to compare data from this week to last week.

- The formula for this week is: `week ( today () ) - week (date)`
- The formula for last week is: `diff_days ( week ( today ) ) , week ( date ) )`

### Example 2

The following example shows you how to calculate the percent increase from the last date period to this period in terms of revenue.

1. Create the formula: `this week revenue = sum ( if ( this week ) then revenue else 0 )`
2. Then create the formula: `last week revenue = sum ( if (last week ) then revenue else 0 )`
3. Use [nested formulas]({{ site.baseurl }}/complex-search/about-nested-formulas.html#) to calculate the percent increase by creating a parent formula: `percent increase = ( ( last week revenue - this week revenue) / last week revenue ) \* 100`

## Fiscal and Gregorian calendars

For the following date formulas, you can further specify either `fiscal` or
Gregorian `calendar` on which to base date calculations. (If you do not specify a
calendar type, the formula defaults to standard Gregorian, with the year
starting in January.)

* `day_number_of_quarter`
* `day_number_of_year`
* `month_number`
* `month_number_of_quarter`
* `quarter_number`
* `start_of_quarter`
* `start_of_year`
* `week_number_of_quarter`
* `week_number_of_year`
* `year`

Your ThoughtSpot administrator and ThoughtSpot Support can
[set up a fiscal calendar year]({{ site.baseurl }}/admin/setup/set-custom-calendar.html#)
to start on any month. If the `fiscal` year is not explicitly configured in the system,
`fiscal` defaults to January, the same as the Gregorian `calendar`.

For example, the formula `month_number_of_quarter (05/01/2014)` would return `2`
based on the default Gregorian calendar, whereas the formula
`month_number_of_quarter (05/01/2014, 'fiscal')` would return `1` if your
administrator has configured the fiscal calendar to start at May.

## Related information

* [Date functions]({{ site.baseurl }}/reference/formula-reference.html#date-functions) in the [Formula function reference]({{ site.baseurl }}/reference/formula-reference.html#)

* [Set up a fiscal calendar year]({{ site.baseurl }}/admin/setup/set-custom-calendar.html#)
