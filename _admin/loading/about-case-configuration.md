---
title: [Configure casing]

last_updated: tbd
summary: "You can set the type of case sensitivity you would like to see reflected in the ThoughtSpot display."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Before you load your data, you should consider the type of casing you would like
your data to reflect. The case sensitivity for source data strings is preserved
in the display. So, the visual display of results is identical to the input case
that is loaded.

{% include note.html content="The casing will remain lowercase in other parts of
the application, such as when you ask a question or filter." %}

It is important to note that string casings aren’t applied globally, but by
column. So datasets will have different string casings as long as they're in
different columns. Tables that are already compacted will keep their lowercase
format. In these cases, to get the specific string case that you want,
you would have to truncate related tables and reload them.

To take advantage of case configuration, you need to have ThoughtSpot Support
enable it on your cluster for you. In addition, title casing should be disabled
for string casing to properly work.
