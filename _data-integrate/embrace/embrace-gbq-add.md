---
title: [Add a BigQuery connection]
last_updated: 1/30/2020
toc: true
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Once ThoughtSpot Embrace is enabled, you can add a connection to a BigQuery database. This allows you to perform a live query of the external database to create answers and pinboards, without having to bring the data into ThoughtSpot.

To add a new connection to BigQuery:

1. Click **Data** in the top navigation bar.

2. Click the **Connections** tab at the top of the page, and click **+ Add connection** at the upper-right-hand side of the page.

    ![Click "+ Add connection"]({{ site.baseurl }}/images/redshift-addconnection.png "Click "+ add connection"")
    <!-- ![]({{ site.baseurl }}/images/new-connection.png "New db connect") -->

3. Create a name for your connection, a description (optional), then select the BigQuery connection type, and click **Continue**.
    ![Add a GBQ connection]({{ site.baseurl }}/images/gbq-connectiontype.png "Add a Google BigQuery connection")
    <!--  ![Add a BigQuery connection]({{ site.baseurl }}/images/gbq-connectiontype.png "Add a BigQuery connection") -->

4. Enter the connection details for your BigQuery data source, and click **Continue**.
    ![Enter connection details]({{ site.baseurl }}/images/gbq-connectiondetails.png "Enter connection details")
    <!--  ![Enter connection details]({{ site.baseurl }}/images/gbq-connectiondetails.png "Enter connection details") -->

    Refer to the [BigQuery connection reference]({{ site.baseurl }}/data-integrate/embrace/embrace-gbq-reference.html#) for more information on each of the specific attributes you must enter for your connection.

5. Select tables (on the left) and the columns from each table (on the right), and then click **Create connection**.
    ![Select tables and columns for your connection]({{ site.baseurl }}/images/snowflake-selecttables.png "Select tables and columns for your connection")
  <!--  ![Select tables and columns for your connection]({{ site.baseurl }}/images/gbq-selecttables.png "Select tables and columns for your connection") -->

   Once the connection is added, you can search your BiqQuery database right away by clicking **Search now**.
  ![The "Connection created" screen]({{ site.baseurl }}/images/gbq-connectioncreated.png "The "Connection created" screen") 

   Your new connection appears on the **Data** > **Connections** page. You can click the name of your connection to view the tables and columns in your connection.   

The connection you just created is a link to the external data source. If there are any joins in the selected tables of the external data source, those are imported into ThoughtSpot.

You can now perform a live query on the selected tables and columns of your connection. Because the selected tables and columns in your connection are linked, it may take a while to initially render the search results. This is because ThoughtSpot does not cache linked data. With linked data, ThoughtSpot queries the external database directly, which is slower than querying data that is stored in ThoughtSpot's database.

## Related information
- [Modify a BigQuery connection]({{ site.baseurl }}/data-integrate/embrace/embrace-gbq-modify.html)
- [BigQuery connection reference]({{ site.baseurl }}/data-integrate/embrace/embrace-gbq-reference.html)
- [Load and manage data]({{ site.baseurl }}/admin/loading/loading-intro.html)
- [Data and object security]({{ site.baseurl }}/admin/architecture/security.html)
