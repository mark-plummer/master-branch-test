---
title: [Introduction to Data Integration]
last_updated: tbd
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
This guide explains how to integrate ThoughtSpot with other data sources for
loading data. It also includes information on installing and using the
ThoughtSpot clients (ODBC, JDBC, and more).

## ThoughtSpot Clients

ThoughtSpot provides certified clients to help you load data easily from your
ETL tool or another database. These include ODBC and JDBC drivers.

You can obtain the ThoughtSpot client downloads from the Help Center. Always use
the version of the ThoughtSpot clients that corresponds with the version of
ThoughtSpot that you are running. When upgrading, make sure to upgrade your
clients as well.

{% include important.html content="The ETL tool must add a data transformation
step if the source column data type does not exactly match the target's,
ThoughtSpot's, column data type. The driver does not do any implicit
conversions." %}

## Methods for loading data

There are several ways to load data into ThoughtSpot, depending on your goals
and where the data is located. Always consider your requirements for
recurring loads when planning how best to bring the data into ThoughtSpot.

Here are the options, with information on where to find the documentation for
each method:

<table>
<colgroup>
   <col style="width:30%" />
   <col style="width:70%" />
</colgroup>
  <thead>
    <tr>
      <th>Method</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>ThoughtSpot Loader (tsload)</td>
      <td>ThoughtSpot Loader is a command line tool to load CSV files into an existing database schema in ThoughtSpot. This is the fastest way to load extremely large amounts of data, and it can be run in parallel. You can also use this method to script recurring loads. See the ThoughtSpot Administrator Guide for details.</td>
    </tr>
    <tr>
      <td>User Data Import</td>
      <td>Users can upload a spreadsheet through the web interface with User Data Import. This is useful for giving everyone easy access to loading small amounts of their own data. See the ThoughtSpot Administrator Guide for details.</td>
    </tr>
    <tr>
      <td><a href="{{"/data-integrate/clients/about-odbc.html" | prepend: site.baseurl }}">ODBC</a></td>
      <td>ThoughtSpot provides an ODBC (Open Database Connectivity) driver to enable transferring data from your ETL tool into ThoughtSpot.</td>
    </tr>
    <tr>
      <td><a href="{{"/data-integrate/clients/about-jdbc-driver.html" | prepend: site.baseurl }}">JDBC</a></td>
      <td>ThoughtSpot provides a JDBC (Java Database Connectivity) driver to enable transferring data from your ETL tool into ThoughtSpot.</td>
    </tr>
    <tr>
      <td><a href="{{"/data-integrate/clients/set-up-the-odbc-driver-using-ssis.html" | prepend: site.baseurl }}">Microsoft SSIS (SQL Server Integration Services)</a></td>
      <td>You can use the ODBC driver to connect to SSIS and import data into ThoughtSpot. Basic instructions are included in this guide.</td>
    </tr>
    <tr>
      <td><a href="{{"/data-integrate/clients/set-up-the-jdbc-driver-for-pentaho.html" | prepend: site.baseurl}}">Connect to Pentaho</a></td>
      <td>You can use the JDBC driver to connect to Pentaho and import data into ThoughtSpot. Basic instructions are included in this guide.</td>
    </tr>
  </tbody>
</table>


## Where to go next

-   **[Server-side prerequisites for using JDBC/ODBC to import data]({{ site.baseurl }}/data-integrate/introduction/jdbc-odbc-prereqs.html)**  
You must follow setup prerequisites for importing data using JDBC/ODBC.
-   **[About the ODBC Driver]({{ site.baseurl }}/data-integrate/clients/about-odbc.html)**  
You can use the ThoughtSpot ODBC driver to bring data into ThoughtSpot from your ETL tool or database.
-   **[About the JDBC Driver]({{ site.baseurl }}/data-integrate/clients/about-jdbc-driver.html)**  
 Java Database Connectivity (JDBC) is a Java standard API that allows applications to interact with databases in a standard manner. ThoughtSpot has JDBC support through a JDBC driver that we provide.
