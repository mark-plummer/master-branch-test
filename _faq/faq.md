---
title: ["Frequently asked questions"]
toc: false
last_updated: 11/19/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

### Where can I find the version of ThoughtSpot I am using?

Users with administrative privileges can see this displayed on the **Admin >
System Health > Overview** page.

### I'm not seeing certain columns/values in the drop-down, why?

It could be the index has not built with the latest data or something
is causing the column to be dropped.

* Verify the the column is available using the **Data** page.
* View the table columns and check the **INDEX TYPE** value. If it is set to `DONT_INDEX`, change it.
* Check the column's  **INDEX PRIORITY**. Make sure it is `1`.

To learn more about modeling data see [modeling data]({{ site.baseurl }}/admin/data-modeling/data-modeling-settings.html#) in this documentation.
