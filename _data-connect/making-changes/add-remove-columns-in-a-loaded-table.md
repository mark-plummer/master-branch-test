---
title: ["Add/remove columns in a loaded table"]
summary: "You can modify tables that have been selected for load in Data Connect by adding or removing columns."
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

In addition to adding more tables while editing a data source, you can also add or remove columns from loaded tables. This makes it easier to include new source columns with your job, edit the data source definition to add or remove columns, and adapt existing jobs to change source schemas.

This feature captures all relationships. The relationships are automatically created for you when you add a primary key column.

Do not edit the schema when altering tables.

To add/remove columns in a loaded table:

1. While viewing the **Selected Tables** section of the **Select Tables** step, expand one or more tables.

     ![]({{ site.baseurl }}/images/select_tables.png "Selected Tables")

2. Click the checkboxes to select/deselect tables columns for import.

    You cannot deselect all columns and tables in the job.

3. Click **Next** and complete the import.
