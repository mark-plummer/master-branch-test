---
title: [System pinboards]
summary: "ThoughtSpot provides several pinboards that help with system monitoring."
last_updated: 11/18/2019
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
There are several system monitoring pinboards in ThoughtSpot that provide
answers for system status and resource usage questions. The information in these
pinboards are updated hourly from internal data sources that collect monitoring
statistics.

 ![]({{ site.baseurl }}/images/resource_usage_pinboard.png "Example of a system monitoring pinboard")

 Only users with administrative privilege can view the monitoring pinboards.
 They are based on worksheets, which administrators can view, but not modify.
 However, you can create new monitoring pinboards from the worksheets.

## List system pinboards

To list these system pinboards:

1. Go to the **Pinboards** tab.
2. Choose **All**.
3. Enter `TS: ` in the search field.

   ![]({{ site.baseurl }}/images/su-pinboards.png)

## Summary of system pinboards

<table>
<colgroup>
   <col style="width:35%" />
   <col style="width:65%" />
</colgroup>
   <tr>
      <th>Pinboard</th>
      <th>Description</th>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">Learn how to use ThoughtSpot</code></td>
      <td>
         Contains search replays created in the system.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS Stats: Alert Detail</code></td>
      <td>
         Combines alerts, notification events, and configuration events boards.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS Stats: Cluster Detail</code></td>
      <td>
         Contains cluster details, logs, snapshots, and latency data.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS Stats: System Information and Usage</code></td>
      <td>
         Replicates the <strong>Admin > System Health > Overview</strong> page.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS Stats: Latency Visualizations</code></td>
      <td>
         Latency on servers and <a href="#" data-toggle="tooltip" data-original-title='{% for entry in site.data.glossary.entries %}{% if entry.word == "impression" %}{{ entry.definition }}{% endif %}{% endfor %}
'>impression</a> counts. This data comes from the <code>TS: BI Server</code> worksheet.
      </td>
   </tr>
   <tr>
      <td><code class="highlighter-rouge">TS Stats: Table Status</code></td>
      <td>
         Replicates the <strong>Data</strong> board.
      </td>
   </tr>
  </table>


## About deprecated boards

The deprecated boards (`TS status: Usage - Deprecated` and `TS StaTS: Queries --
Deprecated`) are there to support older installations. New installations should
not use or rely on deprecated boards. Older installations that have used these
boards in some way should use the new boards and remove any dependencies.
