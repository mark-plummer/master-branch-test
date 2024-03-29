---
title: [Change sharding for a data source]
summary: "Learn how to change the way ThoughtSpot shards a data source."
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Use this procedure to change the sharding on a data source after it has been set up and the load has run. You can still change the number of shards or make it a replicated table instead.

You should always take a snapshot of your database before making any schema changes. This will allow you to revert back to the prior state if you make an error, or something doesn't work as you expected after the schema change.

After you've set up a Data Source, you may decide that you want the table it is loading into to have a different type of sharding. For example, if you specified 96 shards, but then you expand your cluster, you may want to specify a large number or shards. You can even change a sharded table to a replicated table, or vice versa, by using this procedure.

First, you can modify the table sharding using TQL. Note that this operation changes the target table itself. You do not have to change the DDL that was generated when you first configured the data source. That DDL executes only one time, to build the empty table into which the data gets loaded. So if you change the sharding on the table in ThoughtSpot, you do not have to change the DDL that got generated when you first set up the data source. Likewise, if the load is scheduled to recur, the sharding that is defined on the target table will be used in the next load. Sharding is a one-time setup, and does not have to be kept in-sync with the data source DDL.

To change the sharding on a Data Source:

1. Log in to the Linux shell using SSH.
2. Launch TQL.
    ```
    $ tql
    ```
3.  Designate the database:

    ```
    TQL> use <database_name>;
    ```

4.  Find the name of the table you want to change.You can use the TQL command `SHOW TABLES;` to see a list of tables.

    To see the current sharding on the table, use `SCRIPT TABLE <table_name>;`

5.  Issue the command to change the sharding using this syntax:

    ```
    TQL> ALTER TABLE <table>
         [SET DIMENSION | SET FACT
         [PARTITION BY HASH
         [(<shards>)]
         [KEY(<column>)]]]
    ```

    For example:

    -   To make a sharded table into a dimension table (replicated on every node), use:

        ```
        ALTER TABLE "products"
           SET DIMENSION;
        ```

    -   To make a dimension table into a sharded (fact) table or change the number of shards, use:

        ```
        ALTER TABLE "sales"
           SET FACT PARTITION BY HASH (96)
           KEY ("productID");
        ```

6. The next time the data source load runs, it will use the new sharding automatically.
