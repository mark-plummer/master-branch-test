---
title: [Supported SQL commands]

summary: "The ThoughtSpot connection drivers support a limited set of SQL commands."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
The ODBC and JDBC drivers support a limited set of SQL commands. When developing
software that uses a ThoughtSpot ODBC driver, use this reference of supported
commands. This reference is intended for developers using other tools (ETL,
etc.) to connect to ThoughtSpot through the ODBC or JDBC driver.

{% include note.html content="ThoughtSpot displays `VARCHAR` fields using lower case, regardless of what the original casing of your loaded data is." %}

## Supported commands

These SQL commands are supported for ODBC and JDBC:

* `CREATE TABLE`

    Creates a table with the specified column definitions and constraints. The table is replicated on each node.

    ```
    CREATE TABLE country_dim (id_number int, country varchar, CONSTRAINT PRIMARY KEY (id_number));
    ```
* `CREATE DATABASE`

    Creates a database. For example:

    ```
    CREATE DATABASE "fruit_database";
    ```
* `CREATE SCHEMA`

    Creates a schema within the current database. For example:

    ```
    CREATE SCHEMA "fruit_schema";
    ```      
* `ALTER TABLE <table> ADD|DROP|RENAME COLUMN <column>`

    Alters a table to add, drop, or rename a column.

    When you add a column to an existing table, you must provide a default value to use for existing rows. For example:

    ```
    ALTER TABLE "cart" ADD COLUMN "nickname" varchar(255) DEFAULT 'no nickname';
    ```
    ```
    ALTER TABLE "cart" DROP COLUMN "nickname";
    ```
    ```
    ALTER TABLE "sales" ADD CONSTRAINT PRIMARY KEY ("PO_number");
    ```
* `ALTER TABLE <table> DROP CONSTRAINT PRIMARY KEY;`

    Drops the primary key from a table.

    Note that if you then add a new primary key, the same upsert behavior will be applied as with adding any primary key. This can result in data deletion, so make sure you understand how the upsert will affect your data ahead of time. For example:

    ```
    ALTER TABLE "sales" DROP CONSTRAINT PRIMARY KEY;
    ```
    ```
    ALTER TABLE "sales" ADD CONSTRAINT PRIMARY KEY ("PO_number");
    ```
* `ALTER TABLE <table> DROP CONSTRAINT [FOREIGN KEY | RELATIONSHIP] <name>;`

    Drops the named foreign key or relationship between two tables. For example:

    ```
    ALTER TABLE "sales_fact" DROP CONSTRAINT FOREIGN KEY "FK_PO_number";
    ```

    ```
    ALTER TABLE "fruit_dim" DROP RELATIONSHIP "REL_dates";
    ```
* `ALTER TABLE <table> DROP [CONSTRAINT FOREIGN KEY [<table_name>] | RELATIONSHIP [WITH <table_name>];``

    You must use this syntax when dropping relationships between tables created before ThoughtSpot version 3.2. This is because relationships could not be named in older versions.

    Drops the foreign key or relationship between two tables where you cannot reference it by relationship name. If the relationship was created without a name, use:
    - the name of the referenced table, for a foreign key.
    - the name of the related table, for a relationship.

* `ALTER TABLE <table> [SET DIMENSION | SET FACT [PARTITION BY
HASH [(<shards>)] [KEY(<column>)]]]`

    Changes the partitioning on a table by doing one of:
    - re-sharding a sharded table
    - changing a replicated table to a sharded table
    - changing a sharded table to a replicated (unsharded) table

    By default, ThoughtSpot does not shard dimension tables.

    To change the partitioning on a table, or to change a dimension table to a sharded table, use ALTER TABLE...SET FACT PARTITION BY HASH...;

    To make a sharded table into a dimension table (replicated on every node), use ALTER TABLE...SET DIMENSION; command.

    Examples of this statement:

    `ALTER TABLE "sales_fact" SET FACT PARTITION BY HASH (96) KEY
    ("PO_number");
    ALTER TABLE "fruit_dim" SET DIMENSION;`

* `ALTER TABLE <table> MODIFY COLUMN <column> <new_data_type>;`

    Changes the data type of a column. This can have implications on sharding and primary key behavior. See [About data type conversion]({{ site.baseurl }}https:/admin/loading/about-data-type-conversion.html#concept_u2t_clg_wv). For example:
    `ALTER TABLE fact100 MODIFY COLUMN product_id int;`

* `INSERT`

    Creates placeholders in the table to receive the data.

    ```
    INSERT INTO TABLE country_dim (?, ?);
    ```

* `DELETE FROM <table>`

    Deletes `ALL` rows from the specified table. Use the `WHERE` clause to specify only certain rows to be deleted. Example: You could remove all data for sales before a certain date to free up space in ThoughtSpot.

    ```
    DELETE FROM country_dim;
    ```
* `SELECT <cols_or_expression> FROM <table_list> [WHERE <predicates>] [GROUP BY <expressions>]``[ORDER BY <expressions>]`

    Fetches the specified set of table data.

    ```
    SELECT id_number, country FROM country_dim WHERE id_number > 200;
    ```
* `TRUNCATE TABLE <table>`

    Removes all data from a table, but preserves its metadata, including all GUIDs, relationships, etc. This can be used to force a new schema for a table without losing the metadata.

    However, this operation removes all existing data from the table and must be used with caution. You must reload the data following a TRUNCATE, or all dependent objects (worksheets and pinboards) in ThoughtSpot will become invalid. For example:

    ```
    TRUNCATE TABLE "location";
    ```

* `DROP DATABASE <database>`

    Drops a database and all of its schemas and tables. For example:

    ```
    DROP DATABASE "fruit_database";
    ```

* `DROP SCHEMA <schema>`

    Drops a schema within the current database, and drops all of the tables in the schema. For example:

    ```
    DROP SCHEMA "fruit_schema";
    ```

* `DROP TABLE <table>`

    Drops a table. For example:

    ```
    DROP TABLE "location";
    ```

* `SHOW DATABASES`

    Lists all available databases.

    Examples:

    ```
    SHOW DATABASES;
    ```

* `SHOW SCHEMAS`

    Lists all schemas within the current database. For example:

    ```
    SHOW SCHEMAS;
    ```

* `SHOW TABLES`

    Lists all tables within the current database by schema. For example:

    ```
    SHOW TABLES;
    ```

* `SHOW TABLE <table>`

    Lists all the columns for a table. For example:

    ```
    SHOW TABLE "locations";
    ```

* `SCRIPT SERVER`

    Generates the TQL schema for all tables in all databases on the server. For example:

    ```
    SCRIPT SERVER;
    ```

* `SCRIPT DATABASE <database>`

    Generates the TQL schema for all tables in a database. For example:

    ```
    SCRIPT DATABASE "fruit_database";
    ```

* `SCRIPT TABLE <table>`

    Generates the TQL schema for a table. For example:

    ```
    SCRIPT TABLE "vendor";
    ```  
