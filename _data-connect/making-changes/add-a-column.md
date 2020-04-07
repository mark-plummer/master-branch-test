---
title: [Add a column to an existing data source]
last_updated: tbd
summary: "Add a column to an existing data source."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can add a column to an existing data source using this procedure. This will work even if the data load has already been run in the past.

You should always take a snapshot of your database before making any schema changes. This will allow you to revert back to the prior state if you make an error, or something doesn't work as you expected after the schema change.

Reasons you may want to add a column to an existing data source might include:

-   A new column has been added to the source table, and you want to include it in the data import.
-   You've decided to include an additional column from the source.

Initial DDL did not include a column, but you wanted to pull it in later in a subsequent load. Or it could be a new column added to the source.

The procedure to make this change to an existing data source has two main parts:

-   Alter the table definition in the target table using TQL.
-   Create a new data source, and edit the DDL to match the target table exactly.

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

5. Issue the command to change the data type of a column using this syntax:

    ```
    TQL> ALTER TABLE <schema>.<table>
         MODIFY COLUMN <column> <new_data_type>;
    ```

    For example, to change "account_id" with data type INT to data type VARCHAR:

    ```
    TQL> ALTER TABLE foodmart.account
         ADD COLUMN account_id VARCHAR(10)
         DEFAULT '';
    ```

    You must use the fully qualified name of the old table when adding the column through TQL. To find that you can look at the DDL for the data source job itself.

6. Run the `SCRIPT TABLE` command to get the new DDL to create the table.

    ```
    TQL> SCRIPT TABLE <table>;
    ```

    Copy the output of the command. This includes the fully qualified table name of the ThoughtSpot table and the column names of the source columns. Replace any VARCHAR(<number) column definitions with VARCHAR(0), to match the DDL that Data Connect generates. This is the DDL that you will use in your new data source.

7. [Create a new data source.]({{ site.baseurl }}/data-connect/setup/adding-data-source.html#)Be sure to choose the correct columns to match the new target table columns definitions. When you reach the step about editing the generated schema DDL, paste in the DDL that was output by the `SCRIPT TABLE` command.
8. Run the data load and verify that everything is working as it should be.
9. If the old data source was running as a recurring load, [stop it from running](stop-scheduled-job.html).
