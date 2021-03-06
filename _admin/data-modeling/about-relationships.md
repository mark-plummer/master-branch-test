---
title: [Link tables using relationships]
summary: Learn how to link tables using relationships.
last_updated: 1/6/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can link tables by creating relationships between their columns. Linked tables can be searched together or combined into a worksheet for easy searching. Tables that have no relationship between their columns cannot be combined in a single search.

There are two ways to create relationships between tables:

1.  [Create a constraint using TQL]({{ site.baseurl }}/admin/loading/constraints.html#)
2.  [Create a relationship through the web interface.](create-new-relationship.html#)

The two methods create the same kind of relationship. When creating a relationship between two tables, the columns that form the link must have the same data type.  For example, you can build a relationship between two columns that use the `INT32` data type. You can also generate a script in TQL that contains all relationships, both the ones create in the web interface, and the ones defined through TQL.

These relationships can be managed either in TQL, or by going to the **Relationships** page when viewing data in the **Data Modeling** section in the ThoughtSpot application. You can view, modify, or delete relationships in either place.

You may create relationships using a mixture of TQL and the web interface, but the relationships you create cannot form a circular relationship, or "cycle". If you attempt to create a relationship that would complete a cycle, you will see a message stating that the relationship could not be added because it conflicts with another existing relationship.
