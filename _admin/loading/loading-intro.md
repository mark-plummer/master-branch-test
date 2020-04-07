---
title: [Load and manage data]
summary: Learn about loading and managing data.
last_updated: 11/15/2019
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
The fastest and easiest way to load a new table is by importing it using the Web
browser. This is best for one time data loads of small tables which do not have
complex relationships to other tables. This method is limited to tables that are
under 50 MB (megabytes) in size.

Using ThoughtSpot Loader, you can script recurring loads and work with
multi-table schemas.

If your data already exists in another database with the schema you want to use
in ThoughtSpot, you can pull the schema and data in using the ODBC or JDBC
driver.

These are the methods you can use to load data, along with the benefits of each method:

|Method|Description|Benefits|
|------|-----------|--------|
|Connect to external databases (See https://docs.thoughtspot.com/6.0/data-integrate/embrace/embrace-intro.html)|Use the ThoughtSpot Embrace to read directly from the external databases.|Easy way to set up and enable the connection between ThoughtSpot and external databases. Users can send live query to the external databases,  without having to replicate data again in ThoughtSpot for analysis.|
|[Load data from the ThoughtSpot UI](load-from-web-browser.html#)|Use the ThoughtSpot Web interface to upload an Excel or CSV (comma separated values) file from your local machine.|Easy way to do a one-time data load of a small file (under 50MB).End users can upload their own data and explore it quickly.|
|[Import with the ThoughtSpot Loader (tsload)](use-data-importer.html#)|Use TQL and tsload to load data directly into the back end database that ThoughtSpot uses.|Best way to load large amounts of data or a schema with multiple tables.Can be scripted and used for recurring data loads, such as monthly sales results or daily logs. Can be integrated with an ETL solution for automation.|
|Use the ODBC/JDBC driver to connect to ThoughtSpot|Use the ODBC or JDBC client with your ETL tool. For information, see the ThoughtSpot Data Integration Guide.|Make use of an established ETL process and tool(s).Connect to ThoughtSpot using third party tools like SSIS. You don't need to define a schema to accept the data load.|

If you're uploading data through the Web interface, you can use a native Excel
file. If you want to use a CSV (comma separated values) or delimited file, or
you are loading using ThoughtSpot Loader, you must
[create CSV files with the data to be loaded](load-from-web-browser.html#create-a-csv-file) first.

{% include note.html content="End users will almost always work with worksheets and data they upload." %}

## Related Information

-   [Load CSV files with the UI]({{ site.baseurl }}/admin/loading/load-from-web-browser.html)  
-   Append data through the UI (https://docs.thoughtspot.com/6.0/admin/loading/append-data-from-a-web-browser.html)  
-   [Schema planning concepts]({{ site.baseurl }}/admin/loading/plan-schema.html)  
-   [Overview of schema building]({{ site.baseurl }}/admin/loading/create-schema.html)  
-   [Import CSV files with tsload]({{ site.baseurl }}/admin/loading/use-data-importer.html)  
-   [How to view a data schema]({{ site.baseurl }}/admin/loading/schema-viewer.html)  
