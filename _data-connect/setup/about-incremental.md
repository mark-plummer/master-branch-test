---
title: [About incremental data loads]

last_updated: tbd
summary: "You can create an incremental data load, with some planning ahead."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Although there is no native incremental load capability, you can do incremental
loads by adding a filter on the source data. Filters only work if the source has
the capability of providing information on the last successful load. This means
the source should have a timestamp field that indicates when a particular source
was modified.

If your source data has such a timestamp, then you can use the following filters:

-   `modifiedDate > $LastRunDate`
-   `modifiedTime > $LastRunTime`

The `$LastRunDate` and `$LastRunTime` filters are correctly updated at runtime
to reflect the date/time of the last successful job run.  Both `$LastRunDate`
and `$LastRunTime` are in GMT, they cannot be reconfigured. `

{% include note.html content="If you are loading data with datetime values and
the values' timezones are anything other than GMT, the data is loaded at
incorrect intervals. For this reason, ensure your timezone values are in GMT
prior to loading them." %}

You can use filters on any other column of any datatype, if the filter provides
a way to identify the modified rows. Even if the source does not have this
capability, you may still be able to do an incremental load.

As long as a primary key exists on the target ThoughtSpot table, the data will
be loaded using an `upsert`. This means that for a given row being loaded, if
the primary key already exists in the target table, that row is updated with the
data in the new row. If a row with that primary key does not exist, the new row
will be inserted. This is how ThoughtSpot handles data loads into a table that
already contains rows, and it is the equivalent to an incremental load.

If you are relying on the `upsert` method, you can run a `COMPACT TABLE`
command in ThoughtSpot SQL Command Line (TQL) to reduce the size of the table at
intervals (usually weekly).

Another technique that can effectively free up space would be to run a post-job
script that deletes data older than a particular date. This keeps the data fresh
and ensures that old data, which may not be valuable, is not taking up memory.
