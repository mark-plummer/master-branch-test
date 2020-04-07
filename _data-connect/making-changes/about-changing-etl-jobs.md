---
title: [About making changes to Data Connect setup]
last_updated: 11/18/2019
summary: "You can make changes to the scheduling, data sources, or even the schema."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
After setting up ThoughtSpot Data Connect, you may want to make changes to the scheduling, data sources, or even the schema you are importing into in ThoughtSpot. These best practices describe how to make such changes.

## Changes to data sources

If your company migrates from one source database or application to another you may find that you need to redo the data import using the new system. You can do this without losing any data that has already been loaded into ThoughtSpot, but you need to be careful not to accidentally delete an existing table that was created by the old data source. Create the new data source, but choose to retain the table when you delete the old data source. You should also stop any scheduled jobs associated with the old data source before deletion.

-   [Delete a connection](delete-a-connection.html#)
-   [Delete a data source](delete-data-source.html#)

## Changes to scheduled data imports

It's easy to change scheduled data imports to run at a different time or frequency through the Data Connect web interface. You may also want to pause a data import because the source system will be offline for maintenance. You can then resume it, when the maintenance has been completed.

-   [Stop a scheduled job from running](stop-scheduled-job.html#)

## Changes to the Schema in ThoughtSpot

It is very common to need to change what you're importing into ThoughtSpot for various reasons. For example the source database may have changed, because you've implemented a new application. Or you might simply change your mind about the best way to model the data that was brought in through Data Connect.

-   [Change sharding for a data source](change-sharding.html#)
-   [Change a data type for a data source](change-data-type.html#)
-   [Add a column to an existing data source](add-a-column.html#)
-   [Remove a column from an existing data source](remove-column.html#)
