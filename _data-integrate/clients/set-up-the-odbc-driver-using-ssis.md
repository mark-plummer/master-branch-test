---
title: [Set up the ODBC Driver for SSIS]

last_updated: tbd
summary: "Use SSIS to set up the ODBC Driver."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---


Microsoft SSIS (SQL Server Integration Services) is a data integration and
workflow applications platform you can use to connect to ThoughtSpot. The
platform is a component of the Microsoft SQL Server database software.

You can use a SSIS connection to perform data migration tasks. Its data
warehousing tool is useful for data ETL (extraction, transformation, and
loading). The SSIS Import/Export Wizard creates packages that transfers data
with no transformations. It can move data from a variety of source types to a
variety of destination types, including text files and other SQL Server
instances.

Use SSIS to set up the ODBC Driver by creating a connection manager. This
manager connects an OLE DB Source and the ODBC
Destination.


## Prerequisites

On Windows 64-bit, you have to install both the 32-bit and 64-bit ThoughtSpot
ODBC drivers. In addition, they must be named the same, such as ThoughtSpot. By
default they are named ThoughtSpot-32 and ThoughtSpot-64. This is required
because the 64-bit SSIS shows a list of 32-bit ODBC drivers when you configure
an ODBC target. However, it executes the 64-bit driver. If the drivers aren't
named the same, then you can get an error stating the driver doesn't exist.


## Set up the driver

To set up the ODBC driver using SSIS:

1. Open your SQL Server visual development tool that is based on Microsoft Visual Studio.
2. Select **OLE DB Source**, and click **New**.

    Where ODBC provides access only to relational databases, OLE DB provides
    access to data regardless of its format or location.

3. Add the server by name from the machine accessible list.
4. Enter the authentication information: db name, user name, password, and test connection.

   You can add the UID and password by clicking on **Options**.

5. Click **File** and select **New**, then **Project**.
6. Select the **Integration Services** tab under **Installed > Templates > Business Intelligence**.
7. Enter a name in the **Name** field and click **OK**.

   ![]({{ site.baseurl }}/images/ssis_integration_services.png "New Project: Integration Services")

8. Select the **SSIS Toolbox** tab on the left hand side of the platform, and drag and drop **Data Flow Task** to the main window.

   ![]({{ site.baseurl }}/images/ssis_data_flow_task.png "Drag and drop Data Flow Task")

9. Double click the **Data Flow Task** icon when it appears in the center of the page.

   ![]({{ site.baseurl }}/images/ssis_data_flow_task_icon.png "Data Flow Task icon")

10. Navigate back to the **SSIS Toolbox** tab.
    You now want to create sources and destinations.

## Create sources and destinations

1. Under **Other Sources**, find **OLE DB Source** and drag and drop it to the main window.
2. Double click the **OLE DB Source** icon when it appears in the center of the page to open the OLE DB Source Editor.
3. Select a new OLE DB connection manager by clicking **New**.
4. In the Configure OLE DB Connection Manager window, select your **Data connection** and click **OK**.

     ![]({{ site.baseurl }}/images/ssis_ole_db_connection_manager.png "Configure OLE DB Connection Manager")

     If you do not see your data connection, you will have to create a new one
     in the Connection Manager by clicking **New**.

5. Back in the OLE DB Source Editor, select the **Name of the table or the view**, and click **OK**.

     ![]({{ site.baseurl }}/images/ssis_name_of_table.png "OLE DB Source Editor table name")

6. Select the table, and see what columns are in it.

    In this example, a single column, `c1`, is selected.

     ![]({{ site.baseurl }}/images/ssis_table_column.png "OLE DB Table column")


## Configure the ODBC Data Source Administrator

The ODBC Data Source Administrator has to be configured to connect to
ThoughtSpot and bring the table in.

1. Search for and open your **ODBC Data Sources (32-bit)** program.
2. Click the **System DSN** tab and select **ThoughtSpot_32**.
3. Click **Configure**.

    ![]({{ site.baseurl }}/images/ssis_system_dsn.png "ODBC Data Source Administrator: Configure")

4.  In the Client Configuration Dialog, enter the **Server IP** and **Server Port**.

      Enter any node IP that has Simba server running on it. In **Secondary Servers**, you must specify all node IPs, because ThoughtSpot must resolve to the server Simba runs on, and that server can change after an upgrade. Enter one server IP per line. The line return serves as a separator. Comma separated values are not supported.

5. Click **OK** twice to close the Client Configuration Dialog and the ODBC Data Source Administrator.

    ![]({{ site.baseurl }}/images/ssis_client_configuration_dialog.png "ODBC Data Source Administrator: Client Configuration Dialog")

## Create a file to take the feed

Now that you have set up your source, create the empty table in ThoughtSpot to
take this feed. SSIS does not allow you to create the table in ThoughtSpot. You
have to do this first in TQL. In Pentaho, it will create the table in
ThoughtSpot, but not in SSIS.

Create the ODBC Destination. Use the one you created and named in the ODBC Data
Source Administrator.

1. In the **SSIS Toolbox** tab, under **Other Destinations**, drag and drop **ODBC Destination** to the main window.
2. Drag the **blue arrow** to connect the OLE DB Source icon to the ODBC Destination icon.
3. Double click the **ODBC Destination** icon.

     ![]({{ site.baseurl }}/images/ssis_drag_connector.png "Creating the OLE DB Source and ODBC Destination connection")

4. Use ODBC Destination to set the **Batch size** for the connection in the Connection Manager tab. You can set the size to be up to 10,000.

     ![]({{ site.baseurl }}/images/ssis_batch_size.png "ODBC Destination: Batch size")

    If the load fails, the entire batch will be lost, and you will have to start that load over again.

5. Set the **Transaction Size** to match the total number of rows that are expected to be loaded in the load cycle.

    Your transaction size can be quite large—even spanning a million rows.
    However, too many small batches can leave the cluster in a rough state. This
    is because each batch acts as a separate transaction and creates a separate
    commit. Too many of these will slow down our system since each transaction
    creates a “data version” in our system. In Pentaho, the transaction size
    setting is called Commit Size.

6. Set the **Transaction Option** attribute of the Data Flow Task to **Supported**.
7. In the **Mappings** tab, validate the mapping or change it.

   You can have different column names in each database if you map them. Of
   course, they must be of the same or compatible datatype.

   ![]({{ site.baseurl }}/images/ssis_mappings.png "ODBC Destination: Mappings")

8.  Start the import job by clicking the **Start** button.

    You should see an animation indicating that the data is transferring over.
    When the import is complete, the number of successfully transferred rows is
    displayed.

     ![]({{ site.baseurl }}/images/ssis_start.png "Start import job")

     ![]({{ site.baseurl }}/images/ssis_success.png "Successful import job")

You can validate the import using TQL or from the **Data** screen.
