---
title: [Row level security rules reference]
summary: Learn the operators and functions you can use to create rules for row level security.
last_updated: 11/19/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
ThoughtSpot allows you to create row level security rules using expressions. If
an expression evaluates to "true" for a particular row and group combination,
that group will be able to see that row. This reference lists the various
operators and functions you can use to create rules.

For information on how to use the row level security functions and operators,
see [About Rule-Based Row Level Security]({{ site.baseurl
}}/admin/data-security/row-level-security.html#). There is a special variable
called `ts_groups`, which you can use when creating row level security rules. It
fetches a list of the groups that the currently logged in user belongs to. For
each row, if the expression in the rule evaluates to 'true' for any one of these
groups, that row will be shown to the user.

You can also see this list of operators and examples from within the Rule Builder by selecting **Rule Assistant**.

## Conversion functions

These functions can be used to convert data from one data type to another. Conversion to or from date data types is not supported.

{% include content/conversion-func.md %}

## Date functions

{% include content/date-func.md %}

## Mixed functions

These functions can be used with text and numeric data types.

{% include content/mixed-func.md %}

## Number functions

{% include content/number-func.md %}


## Operators


{% include content/operators.md %}


## Text functions


{% include content/text-func.md %}


## Variables

These variables can be used in your expressions.

{% include content/func-variables.md %}
