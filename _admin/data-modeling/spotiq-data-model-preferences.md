---
title: [Set columns to exclude from SpotIQ analyses ]

last_updated: tbd
summary: "You can specify columns to exclude from SpotIQ analyses."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

[SpotIQ]({{ site.baseurl}}/spotiq/whatisspotiq.html) is a ThoughtSpot
feature  that provides users with insights about their data by automatically surfacing
interesting characteristics (trends, correlations, outliers, and so on).

If you have access to tables, worksheets, and views for data modeling purposes, you can specify columns to exclude from SpotIQ analyses. By default, all columns are _included_ in SpotIQ analyses.

## Exclude columns from SpotIQ analyses

To specify columns to exclude from SpotIQ analyses:

1. Click **Data** in the top menu, and choose **Tables**,  **Worksheets**, or **[Views]({{site.baseurl}}/complex-search/about-query-on-query.html)**.

2. Click the name of your data source.

3. On the **Columns** tab, find the COLUMN NAMES you want to exclude from SpotIQ analyses, and scroll to the right to find `SPOTIQ PREFERENCE`.

4. Use the drop-down menu to set the `SPOTIQ PREFERENCE` to **EXCLUDE** for each column you want to exclude.

5. Click **SAVE CHANGES** in the upper right.


## Include columns in SpotIQ analyses

By default, all columns are included in SpotIQ analyses.

If you have previously set some columns to EXCLUDE and you want to re-set these to be included, do the following.

1. Click **Data** in the top menu, and choose **Tables**, **Worksheets**, or **[Views]({{site.baseurl}}/complex-search/about-query-on-query.html)**.

2. Click the name of your data source.

3. On the **Columns** tab, find the COLUMN NAMES you want to set back to include in SpotIQ analyses, and scroll to the right to find `SPOTIQ PREFERENCE`.

4. Use the drop-down menu to set the `SPOTIQ PREFERENCE` to **DEFAULT** for each column you want to include.

5. Click **SAVE CHANGES** in the upper right.


## Related information  

* [SpotIQ tutorial]({{ site.baseurl}}/spotiq/whatisspotiq.html)

* [Overview of data modeling settings]({{ site.baseurl}}/admin/data-modeling/data-modeling-settings.html)
