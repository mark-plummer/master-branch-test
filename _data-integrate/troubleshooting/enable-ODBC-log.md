---
title: [Enable ODBC Logs]
summary: "Learn how to troubleshoot ODBC connections."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
If you need more information in order to troubleshoot ODBC connections, you can
enable logging for ODBC on the workstation you use for connecting to ThoughtSpot.  There are two points where you can enable logging:

* the workstation where you run your ETL activities
* the server where the Simba service is running

On both workstation and servers, the verbosity of the log is controlled by the
`LogLevel` property. This property can be one of the following:

  * `0` or `LOG_OFF`: no logging occurs
  * `1` or `LOG_FATAL`: only log fatal errors
  * `2` or `LOG_ERROR`: log all errors
  * `3` or `LOG_WARNING`: log all errors and warnings
  * `4` or `LOG_INFO`: log all errors, warnings, and informational messages
  * `5` or `LOG_DEBUG`: log method entry and exit points and parameter values for debugging
  * `6` or `LOG_TRACE`: log all method entry points

Larger values include the information from lessor values. For example, if you
set `3` or `LOG_WARNING`, you log all warnings _and_ all errors.

## Enable ODBC logs on a Windows workstation

To enable ODBC logs on Windows:

1. Open the **ODBC Data Source Administrator** and select the **System DSN** tab.
2. Select your ThoughtSpot data source and click **Configure**.

     ![]({{ site.baseurl }}/images/odbc_logs_1.png "Configure ODBC data source")

3. In the Client Configuration Dialog, click **Logging**.

     ![]({{ site.baseurl }}/images/odbc_logs_2.png "Configure ODBC Logging")

4. Choose a **Log Level**, depending on what level of verbosity you want to show in the logs.

     ![]({{ site.baseurl }}/images/odbc_logs_3.png "Windows ODBC Logging Setup")

5. For **Log Directory:**, type in the fully qualified path where you want the logs to be saved.

     ![]({{ site.baseurl }}/images/odbc_logs_4.png "Windows ODBC Logging Setup")

6. Click **OK** to save your settings, and **OK** again, to dismiss the ODBC Data Source Administrator.
7. Run the ODBC load.
8. Locate the log file that was generated, and send it to ThoughtSpot Support with a description of the problem.


## Enable ODBC logs on a Linux workstation

To enable logging on Linux, follow these instructions:

1. Navigate to the directory where you installed ODBC.
2. Open the `odbc.ini` file in a text editor.

   This file is the registry and configuration file for ODBC.

3. Locate the `LogLevel` and `LogPath` properties.
4. Uncomment the properties.
5. Enter a value for  the `LogLevel` the.

   Acceptable values are from 1 to 6 with 6 being the most verbose.

7. Enter the fully qualified path for the  `LogPath` values.

   The log will be written here.  Your file will look similar to the following:
   Example for Linux 64-bit:

   ```
   [ThoughtSpot]
   Description = ThoughtSpot 64-bit ODBC Driver
   Driver = ThoughtSpot
   ServerList =  172.18.231.17 12345
   Locale = en-US
   ErrorMessagesPath = /home/admin/linux/ErrorMessages
   UseSsl = 0
   #SSLCertFile = # Set the SSL certificate file path. The certificate file can be obtained by extracting the SDK tarball
   LogLevel = 3 # Set log level to enable debug logging
   LogPath = /home/admin/odbc-logs # Set the debug log files path
   DATABASE = # Set the default database to connect to
   SCHEMA = # Set the default schema to connect to
   ```

8. Save and close the file.
9. To test the configuration, run the ODBC load and review the log files.


## Control logs from the Simba server

You may want to collect logs from the Simba service. Do the
following to procedure on every ThoughtSpot node running the Simba service.

1. SSH into the ThoughtSpot node.
2. Edit the `/etc/thoughtspot/linux.ini` file.

    ```
    ...
    [Driver]

    ## Note that this default DriverManagerEncoding of UTF-32 is for iODBC. unixODBC uses UTF-16 by default.
    ## If unixODBC was compiled with -DSQL_WCHART_CONVERT, then UTF-32 is the correct value.
    ## Execute 'odbc_config --cflags' to determine if you need UTF-32 or UTF-16 on unixODBC
    DriverManagerEncoding=UTF-32
    DriverLocale=en-US
    ErrorMessagesPath=/usr/home/linux/ErrorMessages/
    LogLevel=0
    LogNamespace=
    LogPath=

    ....
    ```

3. Uncomment the `LogLevel` setting.

    The `LogLevel` is the level of logging to capture (0-6).


4. Set `LogPath` to a directory to save the logs.

   The `LogPath` is the fully qualified path where ThoughtSpot should write the logs.

2. Work with ThoughtSpot Support to restart the Simba serivce.

    The node IP may change because of the restart. If this happens, repeat the entire procedure.
