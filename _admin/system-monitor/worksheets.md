---
title: [System worksheets]
summary: "Learn about the system worksheets that ThoughtSpot provides."
last_updated: 11/18/2019
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Most of the monitoring information in **System Health** comes from system
worksheet which administrators can view, but not modify. The underlying tables
are protected system tables that cannot be accessed directly. However,
administrators can create new, custom monitoring reports from the worksheets.

## List the system worksheets

To list the system worksheets:

1. Go to the **Data** tab.
2. Choose **All** and **Worksheets**.
3. Enter `TS: ` in the search field.

   ![]({{ site.baseurl }}/images/su-worksheets.png)


## Summary of the worksheets

<table>
<colgroup>
   <col style="width:35%" />
   <col style="width:65%" />
</colgroup>
   <tr>
      <th>Worksheet</th>
      <th>Description</th>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS: BI Server</code></td>
      <td>
         Contains data related to the systems associated with underlying the
         ThoughtSpot BI server.  This includes database latency, browser clients, size
         of responses, and more.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS: Database</code></td>
      <td>
         Contains information related to the database cache and queries run on the database. For example, you could use this worksheet to see data on the query errors returned by the database.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS: Internal Capacity WS</code></td>
      <td>
         Describes cluster memory capacity by node over time.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS: Internal Table Wise Capacity WS</code></td>
      <td>
         Describes memory capacity by node, table name, shard count, and CSV replication over time.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS: Metrics</code></td>
      <td>
         Contains metrics by cluster and host over time.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS: Search</code></td>
      <td>
         Contains data related to the number of searches (queries) run in the system. This contains
         information such as uptime, host, and timestamps.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS: Service Resources</code></td>
      <td>
         Contains data related to cluster nodes including page faults, memory usage, memory failures, and more.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS: Table Info</code></td>
      <td>
         Describes the named tables by timestamp, row count, row shards, and row size.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS: Table Row Counts</code></td>
      <td>
         Describes the named tables by timestamp and row count.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS: Table Row Counts and Shards</code></td>
      <td>
         Describes the named tables by timestamp, row count, row shards, and row size.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS: Table Row Size</code></td>
      <td>
         Describes the named tables by timestamp and row size.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS: Table Shards</code></td>
      <td>
         Describes the named tables by timestamp and shard count.
      </td>
   </tr>
</table>
