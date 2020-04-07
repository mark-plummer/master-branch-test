---
title: [Set up the JDBC driver for Pentaho]

last_updated: 11/19/2019
summary: "Use Pentaho to create a JDBC connection to ThoughtSpot."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

You can use the Pentaho Data Integration (PDI) to create a JDBC connection. The
Pentaho Data Integration (PDI) suite is a comprehensive data integration and
business analytics platform. You can use it to create a JDBC connection to
ThoughtSpot.

PDI consists of a core data integration (ETL) engine and GUI applications that
allow you to define data integration jobs and transformations. Through Pentaho,
we primarily use the JDBC driver to set up a connection. The process is not as
complicated as with SSIS, and is much more lenient.

Community and enterprise editions of PDI are available. Using the community
edition is sufficient, though you may use the enterprise edition, which is
subscription based, and therefore contains extra features and provides technical
support.

Use JDBC to connect to the ThoughtSpot Simba server from Pentaho. The connection will
be made between a new ThoughtSpot Table Input and Output objects.

## Check the ThoughtSpot IP and the simba_server status

{% include content/simba-server-start.md %}

## Install the Simba drivers in the Pentaho directories

Before starting the Pentaho Data Integration (PDI) client and creating the
connection, ensure that the Simba JDBC client libraries are present in the
Pentaho client/server machines. This will ensure that the drivers picked up at
runtime.

1. Log in to the local machine where you have alredy installed the Pentaho Data Integration (PDI) client.
2. Click [**Here**]({{ site.baseurl }}/release/downloads.html) to download the JDBC driver.
3. Click **JDBC Driver** to download the file `thoughtspot_jdbc<version>.jar`.
4. Copy the `thoughtspot_jdbc<version>.jar` file to the following directories:

    -   `<Pentaho_install_dir>/server/data-integration-server/tomcat/webapps/pentaho-di/WED-INF/lib/`
    -   `<Pentaho_install_dir>/design-tools/data-integration/lib/`
    -   `<Pentaho_install_dir>/server/data-integration-server/tomcat/lib/`
    -   `<Pentaho_install_dir>/design-tools/data-integration/plugins/spoon/agile-bi/lib/`


## Set up the driver

This section explains how to set up the JDBC driver using Pentaho. These
instructions use Spoon, the graphical transformation and job designer associated
with the PDI suite. It is also known as the Kettle project.


### Create a transformation

Do the following on your ETL workstation with the Pentaho client:

1. Open the PDI client.

    ```
    ./spoon.sh &>/dev/null &
    ```

2. Right click **View > Transformations** tab.
3. Click **New** to create a new transformation.

    ![]({{ site.baseurl }}/images/new_transformation_pentaho.png "Create a new transformation")

4. Click **Input** under the **Design** tab to expand it.
5. Drag and drop **CSV File Input** to the **Transformation** window.

   This opens a new CSV file.

   ![]({{ site.baseurl }}/images/csv_file_input_pentaho.png "Input and CSV File Input")

6. Double-click the **CSV File Input** icon to open the **CSV Input** dialog .
7. Name the **Step**.
8. Click **Browse** next to the **Filename** field and provide the file you want to read from.
9. Click **OK**.

     ![]({{ site.baseurl }}/images/browse_filename_pentaho.png "Step name and browse for Filename")

10. In the CSV Input dialog, click **Get Fields**.
11. Enter the number of lines you would like to sample in the Sample size dialog.

   The default setting is 100.

12. Click **OK** when you are ready.

     ![]({{ site.baseurl }}/images/sample_size_fields_pentaho.png "Get Fields and Sample size")

    The tool reads the file and suggests the field name and type.

     ![]({{ site.baseurl }}/images/scan_results_pentaho.png "Scan results")

13. Click **Preview** to preview the data.
14. Enter the number of rows to preview in the **Preview size** dialog.

    The default setting is 1000. Click **OK** to start the transformation in preview.

     ![]({{ site.baseurl }}/images/preview_size_pentaho.png "Preview size")

15. Examine the preview data, then click **Close**.

      You may want to verify that you are able to read the data using the SQL
      query from ThoughtSpot.

     ![]({{ site.baseurl }}/images/examine_preview_data_pentaho.png "Examine preview data")

16. Click **OK** in the CSV Input dialog to confirm your CSV input settings.


### Define the Output

1. Click **Design > Output**.
2. Drag and drop **Table output** to the **Transformation** window.

    ![]({{ site.baseurl }}/images/table_output_pentaho.png "Output and Table output")

3. Double click the **Table output** icon to open the Table output dialog.
4. Enter a **Step name**.
5. Click **New** to create a new connection.

     ![]({{ site.baseurl }}/images/new_connection_pentaho.png "Step name and New Connection")

6. Enter or select the following information in the Database Connection dialog:

    <table>
    <tr>
       <th>Field</th>
       <th>Description</th>
    </tr>
    <tr>
       <th>Connection Name</th>
       <td>Any string.</td>
    </tr>
    <tr>
       <th>Connection Type</th>
       <td>Generic database</td>
    </tr>
    <tr>
       <th>Access</th>
       <td>Native (JDBC)</td>
    </tr>
    <tr>
       <th>Custom Connection URL</th>
       <td><code>jdbc:simba://SERVER_IP:12345;Database=DATABASE_or_SCHEMA_NAME</code></code>
       <p>The IP is a node in your ThoughtSpot cluster. The name or schema of the database you want to connect to. Use TQL to create a database name if needed. Ensure that there are no leading or trailing spaces.</p></td>
    </tr>
    <tr>
       <th>Custom Driver Class Name</th>
       <td><code>com.simba.client.core.jdbc4.JDBC4Driver</code>
       <p>Ensure that there are no leading or trailing spaces.</p></td>
    </tr>
    <tr>
       <th>User Name</th>
       <td>A ThoughtSpot username. If you leave this empty, you are prompted for it at connection time. This user should have **Data Management** privileges on ThoughtSpot.</td>
    </tr>
    <tr>
       <th>Password</th>
       <td>The password for the **User Name**. If you leave this empty, you are prompted for it at connection time.</td>
    </tr>
    </table>

    ![]({{ site.baseurl }}/images/database_connection_pentaho.png "Database Connection properties")

16. Click **Test** to test your database connection.

17. If you are able to make a successful connection to the ThoughtSpot Simba Server, click **OK**.

     ![]({{ site.baseurl }}/images/database_connection_test_pentaho.png "Database Connection Test")

18. Click **OK** in the Database Connection dialog to create the new connection.

### Import data

1. In the **Table output** dialog, select the connection you just created.
2. Click **Browse** next to the **Target schema** field and select your **Target schema**.
3. Click **OK** when you are done.
4. Connect the **Input CSV** icon to the **Table output** icon by clicking and dragging an arrow.
5. When prompted, choose **Main output of step**.

     ![]({{ site.baseurl }}/images/main_output_of_step_pentaho.png "Connecting the Input CSV with the Table output")

6. Double click the **Table output** icon to reopen the **Table output** dialog.
7. Enter a **Target table name**.
8. Click **SQL**.

    ![]({{ site.baseurl }}/images/target_table_name_pentaho.png "Target table name")

9. In the **Simple SQL editor** dialog, click **Execute**.

    The system processes and then displays the results of the SQL statements.

    ![]({{ site.baseurl }}/images/simple_sql_editor.png "Simple SQL editor")

10. Close all open dialogs.

11. Click the **Play** button at the top of the **Transformation** window to execute the transformation.

    ![]({{ site.baseurl }}/images/execute_the_transformation_pentaho.png "Execute the transformation")

12. Click **Launch** in the **Execute a transformation** dialog.

    ![]({{ site.baseurl }}/images/launch_a_transformation_pentaho.png "Launch the transformation")

    The system prompts you to save it if you have not already.

13. View the **Execution Results**.

    ![]({{ site.baseurl }}/images/execution_results_pentaho.png "Execution Results")
