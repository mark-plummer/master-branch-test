---
title: [Change a table's data model]

last_updated: tbd
summary: "You can adjust the data model for a newly loaded table."
sidebar: mydoc_sidebar
toc: true
permalink: /:collection/:path.html
---
To make modeling settings for a data source you've just loaded, or to make a quick
change to existing settings, use the ThoughtSpot web interface. You can adjust
the **Columns** settings from the data management listing.

You can change all the same data model settings here as in the model file. This
method is easier and faster, unless you need to make many settings in bulk. In
that case, [using the model file](edit-model-file.html#) is recommended.

## About data sources

{% include content/data-modeling-and-sources.md %}

## Change the data model for a data source

1. Click **Data** on the top navigation bar.

2. Click a data source you own or can edit.

   ![]({{ site.baseurl }}/images/data_management_select_data_source.png "Select a data source")

    This brings up the **Columns** screen, where you can make your modeling settings.

3. Modify one or more column settings.

   Descriptions of the possible settings are listed in [Data modeling settings](data-modeling-settings.html#).

4. Save your changes.

   ![]({{ site.baseurl }}/images/modeling_columns_screen.png "Edit modeling settings in the Columns screen")

5. To check your changes, use the **SEARCH** page to search for across the changed data.


## Related information  

* [Data modeling settings](data-modeling-settings.html#)
* [Edit the system-wide data model](edit-model-file.html#)
* [Understand data sources]({{ site.based }}/end-user/data-view/data-intro-end-user.html)
