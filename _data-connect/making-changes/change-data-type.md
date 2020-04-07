---
title: [Change a column data type]
summary: "Learn how to change the data type of a column."
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
When a data type used in a data source has changed, or you decide that the data should come into ThoughtSpot with a different data type, you can change the data type, even if you've already loaded data into the target table.

You should always take a snapshot of your database before making any schema changes. This will allow you to revert back to the prior state if you make an error, or something doesn't work as you expected after the schema change.

When changing a data type in an existing table, be aware that answers and pinboards created on top of that table (or worksheets that include it) may change. This is because charts and aggregations depend upon the data type. So for example changing from INTEGER to VARCHAR could break charts that used the numeric data type INTEGER to calculate an average or a total. Because of this, use caution, and check all dependent objects before and after changing the data type, to ensure that they display as intended.

The procedure to make this change to an existing data source has two main parts:

-   Alter the table definition in the target table using TQL.
-   Create a new data source, and edit the DDL to match the target table exactly.

To change the data type of an existing data source:

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
         MODIFY COLUMN account_id VARCHAR(10);
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
