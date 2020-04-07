---
title: [Remove a column from an existing data source]
summary: "Learn how to remove a column from an existing data source."
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can remove a column from a data source, even if its data load has been run in the past, by using this procedure. The procedure to make this change to an existing data source has two main parts:

-   Alter the table definition in the target table using TQL.
-   Create a new data source, and edit the DDL to match the target table exactly.

You should always take a snapshot of your database before making any schema changes. This will allow you to revert back to the prior state if you make an error, or something doesn't work as you expected after the schema change.



1. Log in to the Linux shell using SSH.
2. Launch TQL.

    ```
    $ tql
    ```

3. Designate the database:

    ```
    TQL> use <database_name>;
    ```

4. Find the name of the table you want to change.You can use the TQL command `SHOW TABLES;` to see a list of tables.

    To see the current sharding on the table, use `SCRIPT TABLE <table_name>;`

5. Issue the command to remove the column from the table using this syntax:

    ```
    TQL> ALTER TABLE <schema>.<table>
         DROP COLUMN <column>;
    ```

    For example, to drop the column "account_id" from the table "account" in the schema "foodmart":

    ```
    TQL> ALTER TABLE foodmart.account
         DROP COLUMN account_id;
    ```

    You must use the fully qualified name of the old table when adding the column through TQL. To find that you can look at the DDL for the data source job itself.

6. Run the `SCRIPT TABLE` command to get the new DDL to create the table.

    ```
    TQL> SCRIPT TABLE <table>;
    ```

    Copy the output of the command. This includes the fully qualified table name of the ThoughtSpot table and the column names of the source columns. Replace any `VARCHAR(<number)` column definitions with `VARCHAR(0)`, to match the DDL that Data Connect generates. This is the DDL that you will use in your new data source.

7. [Create a new data source.]({{ site.baseurl }}/data-connect/setup/adding-data-source.html#).
    Be sure to choose the correct columns to match the new target table columns definitions. When you reach the step about editing the generated schema DDL, paste in the DDL that was output by the `SCRIPT TABLE` command.
8. Run the data load and verify that everything is working as it should be.
9. If the old data source was running as a recurring load, [stop it from running](stop-scheduled-job.html).
