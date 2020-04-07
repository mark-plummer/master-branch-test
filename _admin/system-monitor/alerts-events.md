---
title: [Alerts and Events board]
last_updated: 11/18/2019
summary: "The Alerts and Events section shows notifications, alerts, and an audit
trail of cluster configuration changes."
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---


 ![]({{ site.baseurl }}/images/contro_center_configuration_events.png "Partial view of the System Health center: Events and Alerts")


## Alerts

 The fields on this answer have the following meaning:

  <table>
  <colgroup>
     <col style="width:35%" />
     <col style="width:65%" />
  </colgroup>
     <tr>
        <th>Field</th>
        <th>Description</th>
     </tr>
     <tr>
        <th>Time</th>
        <td>
           When the alert was sent.
        </td>
     </tr>
     <tr>
        <th>Type</th>
        <td>
           The ID of the event.
        </td>
     </tr>
     <tr>
        <th>Message</th>
        <td>
           The text of the alert message.
        </td>
     </tr>
    </table>

For a full reference of possible alerts, see the [Alert code reference]({{ site.baseurl
}}/reference/alerts-reference.html#).

## Configuration Events

This system answer displays recent events that changed the configuration of the
system. This list can contain the same types of information available on the **Admin System Health > Overview** page. This answer displays the **Time**, the
**User** that performed the action, and a **Summary** of the action.  

## Notification events

This answer displays notifications of data loads. The answer displays the **Time**, the
**User** that performed the action, and a **Summary** of the action.
Notifications are kept for 90 days before being discarded.

## Related information

[Alert code reference]({{ site.baseurl }}/reference/alerts-reference.html#)
