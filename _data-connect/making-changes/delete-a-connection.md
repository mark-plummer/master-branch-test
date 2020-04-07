---
title: [Delete a connection]
summary: "Learn how to delete a connection."
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
A connection is not tied to a task, and can therefore be called in multiple data sources. So in order to delete a connection, you must first delete all of the sources and tasks that use that connection. When the connection is not used in any data source, you can delete it.

To delete a connection:

1. Log in to ThoughtSpot from a browser.

2. Click **Data**, on the top navigation bar.

3.  Click the **Data Sources** tab at the top of the screen.

    ![]({{ site.baseurl }}/images/data_sources_tab_created.png "Data Sources tab")

4. Delete any dependent data sources. To delete a data source, see [Delete a data source](delete-data-source.html#).

5. Select **+ New data source** on the upper right hand side of the panel.

     ![]({{ site.baseurl }}/images/new_data_source_created.png "New data source")

6. Select the connection type of interest and click **Next**.

     ![]({{ site.baseurl }}/images/lightweight_etl_select_connection.png "Select a connection type")

7. In the **Select Tables** step, click the **Select a connection** dropdown and browse the list for the connection you wish to delete.

8. Click the **x** on the right of your selected connection to delete it.
     ![]({{ site.baseurl }}/images/delete_a_connection.png "Delete a connection")
