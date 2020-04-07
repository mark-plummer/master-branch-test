---
title: [Data security]

last_updated: tbd

summary: "Data security refers to which users can see which data in the ThoughtSpot application."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Sharing and security privileges govern what data a user can access and what they
can do with the data. Admins can use privileges to regulate access to
information and provide a personalized user experience.

## Users, groups, and privileges

Data security applies to users and groups. Users can be managed [manually]({{ site.baseurl }}/admin/users-groups/about-users-groups.html#) or through
[LDAP]({{ site.baseurl }}/admin/setup/about-LDAP.html#). Each user can have
membership in one or more groups. Admins can make security settings that
determine what users are allowed to do in ThoughtSpot. These settings are
applied at the group level.

The following table shows the intersection of user privilege and ability:

{% include content/security-matrix.md %}


## Security model for sharing objects

You can share with groups and with individual users. Sharing of tables can be
defined at the table, column, or row level. This provides flexibility in
modeling your data security policy. Security and sharing settings apply to
several different types of objects, each of which has its own security default
settings and rules.

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="50%" />
</colgroup>
  <tr>
    <th>Object type</th>
    <th>Description</th>
    <th>Default security model</th>
  </tr>
  <tr>
    <td>Tables</td>
    <td>The source data tables that have been loaded using ThoughtSpot Loader.</td>
    <td>Administrator users have access to source tables. They can share a table with other users or groups. See [Share tables and columns](share-source-tables.html#)</td>
  </tr>
  <tr>
    <td>Columns</td>
    <td>The columns in the source data tables that have been loaded using ThoughtSpot Loader.</td>
    <td>Administrator users have access to columns in the source tables. They can share selected columns with other users or groups. See [Share tables and columns](share-source-tables.html#)</td>
  </tr>
  <tr>
    <td>Rows</td>
    <td>The rows in the source data tables that have been loaded using ThoughtSpot Loader.</td>
    <td>All rows in the source tables are shared with all users by default.</td>
  </tr>
  <tr>
    <td>Imported data</td>
    <td>Data that was imported using a Web browser.</td>
    <td>Only the user who imported the data (and any user with administrator privileges) has access to it by default. They can share a table (or selected columns) with other users or groups. See [Share tables and columns](share-source-tables.html#)</td>
  </tr>
  <tr>
    <td>Worksheets</td>
    <td>A worksheet created using a Web browser.</td>
    <td>Only the creator of the worksheet (and any user with administrator privileges) has access to it by default. They can share a worksheet with other users or groups. See [Share worksheets](share-worksheets.html)</td>
  </tr>
  <tr>
    <td>Pinboards</td>
    <td>A pinboard of saved search results.</td>
    <td>Anyone who can view a pinboard can share it. See [Share a pinboard](share-pinboards.html)</td>
  </tr>
</table>

## Understanding SHAREABLE

When you share an object, only the users and groups that have **SHAREABLE** set
for the **Sharing visibility** option appear on the dialog.

![]({{ site.baseurl }}/images/share_dialog.png "Share an object")

Only users in the **Administrators** group or users with **Admin** privileges
can share with groups marked as **NOT SHAREABLE**. Members of a group with
**Can share with all users** authorization can also share with groups marked as
**NOT SHAREABLE**.

Users in groups marked **NOT SHAREABLE** cannot share objects among themselves.
In multi-tenant scenarios, admins can create groups that bring together portions
of two non-share groups so that they can share. For example, the members of
group C can share even if they belong to other groups that cannot.




## Row level security

ThoughtSpot includes robust row level security, which allows you to filter all
objects users see based on conditions you set at the level of row values in base
data tables.

You may find it useful to create groups for RLS. To prevent these groups from
appearing in the **Share** dialog, create a **NOT SHAREABLE** group with a single
user and an RLS group with another single user (1-to-1).

## Related information

-   [Revoke access (unshare)]({{ site.baseurl }}/admin/data-security/unshare.html)  
-   [Row level security]({{ site.baseurl }}/admin/data-security/about-row-security.html)  
