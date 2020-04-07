---
title: [Best Practices for Using ODBC]
last_updated: tbd
toc: false
summary: "To successfully use ODBC, following these best practices is recommended."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

When developing tools that use the ODBC driver, use these best practices:

* When setting up ODBC for the first time, begin by using the ThoughtSpot `tsload`
for the initial data loads. This allows you to do more in-depth troubleshooting
on any initial loading issues.  After initial loads work properly,
switch to ODBC to perform incremental loads.

* You should create the parameterized SQL statement outside of ODBC. Using this
method, the SQL statement can be sent to ThoughtSpot in batches by the ODBC
driver, so you only have to update the memory itself. ETL tools have this
implemented already (end users shouldn’t have to actually write the `INSERT`
statement). But as a developer, you may be writing code that leverages the ODBC
driver, so this tip can help you write your SQL for the best performance with
the driver.

* Data can be loaded into a table through multiple parallel connections. You can
achieve this by splitting the input data into multiple parts. Then, load those
individual parts through multiple parallel connections. You can use parallel
loading even while loading to a single table or multiple tables at the same
time.

* When doing an incremental data load, note that the same `UPSERT` behavior that
occurs in TQL also occurs. This means that if you import a row whose primary key
matches an existing row, the existing row will be updated with the new
values.

## Related information

* [Enable ODBC logs]({{ site.baseurl}}/data-integrate/troubleshooting/enable-ODBC-log.html)
* [Introduction to loading and managing data]({{site.baseurl}}/admin/loading/loading-intro.html)
* [Loading and constraints]({{site.baseurl}}/admin/loading/constraints.html)
