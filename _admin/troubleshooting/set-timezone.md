---
title: [Check the timezone]
summary: Learn how to check the timezone your ThoughtSpot installation is running on.
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
ThoughtSpot comes configured with the timezone where it is to be installed. Data
is imported based on the timezone of the node from which `tsload` or `tql` is
run. To see the timezone your ThoughtSpot node is running under, log in to the
server as the `thoughtspot` user and run the `date` command:

```
[thoughtspot@ts.server etc]$ date
Tue Feb 20 09:07:04 PST 2018
```

To see the current timezone used by the ThoughtSpot application, choose
**Admin > Cluster Manager** and review the **Cluster Details**:

![]({{ site.baseurl }}/images/app-timezone.png "Report problem")


The timezones should match.

Sometimes the timezone that is listed by `date` is not the active timezone for
the ThoughtSpot application and the application needs to be reset. If you need
to change the timezone, [contact ThoughtSpot Support]({{ site.baseurl
}}/admin/misc/contact.html#) and they will change the timezone for you. You may
need to change the timezone if you move the server between data centers.
