---
title: [About Runtime Filters]
summary: "Use runtime filters to filter an embedded answer or pinboard."
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Runtime filters allow you to filter an answer or pinboard through parameters you
pass in the URL to filter the data that is returned. You can use them with the
data API or with embedding of answers or pinboards.

## Capabilities of Runtime Filters

Runtime Filters provide ability to filter data at the time of retrieval using
[Embedding]({{ site.baseurl
}}/app-integrate/embedding-viz/about-embedding-viz.html#) or the [REST API]({{
site.baseurl }}/app-integrate/data-api/about-data-api.html#). This is done by
providing filter information through the URL query parameters.

This example shows the URL to access a pinboard with a filter. Here the Runtime
Filter is operating on the column "Color" and will only return values that are
equal (EQ) to "red".

```
http://10.77.144.40:8088/?col1=Color&op1=EQ&val1=red#
/pinboard/e36ee65e-64be-436b-a29a-22d8998c4fae
```

This example shows the URL for a REST API call with a filter. Here the Runtime
Filter is operating on the column `Category` and returning values that are equal
to `mfgr%2324`.

```
http://10.77.144.40:8088/callosum/v1/tspublic/v1/pinboarddata?
id=e36ee65e-64be-436b-a29a-22d8998c4fae&col1=Category
&op1=EQ&val1=mfgr%2324
```

ThoughtSpot will try to find a matching column from the pinboard or
visualization being accessed, using the `col` field as `name`. You can add any
number of filter sets by incrementing the parameters (e.g. `col2`, `op2`, and
`val2`, etc.) For operators that support more than one value you can pass
`val1=foo&val1=bar`, etc.

If the pinboard or answer you're filtering already has one or more filters
applied, the Runtime Filter(s) will act as an `AND` condition. This means that
the data returned must meet the conditions of all filters - those supplied in
the runtime filter, and those included in the pinboard or visualization itself.

## Supported Data Types

You can use runtime filters on these data types:

-   `VARCHAR`
-   `INT64`
-   `INT32`
-   `FLOAT`
-   `DOUBLE`
-   `BOOLEAN`
-   `DATE`
-   `DATE_TIME`
-   `TIME`

Note that for `DATE` and `DATE_TIME` values, you must specify the date in epoch
time (also known as POSIX or Unix time).

## Example Uses

You can use Runtime Filters alongside the REST API and Embedding to create
dynamic controls in your Web portal. For example, you could use the REST API to
get a list of possible filters for a visualization. Then use that data to
populate a select list on your Web portal. When a user makes a selection, you
would then pass it as a Runtime Filter, and the result returned will apply the
filter.

## Limitations of runtime filters

Runtime Filters do not work directly on top of tables. You must create a
worksheet if you want to use Runtime Filters. This means that the pinboard or
visualization on which you apply a runtime filter must be created on top of a
worksheet.

If the worksheet was created from an answer (it is an aggregated
worksheet), Runtime Filters will only work if the answer was formed using a
single worksheet. If the answer from which the worksheet was created includes
raw tables or joins multiple worksheets, you won't be able to use Runtime
Filters on it. This is because of the join path ambiguity that could result.

Runtime Filters do not allow you to apply “having" filters using a URL.

You cannot apply a Runtime Filter on a pinboard or visualization built on tables
whose schema includes a chasm trap. See the ThoughtSpot Administrator Guide for
details on chasm traps and how ThoughtSpot handles them.
