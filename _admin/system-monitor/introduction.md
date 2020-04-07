---
title: [Introduction to monitoring]
summary: "Learn how to monitor your system."
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
System monitoring tools in ThoughtSpot include an **Admin > System Health** page and system logs. Additionally, ThoughtSpot provides several worksheets and
out-of-the-box system monitoring pinboards. From these worksheets, you can
create your own custom visualizations and pinboards.  This page introduces these features and directs you towards more detailed information.

## System Health center

The ThoughtSpot application includes a **System Health** center, for easy monitoring
of usage, alerts, events and general cluster health. You view the System Health
Center by choosing the **Admin** icon and then selecting **System Health**.

![]({{ site.baseurl }}/images/control_center_overview.png "System Health center: Overview")

Only users with administrative privileges can view the **System Health** center.
However, administrative users can present to others the information that
displays in the **System Health** center.

Administrators can also create their own, custom boards that reflect system data
in ways that are meaningful to specific departments or groups. For more
information, see the following documentation:

* [Health Overview board]({{ site.baseurl }}/admin/system-monitor/overview.html)
* [Data board]({{ site.baseurl }}/admin/system-monitor/data.html)
* [Cluster Manager board]({{ site.baseurl }}/admin/system-monitor/cluster-manager.html)
* [Alerts and Events board]({{ site.baseurl }}/admin/system-monitor/cluster-manager.html)
* [System worksheets]({{ site.baseurl }}/admin/system-monitor/worksheets.html)
* [System pinboards]({{ site.baseurl }}/admin/system-monitor/monitor-pinboards.html)

Much of the data presented by these boards is also available through [`tscli` commands]({{ site.baseurl }}/reference/tscli-command-ref.html).

## Log files

Many of the administration commands output logging information to log files. The
logs get written into the fixed directory `/export/logs`, with a sub-directory for
each subsystem. The individual log directories are the following:

- `/export/logs/orion`
- `/export/logs/oreo`
- `/export/logs/hadoop`
- `/export/logs/zookeeper`

You can also view [additional topics that also touch on [log files]({{site.baseurl}}/tags/tag_logs.html) throughout the documentation.

## System monitoring notifications

You can configure ThoughtSpot to send emails to addresses you specify with
monitoring reports and a cluster heartbeat. Follow these steps to [Set up monitoring]({{ site.baseurl }}/admin/setup/set-up-monitoring.html#).
