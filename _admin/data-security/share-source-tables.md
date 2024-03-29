---
title: [Sharing tables and columns]
last_updated: 2/12/2020
toc: false
summary: "As an administrator, you can share view or edit access to any table."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
By default, when a table is loaded using the ThoughtSpot Loader, ODBC, or JDBC, it
is only visible to administrators. Tables imported from a Web browser are visible
to administrators and the user who uploaded it. Administrators and owners can
share **Can View** or **Can Edit** privileges on tables with other users, who can further share them with others.

When you share a table, you can share the entire table, or specific columns.

## Permissive or strict sharing

Use caution when sharing tables, because any objects created from that table will have
dependencies on it and its underlying structure. Objects created from
tables can include worksheets, Views, Answers, and Pinboards. This means that if a user
wants to drop or modify a table, any object that depends upon it must be edited or removed first, to remove the dependency.

For this reason, it is a best practice to only grant the **Edit** permission on
a table to a small number of users. If you want to prevent shares from also
revealing the columns regardless of where it appears (worksheets, answers, and
pinboards), you can ask [ThoughtSpot Support]({{ site.baseurl }}/appliance/contact.html) to enable a stricter behavior.

You can share a table [from the **Data** tab](#share-datatab), or [from within the table](#share-dataset) that you want to share.

{% include content/share-data.md %}
