---
title: [Data Caching]

last_updated: tbd
summary: "ThoughtSpot does all analysis against data in memory to help achieve
fast results across millions and billions of records of data."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
ThoughtSpot caches data as relational tables in memory. The tables can be
sourced from different data sources and joined together. ThoughtSpot has several approaches
for getting data into the cluster.

![]({{ site.baseurl }}/images/DataCaching.png)

## JDBC and ODBC Drivers ##
ThoughtSpot provides a JDBC and ODBC driver that can be used to write data to
ThoughtSpot. This is useful for customers who already have an existing
ETL process or tool, and want to extend it to populate the ThoughtSpot cache.

JDBC and ODBC drivers are appropriate under the following circumstances:
<ul>
<li>have an ETL load, such as Informatica, SSIS, and so on</li>
<li>have available resources to create and manage ETL</li>
<li>have smaller daily loads</li>
</ul>

## tsload ##
You can use the `tsload` command line tool to bulk load delimited data with very
high throughput. Finally, individual users can upload smaller (< 50MB)
spreadsheets or delimited files.

We recommend the tsload approach in the following cases:
<ul>
<li>initial data load</li>
<li>JDBC or ODBC drivers are not available</li>
<li>there are large recurring daily loads</li>
<li>for higher throughput; this can add I/O costs</li>
</ul>


## Choosing a Data Caching Strategy ##

The approach you choose depends on your environment and data needs. There are, of course, tradeoffs between different data caching options.

Many implementations use a variety of approaches. For example, a solution with a
large amount of initial data and smaller daily increments might use tsload to
load the initial data, and then use the JDBC driver with an ETL tool for
incremental loads.
