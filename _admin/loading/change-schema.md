---
title: [How to change a schema]


last_updated: tbd
summary: "After you've created a schema and loaded data, you may find yourself wishing you'd set things up a little differently. You can make changes to the schema, such as changing the primary key, relationships to other tables, and sharding."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Making changes to a schema after data has been loaded and users have created worksheets or pinboards on the tables requires care, so that you don't lose the relationship between the objects created in ThoughtSpot and the underlying tables. If you follow the procedures here, your tables will retain their relationships to the objects created on top of them.

{% include tip.html content="Always take a snapshot of your database before making any schema changes. This snapshot allows you to revert back to the prior state if you make an error, or something doesn't work as you expected after the schema change." %}


## Change the primary key for a table

Use this procedure to change the primary key for a table. But use it with caution, particularly if you are changing to a primary key for which values are not unique.

You can change the primary key of a table without having to `TRUNCATE` it first and reload the data. However, changing the primary key could result in data deletion. This is because of the upsert behavior which is applied when multiple rows have the same primary key. This is very important to understand ahead of time, if you are considering changing to a primary key for which values are not unique.

To change the primary key, first remove any existing primary key, and then define a new one (if any). You do not have to truncate the tables to do this operation beginning in version 3.2. Any dependent objects (pinboards or worksheets) will remain intact.

To change the primary key of a table:

1. [Create a manual snapshot]({{ site.baseurl }}/admin/backup-restore/overview-snapshot.html).
2. [Connect to the database with the ThoughtSpot SQL Command Line (TQL)](prep-schema-for-load.html#connect-with-tql).
3. Drop the existing primary key (if any), by issuing a command like this example:

    ```
    TQL> ALTER TABLE "cart"
         DROP CONSTRAINT
         PRIMARY KEY;
    ```

    Dropping a primary key can impact existing worksheets, answers, and pinboards. The system warns you if dropping a primary key impacts other objects. To continue, use the `--allow_unsafe` flag.

4. Add a new primary key, if desired:

    ```
    TQL> ALTER TABLE "cart"
         ADD CONSTRAINT
         PRIMARY KEY ("owner_id");
    ```

5. Test that any dependent objects (pinboards, worksheets, etc.) are still working correctly.
6. Delete the snapshot you created earlier using the command:

    ```
    tscli snapshot delete <name>
    ```

## Change a relationship between tables

Use this procedure to remove a relationship between tables or define a new one. This operation works for both kinds of relationships: foreign key or generic relationship.

To change a relationship between two tables, first remove any existing relationship, and then define the new relationship (if any). You do not have to truncate the tables to do this operation. Any dependent objects (pinboards or worksheets) will remain intact.

To change the relationship between tables:

1. [Create a manual snapshot]({{ site.baseurl }}/admin/backup-restore/overview-snapshot.html).
2. [Connect to the database with the ThoughtSpot SQL Command Line (TQL)](prep-schema-for-load.html#connect-with-tql).
3. Issue the command to drop the existing relationship

   Before dropping a relationship TQL checks for and then warns of any dependent
   objects. To continue with the drop any way, use the `--allow_unsafe` flag.
   The following examples illustrate several different types of drop operations.

    Drop a foreign key by name, if it was given a name when it was defined:

    ```
    TQL> ALTER TABLE
         "sales_fact"
         DROP CONSTRAINT
         "FK_PO_number";
    ```

    Drop a relationship by name, if it was given a name when it was defined:

    ```

    TQL> ALTER TABLE "fruit_dim"
         DROP RELATIONSHIP "REL_dates";
    ```

    Drop the foreign key relationship explicitly, if it doesn't have a name, by referencing the two tables that are joined. This drops all foreign keys between the two tables:

    ```
    TQL> ALTER TABLE "shipments"
         DROP CONSTRAINT
         FOREIGN KEY "orders";
    ```

    Drop all generic relationships between two tables:

    ```
    TQL> ALTER TABLE "wholesale_buys"
         DROP RELATIONSHIP
         WITH "retail_sales";
    ```

4. Define a new relationship, if you want to, using `ALTER TABLE...ADD CONSTRAINT...`
5. Test that any dependent objects (pinboards, worksheets, etc.) are still working correctly.
6. Delete the snapshot you created earlier using the command:

    ```
    tscli snapshot delete <name>
    ```

## Change sharding on a table

You can change the sharding on a table or remove it altogether (creating a replicated table) using this procedure. This procedure preserves the data within the table.

This procedure reshards a table. This is also called redistributing or repartitioning. You can use this method to reshard a table without losing its data or metadata. This means that worksheets and pinboards built on top of the table will continue to work.

You can use these steps to do any of these operations:

-   shard a table that was previously replicated.
-   change a replicated table to a sharded table.
-   change the number of shards to use for a sharded table.

To change the sharding on a table:

1. [Create a manual snapshot]({{ site.baseurl }}/admin/backup-restore/overview-snapshot.html).
2. [Connect to the database with the ThoughtSpot SQL Command Line (TQL)](prep-schema-for-load.html#connect-with-tql).
3.  Issue the command to change the sharding using this syntax:

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

4. Test that any dependent objects (pinboards, worksheets, etc.) are still working correctly.
5. Delete the snapshot you created earlier using the command:

    ```
    tscli snapshot delete <name>
    ```
