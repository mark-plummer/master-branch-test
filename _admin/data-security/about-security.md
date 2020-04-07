---
title: [Overview of security features]
summary: Learn about ThoughtSpot's security features.
last_updated: 11/15/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
There are several aspects of security, including access and permissions, data security and privacy, and security from an IT perspective.

- [System Security](audit-logs.html#) refers to audit logs and security policies.


- [Data Security](sharing-security-overview.html#) refers to which users can see which data in the ThoughtSpot application, and includes:
  -   [Users and Groups]({{ site.baseurl }}/admin/users-groups/about-users-groups.html#)
  -   [Privileges]({{ site.baseurl }}/admin/users-groups/about-users-groups.html#privileges-and-groups)
  -   [Table and columns sharing](share-source-tables.html#)
  -   [Row level security](about-row-security.html#)
  -   [Worksheet sharing](share-worksheets.html#)
  -   [Pinboard sharing](share-pinboards.html#)


- Network Security refers to ports for external traffic and traffic within the cluster.  Some ports must remain open for handling network requests from outside the ThoughtSpot instance. To see a list of network ports that must remain open to outside traffic, and for inter-cluster communication, review the information in [Network ports]({{ site.baseurl }}/admin/setup/firewall-ports.html#).
