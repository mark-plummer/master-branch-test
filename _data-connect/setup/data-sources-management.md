---
title: [Data sources management]
summary: "After you have successfully loaded your tables, you can check on the status of the load, make edits, and more."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can manage your new data sources by clicking on the name of your source on the **Data Sources** page. You can have up to 50 scheduled jobs on your cluster at time. Contact ThoughtSpot Support if you'd like to increase this limit.

 ![]({{ site.baseurl }}/images/data_sources_management_view.png "Data sources management view")

After selecting a data source, you have the option to perform a number of editing and maintenance tasks.

## Schedule, edit, and refresh

You can select a table row and click one of the following three buttons to make changes:

-   **Schedule**: Opens a Scheduler menu where you can make changes to the loading schedule.
-   **Edit**: Takes you back to edit the data source details, such as loading another table or truncating an existing one.
-   **Refresh**: Refreshes the data load status.

 ![]({{ site.baseurl }}/images/schedule_edit_refresh_data_source.png "Schedule, edit, and refresh data sources")

## Restart the load

Selecting a source and clicking the **Restart** icon will immediately reload the data.

 ![]({{ site.baseurl }}/images/restart_the_load.png "Restart the data source load")

## View log files

You can download the session logs for a data load run. Select a table row, and click **View session logs** at the bottom of the page. View the log file to troubleshoot any failed loads or to simply check the log queries.

 ![]({{ site.baseurl }}/images/view_session_logs.png "View session logs")

## Delete a data source

You can delete a data source by selecting it in the **Data Sources** page, then clicking the **Delete** icon.

 ![]({{ site.baseurl }}/images/delete_data_source.png "Delete a data source")

{% include note.html content="Do not delete the `Default` data source. It does not correspond to any connection in ThoughtSpot Data Connect. However, this source is assigned to default datasets." %}
