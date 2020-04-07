---
title: [Configure multiple connections on Windows]

last_updated: tbd
summary: "You can add multiple ODBC data sources."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Use this procedure if you want to add an additional data source after creating a
[single source succeeds](install-odbc-windows.html#). The main reason for needing to set up multiple
ThoughtSpot ODBC data sources is that you have a production cluster and a test
or development cluster.

1. Locate and open the **ODBC Data Source Administrator (64-bit)** application.

   ![]({{ site.baseurl }}/images/odbc-windows-search.png "System DSN")1

2. Click the **System DSN** tab.
3. Select **Add**.

   The system lists the available drivers.

   ![]({{ site.baseurl }}/images/ODBC_choose_new_data_source_to_add.png "Create New Data Source")

4. Choose the **ThoughtSpot ODBC Driver** and click **Finish**.

    The system displays the **Client Configuration Dialog** dialog.

    ![]({{ site.baseurl }}/images/ODBC_config_dev_source_connect.png "New connection")

5. Enter the your data source configuration.

    | Configuration Property   | Value                                                  |
    |-------------------|--------------------------------------------------------|
    | **Data Source Name** |  The name you want to call the data source. |
    | **Description** |  A description of the data source. |
    | **Server IP** |  A list of the IP addresses for each node, separated by commas. |
    | **Server Port** |  `12345` |
    | **Idle Timeout** |  Time in seconds after which an idle ODBC connection times out. |
    | **Login Timeout** |  Time in seconds after which a login request times out. |
    | **Query Timeout** |  Time in seconds after which a query times out. |

6. Configure custom properties by clicking **Options**.

    The system displays the **Options** dialog.

    ![]({{ site.baseurl }}/images/ODBC_add_custom_property.png "Add a custom property")

8. Add these properties using the **Add** to enter an option and click **OK** after to save an option.

    | Option                | Value                   |
    |-----------------------|-----------------------------|
    | **DATABASE**          |  The default database to connect to. |
    | **SCHEMA**            | The default schema to connect to. Use `falcon_default_schema` if you aren't sure.|
    | **CONNECTIONTIMEOUT** |  Optional. Seconds before an idle connection times out. |

    The key must be defined exactly as it appear here, using all capital letters. You can find other supported properties in [ODBC and JDBC configuration properties]({{ site.baseurl }}/data-integrate/reference/simba-settings.html#).

    ![]({{ site.baseurl }}/images/ODBC_add_custom_property_new_data_source.png "Enter the custom property key and value")

9. When you are done, click **OK** to save your new configuration.

    ![]({{ site.baseurl }}/images/odbc-new-config.png "Success")

10. Click **Test Connection** to test your database connection.

    ![]({{ site.baseurl }}/images/windows-odbc-success.png "Success")


    If your test connection fails, [enable ODBC logging]({{ site.baseurl
    }}/data-integrate/troubleshooting/enable-ODBC-log.html#) to
    troubleshoot.

11. Click **Cancel** to close the **DSN Configuration** dialog.
12. Click **OK** to close the **Client Configuration Dialog** the dialog.
13. Click **OK** to close the **ODBC Data Source Administrator (64-bit)** application
