---
title: [Troubleshooting Data Integrations]

last_updated: tbd
summary: "Learn how to fix connection issues."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
This section can help if you're having trouble creating a connection or need to
find out more information about what is going on with ODBC or JDBC.

The information contained here is very basic, and mostly about how to enable
logs on the client side. If you need more detailed troubleshooting information
or help, please contact ThoughtSpot Support.

-   **[Enable ODBC Logs]({{ site.baseurl }}/data-integrate/troubleshooting/enable-ODBC-log.html)**  
If you need more information in order to troubleshoot ODBC connections, you can enable logging for ODBC.
-   **[Enable JDBC Logs]({{ site.baseurl }}/data-integrate/troubleshooting/JDBC-logging.html)**  
To enable logging for JDBC, add the logging parameters to the connect string. Logs are stored on ThoughtSpot.
-   **[Schema not found error  with ODBC]({{ site.baseurl }}/data-integrate/troubleshooting/schema-not-found.html)**  
When connecting with ODBC, you need to specify both the database and schema to connect to. If no schema is supplied, you will get an error indicating that the schema could not be found.
-   **[How to improve throughput of the load]({{ site.baseurl }}/data-integrate/troubleshooting/how-to-improve-throughput-of-the-load.html)**  
The transaction/commit size value can improve the throughput of the load when setting up the ODBC Driver.
-   **[ODBC tracing on Windows]({{ site.baseurl }}/data-integrate/troubleshooting/windows-odbc-tracing.html)**  
Using logs to aid in troubleshooting.
