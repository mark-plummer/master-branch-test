---
title: ["Security for SpotIQ functions"]
summary: Learn about SpotIQ security.
last_updated: 11/15/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
SpotIQ is a feature in ThoughtSpot that automatically generates insights into
system data. The feature works on all the data in your system, search queries,
saved answers, and pinboards. Because SpotIQ uses the same data security model
as other data in the system, there is no need to build a new schema or security
model to support it.

SpotIQ automatically generates insights into data when a user requests them.
These requests can be run immediately or users can schedule regular analysis.
SpotIQ requests for insights can put additional load on your system depending on
the amount of data being analyzed and how frequently users make use of it.

Users are required to have the **Has Spot IQ privilege** to use this feature.
Users without this privilege cannot view insights unless the users that
generated the insights add them to a pinboard and share the pinboard with others.

You may want to restrict access to a subset of your users or even to a subset of
your managers. To restrict access to this feature:

1. Create a group called **SpotIQUsers**.
2. Grant this group **Has Spot IQ privilege**.
3. Enable users to this group.
