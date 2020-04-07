---
title: [Data board]
last_updated: 11/18/2019
summary: "The Data page shows all the stored tables with details on the last update
time, time taken for auto-indexing, number of rows, and so forth."
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

 ![]({{ site.baseurl }}/images/control_center_data.png "Partial view of the System Health center: Data")

 You can click a column name to sort by table name. This table information is
 based on an underlying system data. You can present it or copy the link, but
 you cannot access the underlying query.

## Database Status

The **Database Status** column can have the following possible values:

<table>
    <colgroup>
    <col width="25%" />
    <col width="60%" />
    </colgroup>
    <thead>
       <tr class="header">
        <th>Status</th>
        <th>Meaning</th>
       </tr>
      </thead>
      <tbody>
       <tr>
        <td>
         <p><code style="highlighter-rouge">READY</code></p>
        </td>
        <td>The data has been loaded.</td>
       </tr>
       <tr>
        <td><code style="highlighter-rouge">IN PROGRESS</code></td>
        <td>The data is still being loaded.</td>
       </tr>
       <tr>
        <td><code style="highlighter-rouge">STALE</code></td>
        <td>The data is not up to date.</td>
       </tr>
       <tr>
        <td><code style="highlighter-rouge">ERROR</code></td>
        <td>The table is invalid. Call Customer Support.</td>
       </tr>
       </tbody>
    </table>

## Replication Status

The **Replicated** column indicates if the table has been replicated or sharded. This can be used in conjunction with the **Total Shards** column to see how your data is distributed.

If the table is replicated on a multi node system, the **Used Capacity (MB)** column will indicate the total space used on all nodes. For example, a 10MB table replicated on a 4 node system will show 40MB used capacity.

## Search Status

The **Search Status** column can have the following possible values:


<table>
    <colgroup>
    <col width="25%" />
    <col width="60%" />
    </colgroup>
    <thead>
       <tr class="header">
        <th>Status</th>
        <th>Meaning</th>
       </tr>
      </thead>
      <tbody>
    <tr>
     <td>
      <p><code style="highlighter-rouge">READY</code></p>
     </td>
     <td>The data is up to date and searchable.</td>
    </tr>
    <tr>
     <td>
      <p><code style="highlighter-rouge">NOT READY</code></p>
     </td>
     <td>The data is not ready to be searched.</td>
    </tr>
    <tr>
     <td>
      <p><code style="highlighter-rouge">DELETING INDEX</code></p>
     </td>
     <td>The table has already been deleted, but the index still exists due to the latency
      between the database and search engine.</td>
    </tr>
    <tr>
     <td><code style="highlighter-rouge">INDEXING DISABLED</code></td>
     <td>Either too many tokens exist in a column for it to be indexed, or indexing has been
      disabled manually.</td>
    </tr>
    <tr>
     <td><code style="highlighter-rouge">CREATING INDEX</code></td>
     <td>The index is being created.</td>
    </tr>
    <tr>
     <td><code style="highlighter-rouge">UPDATING INDEX</code></td>
     <td>A change has been made to indexing or the data, and the index is being updated to
      reflect it.</td>
    </tr>
    </tbody>
 </table>
