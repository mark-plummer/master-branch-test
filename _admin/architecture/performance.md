---
title: [Performance considerations]
last_updated: 03/11/2020
summary: "Make sure you understand the performance considerations in your installation."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
ThoughtSpot configuration and licensing varies by memory availability. Other considerations also impact the performance of your solution. Because some solutions perform better than others, think about the following issues before implementation.

Nodes that have 250GB of memory capacity perform optimally with less than 250GB of data, and less than 250 million rows of data in each node in a ThoughtSpot cluster. Smaller nodes, like nodes with 200GB memory capacity, serve proportionally smaller loads.

To optimize performance for more complex schemas, we recommend fewer rows of data for each node.
To reduce the total amount of data and rows of data, we recommend the following approaches:

- Limit the data range to the relevant years or months.
- Combine long and narrow tables into wider tables whenever possible.

## Data Boundaries

Total rows in a result of a join can have an impact on performance. In general, we recommend that you have fewer than 10 billion rows in a many-to-many join. Also, consider these boundaries:

Contact ThoughtSpot support for guidance on boundaries for the following:
- Maximum number of rows that can be downloaded
- Size in CSV format
- Total number of rows across all tables
- Many-to-Many (Generic join cardinality)
- Load frequency

## Worksheet Boundaries

Worksheets must have less than 1000 columns. For aggregated worksheets, follow these guidelines:

* Number of columns should be less than 50
* Number of rows should be less than 10 millions

You can use an ETL process to circumvent these limitations. Speak with ThoughtSpot support to learn more.

### Aggregated Worksheets and Joins

To join an aggregated worksheet with a base table, you must configure your installation to allow this behavior.
* The aggregated worksheet cannot use more than 5 component tables.
* The number of rows in the final aggregated worksheet cannot be greater than 1000.

### Chasm Trap Worksheets

For chasm trap scenarios where two or more fact tables join through a shared dimension, we recommend the following boundaries:

|Description |Boundary|
|-------------------------|--------------------|
|Maximum number of fact tables in a worksheet	|5|
|Maximum number of shared dimensions	|2|
|Maximum number of rows in a _non_ co-sharded shared dimension table of chasm trap	|1B|
|Maximum number of rows in a co-sharded shared dimension table of chasm trap	| 1B |

## Row-level Security Boundaries

Maximum number of unique RLS rules with search data suggestions should not exceed 15K.

## Scheduled Pinboards

For ideal performance of scheduled pinboards, do not exceed 50 scheduled pinboard jobs.
