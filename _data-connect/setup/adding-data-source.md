---
title: [Add a new data source]
summary: "When you enable ThoughtSpot Data Connect, you can add a new data source."
last_updated: 11/19/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Now that you've enabled ThoughtSpot Data Connect, you will be able to add a new data source. Data sources are the source systems from which you want to import data and schedule repeat data loads.

Data sources can consist of relational database sources, like SQL Server, or applications, like Marketo or Salesforce. To add a data source:

1. Log in to ThoughtSpot from a browser.

2. Click **Data**, on the top navigation bar.

3. Click the **Data Sources** tab at the top of the page, and select **+ Data source** on the upper right hand side of the panel.

     ![]({{ site.baseurl }}/images/data_sources_tab.png "New data source")

4. Select which type of connection you wish to use from the available list.

5. Select a connection type and click **Next**.

     ![]({{ site.baseurl }}/images/lightweight_etl_select_connection.png "Select a connection type")

6. To select a connection, choose one of these options:

    -   Select a pre-defined connection type, by choosing it from the **Select Connection** list:

         ![]({{ site.baseurl }}/images/lightweight_etl_select_existing_connection.png "Select a connection type")

    -   Click **+** to create the connection and provide the credentials to your data source. Then click **Test & Create**:

         ![]({{ site.baseurl }}/images/lightweight_etl_create_new_connection.png "Create a connection")

    Refer to the [Data Connect connectors reference]({{ site.baseurl }}/data-connect/reference/data-connect-connection-credentials.html#) for more information on each of the specific attributes you must enter into the dialog box.

7. Choose the tables you wish to load from the list of **Available Tables**.

    Only the first 200 objects that occur alphabetically are listed per schema. If you want to access a table that occurs after the first 200 objects alphabetically, you must use the object search bar.

     ![]({{ site.baseurl }}/images/data_connect_object_search_bar.png "Object search bar")

    Here are examples of the user and system performed search patterns for this object search bar:

    -   User enters KNA, then the system performs a search for %KNA%.
    -   User enters KNA\*, then the system performs search for KNA%.
    -   User enters \*KNA, then the system performs search for %KNA.
    -   User enters "KNA", then the system performs exact match search for KNA.
    Select the specific columns to import.

   Field names must contain 65 characters or less and only contain alphanumeric or underscore characters. Spaces in column names are not supported. In addition, names cannot start with a number.

    If you have a table with columns that violate these limitations, you can work around the issue by:

    1. Creating a View, which contains appropriate field names, based on the source table .

    2. Then use Data Connect to pull data and write the View to ThoughtSpot.
     ![]({{ site.baseurl }}/images/lightweight_etl_select_columns.png "Selecting tables and columns")

8. When all the columns are selected, click **\>** to move them to the **Selected Tables** box. Click **Next**.

9. You can optionally apply a filter to only import specific rows by clicking **New...** under **Data Filters**.

    1. Select a table to filter.

    2. Select a filter by specifying a column, operator, and value.

         ![]({{ site.baseurl }}/images/lightweight_etl_filter.png "Apply a Data Filter")

    3. Click **OK**.

    4. You can create as many filters as you need by clicking **+** and repeating these steps.

10. You can optionally apply data transformations and write the result to a new column by clicking **New...** under **Expressions**.

    1. Give the new column an alphanumeric name (underscores are okay).

      You can rename it later in the ThoughtSpot application.

    2. Select the table and column the data will come from.

    3. Type in an expression. You can see a list of expressions by clicking the **Expression assistant**.
        ![]({{ site.baseurl }}/images/lightweight_etl_expression.png "Apply an Expression")

    4. Click **Add Column**.

    5. Click **Validate** to validate your expression before creating the data source.

    6. You can create as many expressions as you need by clicking **+** and repeating these steps.

11. Click **Next**.

12. Provide a **Source Name** for the data source.

13. Check the list of columns to be imported, to make sure it is correct.

    If you are loading into new or empty tables, or if you want to delete any data that already exists in the tables, click the checkbox to select **Truncate data in the existing tables.**

14. If you want to specify repeat data loads, create a loading schedule.

     ![]({{ site.baseurl }}/images/lightweight_etl_schedule.png "Schedule a loading job")

15. If you want to receive an email notification letting you know when your data load completes, select **Enable email notifications for data load tasks.**

    Email notifications are only  sent to the respective email address of the user who created the data source. You can't send notifications to multiple email addresses.

    To receive email notifications, you must enable **Email me sharing notifications** in your Profile Preferences. You also need to have an email set in your user properties found on the Admin User Management page.

16. You can add a pre-script that will run your TQL script before the datasource uploads.

    Additionally, you can add a post-script that will run your TQL script after the data uploads. This feature is not available if Informatica Cloud Services is still in use.

17. Click **Import**.

18. If you want to view or change the SQL DDL (data definition language) that will create the target table, click **here**.

     ![]({{ site.baseurl }}/images/data_connect_edit_schema.png "Edit schema here")

19. Review and edit the schema as necessary. Click **Load** to load the tables.

     ![]({{ site.baseurl }}/images/data_connect_edit_schema_view.png "Edit schema view")

20. Click **Load**.

Your data source will appear on the Data Sources list page, and you can find the imported tables on the Tables list page. Tables imported through ThoughtSpot Data Connect display the job name in the Source column.
