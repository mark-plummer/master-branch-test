---
title: [How to write a SQL script]


last_updated: tbd
summary: "Using a SQL script to create your schema is a recommended best practice. This makes it easier to adjust the schema definitions and recreate the schema quickly, if needed."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
The schema creation script is a text file that contains all the SQL commands to create your schema. Comments should be enclosed in the comment tags /\* and \*/.

Enclose all object names (schema, table, and column) in double quotes and any column values in single quotes in your scripts. Object names that are also reserved words in SQL, or that contain special characters (any character other than alphanumeric or _ ), must be surrounded by double quotes. If you see the error message "Error parsing SQL. Check SQL input.", you should check for object names without double quotes in your script.

If you are working in a schema other than the default schema, object names must be fully qualified, as in `"<schema_name>"."<object_name>"`.

If your schema includes constraints to define relationships between tables (foreign key, or the `RELATIONSHIP` syntax), it is recommended that your script first creates all the tables, and then at the end, creates the relationships between them using the `ADD CONSTRAINT` syntax. This makes it easier to troubleshoot the script and make changes.

If TQL is run using the flag `--allow_unsafe`, your statements will always execute without this warning. Note that when running TQL from a script, you must decide what behavior you want if the script contains changes that affect dependent objects. If you want the script to run even if objects with dependencies are affected, run it using this flag, for example:

```
cat safest_script_ever.sql | tql --allow_unsafe
```

1. Open a new file in a text editor.
2. Type in the command to create the database, if it does not already exist:

    ```
    CREATE database <db_name>;
    ```

3. Type in the command to specify the database to use:

    ```
    USE database <db_name>;
    ```

4. Type in the command to create the schema, if you don't want to use the default schema:
5. Type in each of the CREATE TABLE statements, with its column definitions, primary key constraints, and sharding specification (if any).
6. At the end of your script, optionally type in the `ALTER TABLE` statements to add foreign keys to use in joining the tables.
7. Save the file.
8. Run the script using one of these methods:

    -   [Import a schema (use the SQL editor)](upload-sql-script.html#).
    -   [Log in to the shell]({{ site.baseurl }}/admin/setup/logins.html#ssh-to-the-appliance), copy your script to your ThoughtSpot instance using scp, and pipe it to TQL:
    ```
    $ cat create-schema.sql | tql
    ```
