---
title: [Connect with TQL and create a schema]
summary: Learn about TQL, ThoughtSpot's SQL command line.
last_updated: 11/15/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---


To perform administrative tasks directly in the database, you will use the ThoughtSpot SQL Command Line (TQL). TQL supports many, but not all, common SQL commands.

## Connect with TQL

Before connecting with TQL, you need:

-   Access to your ThoughtSpot instance Linux shell from a client machine.
-   The administrator OS login.

To connect to TQL:

1. Log in to the Linux shell using SSH.
2. Invoke TQL:

    ```
    $ tql

    TQL>
    ```

3. Enter your SQL command, followed by a semicolon (`;`).

## Enter a SQL script

Having examined the structure of the data to be loaded and become familiar with the ThoughtSpot SQL Command Line (TQL), you are now ready to create the schema.

This method is a good way to get familiar with TQL and how to create database objects, but when creating a schema in a production system, you will most likely [Write a SQL script to create the schema](create-schema-with-script.html#).

To create the schema directly in TQL:

1. [Connect to the database with the ThoughtSpot SQL Command Line (TQL)](prep-schema-for-load.html#connect-with-tql).
2. If the database you will be using does not exist, create it now:

    ```
    TQL> CREATE DATABASE my_database;
    ```

3. Connect to the database:

    ```
    TQL> USE my_database;
    ```

4. If you wish to use a schema other than the default one, create it now:

    ```
    TQL> CREATE SCHEMA my_schema;
    ```

5. Issue a `CREATE TABLE` command for each table you will create, using the information in [Plan the schema](plan-schema.html#).

    {% include tip.html content="Foreign key declaration within a `CREATE TABLE` will show the table created even if there are problems with the foreign key. Therefore, it is good practice to also issue a separate `ALTER TABLE ADD CONSTRAINT FOREIGN KEY` command." %}
