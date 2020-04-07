---
title: ["About row level security (RLS)"]


last_updated: tbd
summary: "Using row level security, you can restrict data that appears in search results and pinboards by group."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Row level security (RLS) allows you to restrict a group's access to table row
data. You do this by creating a _rule_ that associates a filter with a group.
When a group member searches, views an answer, or otherwise works with data,
ThoughtSpot evaluates the rules and prevents the display of the restricted data.
Users see only the data they are permitted to see.

## How does RLS impact user interactions?

The security rules apply to objects shared with users individually or through groups
they are a member of.  The rules restrict the visible data when users:

* view a table
* view a worksheet derived from the table
* search for data in the worksheet or table
* view answers from restricted data &endash; either that they've created or that were shared with them
* interact with pinboards from restricted data &endash; either that they've created or that were shared with them

Search suggestions also fall under row-level security. If a user would not have
access to the row data, then values from the row do not appear in **Search**
suggestions.

## Why use RLS?

RLS allows you to set up flexible rules that are self-maintaining. An RLS
configuration can handle thousands of groups. There are several reasons you
might want to use row level security:

<table>
  <tr>
    <th>Reason </th>
    <th>Example</th>
  </tr>
  <tr>
    <td>Hide sensitive data from groups who should not see it.</td>
    <td>In a report with customer details, hide potential customers (those who have not yet completed their purchase) from everyone except the sales group.</td>
  </tr>
  <tr>
    <td>Filter tables to reduce their size, so that only the relevant data is visible.</td>
    <td>Reduce the number of rows that appear in a very large table of baseball players, so that players who are no longer active are not shown except to historians.</td>
  </tr>
  <tr>
    <td>Enable creation of a single pinboard or visualization, which can display different data depending on the group who is accessing it.</td>
    <td>Create one sales pinboard that shows only the sales in the region of the person who views it. This effectively creates a personalized pinboard, depending on the viewer's region.</td>
  </tr>
</table>


## Related information

* To continue learning about RLS, see [How rule-based RLS works]({{ site.baseurl
}}/admin/data-security/row-level-security.html#).

* **Search** suggestions relies on compile indices to present suggestions to users
from your data. See [Manage suggestion indexing]({{ site.baseurl
}}/admin/data-modeling/change-index.html#) to learn how to configure
suggestions.
