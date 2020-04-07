---
title: [Overview board]
summary: The Overview pinboard provides useful information about your cluster.
last_updated: 11/18/2019
toc: true
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
The **Overview** pinboard summarizes essential information about your cluster
and its users. Choose **Admin > System Health > Overview** to see this pinboard.

## Understand system boards and pinboards

The **Overview** page includes system panels and standard ThoughtSpot <a
href="#" data-toggle="tooltip"
data-original-title='{{site.data.glossary.answer}}'>answers</a>.
The system charts are  generated in real time and rely on internal system
data. The answers rely on underlying system worksheets which are
available to ThoughtSpot administrators. The information in these worksheets
is updated hourly from internal tables that collect monitoring statistics.  

Each answer has a menu. You can present or copy the links to the system charts.
The answers have a subset of the ThoughtSpot answer menu. You can use the menu
to do additional actions such as download the answer or present information
about your ThoughtSpot cluster. While you can interact with and change the
search, you cannot save changes to the underlying query.

You can also interact with the answers, drilling into them to explore the detail
as with any other pinboard answer.

To find out how a particular answer was created, do the
following:

1. Select **Edit** from the panel menu.

   ![]({{ site.baseurl }}/images/panel-data.png "Menu of panel")

   This displays a **Search** bar.

2. Investigate the components of the search as you would normally.

    ![]({{ site.baseurl }}/images/admin-panel-details.png)



## Cluster Summary

This system panel contains basic information about your cluster.  The **NUMBER OF
NODES** is the number of installed nodes. This doesn't reflect the active nodes
which may be more or less.

This summary includes the **LAST SNAPSHOT TIME** it reflects whether regular
snapshots of your cluster are collected. This value should update regularly in
real time. If you do not see it change or empty, you should check your cluster
snapshot policy using the `tscli` command:  

```
$ tscli snapshot-policy show
schedule {
  period {
    number: 1
    unit: HOUR
  }
  retention_policy {
    bucket {
      time {
        number: 1
        unit: HOUR
      }
      capacity: 3
    }
    bucket {
      time {
        number: 4
        unit: HOUR
      }
      capacity: 2
    }
  }
  offset_minutes_from_sunday_midnight: 0
}
enabled: false
```

You can see this policy is disabled, which is a problem. Production clusters
should enable the default snapshot policy. When you show or enable the snapshot
policy, you can see your `tscli` command reflected in the **Configuration
Events** panel on this same page.

### Display the features used in a cluster configuration

1. Log in to the ThoughtSpot cluster as the `admin` user.
2. Use the `tscli feature` subcommand to display your current configuration.

    ```
    $ tscli feature get-all-config
    +---------------------------------+----------+---------------+
    |              NAME               |  STATUS  | CONFIGURATION |
    +---------------------------------+----------+---------------+
    | Firewall                        | Disabled |               |
    | Saml                            | Disabled |               |
    | Ldap                            | Disabled |               |
    | CustomBranding                  | Disabled |               |
    | CustomBrandingFontCustomization | Disabled |               |
    | DataConnect                     | Disabled |               |
    | RLS                             | Enabled  |               |
    | Callhome                        | Enabled  |               |
    | SSHTunnel                       | Enabled  |               |
    | Fileserver                      | Disabled |               |
    +---------------------------------+----------+---------------+
    ```

## Relational Data Cache

This section reports real-time information about tables in your cluster.
Worksheet data is not included.

| Value  |  Description |
|---|---|
|  **TABLES LOADED** | Number of currently loaded tables.  |
|  **TABLES BEING UPDATED** | Number of table loads in-progress. |
|  **NEW TABLES BEING LOADED** | Number of tables being loaded for the first time.  |
|  **ROWS** | Number of rows combined across all tables in ThoughtSpot.  |

## Relational Search Engine


| Value  |  Description |
|---|---|
|  **TABLES SEARCHABLE** | Tables that are indexed and can be searched.  |
|  **TABLES BEING INDEXED** | Total of in-progress table indexing. |
|  **NEW TABLES BEING INDEXED** | Total of first-time, in-progress table indexing.  |
|  **TOKENS SEARCHABLE** | Number of <a href="#" data-toggle="tooltip" data-original-title='{% for entry in site.data.glossary.entries %}{% if entry.word == "token" %}{{ entry.definition }}{% endif %}{% endfor %}'>tokens</a> of all table (combined) indexed in ThoughtSpot. |


## Critical Alerts

Displays critical and warning alerts. This includes when an alert was generated
and from which service and machine. Administrators can get a custom report by
issuing a `tscli alert list` on the appliance:

```
tscli alert list --since 4w
```

The critical alerts you can encounter in this display are the following:

{% for item in site.data.extract-alerts.alerts %}  
  {% if item.type == "CRITICAL" %}

* `{{item.id}}`

  **Msg**: `{{item.msg}}`

  {{item.description}}
   {% endif %}
 {% unless forloop.last %}
 {% endunless %}
{% endfor %}

The possible alert types are `CRITICAL`, `WARNING`, `ERROR`, and `INFO`. For a
full reference, see the [Alert code reference]({{ site.baseurl
}}/reference/alerts-reference.html#).

## Space Utilization

The **Space Utilization** chart is one of the available charts for you to use
when checking the cluster overview. This line chart displays the total capacity
and estimated used capacity over time.

 ![]({{ site.baseurl }}/images/memory_usage_chart.png "Space Utilization chart example")

The x-axis is by time and the y-axis measures the size in GB. You can zoom in
and see daily or hourly utilization data. So, in the **Space Utilization** chart
above, the green line shows the amount of capacity in use in the system, while
the red line shows the total capacity. An increase in the red line at the end of
a time period indicates the addition of extra hardware, resulting in increased
capacity.

The query for this answer is the following:


```
day of timestamp
total capacity (gb)
total used space (gb)
daily
last 90 days last 25 hours
total capacity (gb) > 0
total used space (gb) > 0
```

The chart relies on the `TS: Internal Table Wise Capacity WS` worksheet. It
tracks  total used space, which consists of raw uncompressed data, including
replication.

## Monthly Active Users

This chart shows the number of active users in the system over the last four months, and during the current month. An active user is defined as a user who has logged in at least one time in the defined time interval, in this case months.

The query for this answer is the following:

```
monthly
last 4 months this month
active users
user != {null}
```

This query relies on the `TS: BI server` worksheet.

## Monthly Ad-hoc Searches

Number of ad-hoc searches (queries) issued per month. An ad-hoc query is defined as any search or change to a search that builds a new answer (result). An ad-hoc search can also be generated through SpotIQ or another UI/API interaction.

ThoughtSpot considers all of the following as ad-hoc searches (queries):

* User edits tokens (boxed terms) in the search bar.
* User opens an existing saved answer and makes changes to tokens in the search bar.
* User opens an existing saved pinboard, edits a visualization, and makes change to the search tokens.
* Searches initiated by an API call for data with runtime filters

It is not considered a search (query) in this context if a user opens an existing saved
aggregated worksheet and makes changes to its underlying
query.

The query for this answer is the following:

```
ad-hoc search
user action = 'answer_pinboard_context' 'answer_saved' 'answer_unsaved'
monthly
last 4 months this month
```

This answer relies on data from the `TS: BI Server` worksheet.

## Monthly Pinboard Views

Number of times a saved pinboard is viewed by a user. These scenarios are
considered pinboard views:

* User opens an existing saved pinboard.
* User opens an embedded pinboard from a URL.
* Pinboard data is accessed using the an API.

These scenarios are not considered pinboard views:

* A user opens SpotIQ tab pinboards.
* A user opens admin tab pinboards.
* The system loads a pinboard on the homepage.
* The system loads the 'learn how to use ThoughtSpot' pinboard.

The query underlying this answer is:

```
pinboard views
user action = 'pinboard_embed_view' 'pinboard_tspublic_no_runtime_filter' 'pinboard_tspublic_runtime_filter' 'pinboard_view'
monthly
last 4 months this month
```

The query uses the `TS: BI Server` data source.

## Top Users Last Month

This answer shows the top ThoughtSpot users ranked by number of actions
the users performed in the last 30 days. The possible user actions include:

{% include content/user-actions.md %}

The query underlying this answer is:

```
top 10
ranked by user actions
user action != 'invalid'
user != {null}
user
last 30 days today
```
The query uses the `TS: BI Server` data source.

## Top Pinboards Last Month

This answer shows the top ThoughtSpot users ranked by number of pinboard actions the user
performed in the last 30 days. The possible user actions include:

* User opens an existing saved pinboard ('pinboard_view').
* User opens an embedded pinboard from a URL ('pinboard_embed_view' ).
* Pinboard data is accessed using an API ('pinboard_tspublic_no_runtime_filter' or 'pinboard_tspublic_runtime_filter').


The query underlying this answer is:

```
top 10
ranked by pinboard views
user action = 'pinboard_embed_view' 'pinboard_tspublic_no_runtime_filter' 'pinboard_tspublic_runtime_filter' 'pinboard_view'
pinboard != {null}
pinboard
last 30 days today

```
The query uses the `TS: BI Server` data source.

## Configuration Events

This system answer displays recent events that changed the configuration of the
system. This panel displays configuration events related to:

<table>
    <colgroup>
    <col width="25%" />
    <col width="60%" />
    </colgroup>
      <tbody>
       <tr>
        <th>
        Cluster Configuration
        </th>
        <td>Reports configuration actions from the <code>tscli</code> and <code>tql</code> commands. </td>
       </tr>
       <tr>
        <th>
         Metadata Management
        </th>
        <td>Events related to metadata such as column names, column visibility, column and data definition, column rank and so forth.</td>
       </tr>
       <tr>
        <th>
         User Management
        </th>
        <td>Events related to creating, updating, or adding new users and groups. </td>
       </tr>
       </tbody>
    </table>

For a more detailed list, including the user that issued a command, you can use
the `tscli event list` command. Administrators can `ssh` into the cluster and
specify a time period or even a type of command to include.

```
[admin@testsystem ~]$ tscli event list --since 3d
+-------------------------------+-----------------------+----------------------------+
|             DATE              |       USER            |           SUMMARY          |
+-------------------------------+-----------------------+----------------------------+
| 2018-03-06 11:57:10 -0800 PST |eadmin@thoughtspot.int | User Management: User      |
|                               |                       | "guest_1" updated          |
| 2018-03-06 11:48:10 -0800 PST |admin                  | tscli node ls              |
| 2018-03-06 11:17:04 -0800 PST |eadmin@thoughtspot.int | Metadata Management:       |
|                               |                       | Metadata object "Number of |
|                               |                       | Opportunity                |
|                               |                       | AE and Stage" of type      |
...
```

## About deprecated boards

There are a number of deprecated boards on this page. They are there to support
older installations that relied on them. New installations should not use or
rely on deprecated boards. Older installations that have used these boards in
some way should use the new boards and remove any dependencies.

## Related information

[`tscli logs` command]({{ site.baseurl }}/reference/tscli-command-ref.html#logs)
