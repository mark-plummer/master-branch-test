---
title: [Constraints]

last_updated: tbd
summary: "Constraints allow you to build relationships and join tables."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Constraints include primary keys, foreign keys, and relationships. Relationships allow you to create a generic relationship for use when you want to join tables that don't have a primary key/foreign key relationship.

## Primary keys

When a primary key is selected for a table, it impacts data loading behavior. When a new row is added:

-   If another row already exists with same primary key, it is updated with the values in the new row.
-   If a row with the same primary key does not exist already, the new row is inserted into the table.

This behavior is referred to as “upsert” because it does an `INSERT` or an `UPDATE`, depending on whether a row with the same primary key already exists.

Note that ThoughtSpot does not check for primary key violations across different shards of the table. Therefore, you need to shard the table on the primary key columns if you require this “upsert” behavior.

## Foreign key relationships

Foreign key relationships tell ThoughtSpot how two tables can be joined. These relationships are only used for joining the tables, and not for referential integrity constraint checking.

The directionality of primary key - foreign key relationships is important. The foreign key relationship is defined on the fact table and references the primary key(s) in the dimension table. So you can think of the fact table as the source and the dimension table as the target. In the schema viewer, notice that the arrow that represents a PK/FK join points to the dimension table.

If you use primary and foreign keys, when users search the data from the search bar, tables are automatically joined. For example, assume there are two tables:

-   revenue, which is a fact table
-   region, which is a dimension table

There is a foreign key on the fact table on `regionid` which points to the id in the region dimension table. When a user types in "revenue by region", the two tables will be joined automatically.

Foreign keys have to match the primary key of the target table they refer to. So if there are multiple columns that make up the primary key in the target table, the foreign key must include all of them, and in the same order.

## Generic relationships (many-to-many)

You may have a schema where there is a fact table that you want to join with another fact table. If there isn't a primary key/foreign key relationship between the tables, you can use many-to-many to enable this. You can do this by using the RELATIONSHIP syntax to add a link between them, that works similarly to the WHERE clause in a SQL join clause.

{% include note.html content="Using generic relationships is not a best practice. In cases where you have two fact tables you want to join, it is better to find a way to create a bridge table between them, so you have a chasm trap. Look at your two fact tables to see if they share some common data that you could use to create a dimension table between them. For example a date or product dimension could be use to join an inventory fact table with a sales fact table. This is best done in your ETL process, before bringing the data into ThoughtSpot." %}

{% include note.html content="A many-to-many implementation does not protect from over counting in some searches. If you plan to use it, make sure your searches don't include aggregation or count searches that will count one value multiple times, because it satisfies the join condition for multiple rows." %}

This is a special kind of relationship, that applies to specific data models and use cases. For example, suppose you have a table that shows wholesale purchases of fruits, and another table that shows retail fruit sales made, but no inventory information. In this case, it would be of some use to see the wholesale purchases that led to sales, but you don't have the data to track a single apple from wholesale purchase through to sale to a customer.

In a many-to-many relationship, the value(s) in a table can be used to join to a second table, using an equality condition (required) and one or more range conditions (optional). These conditions act like the WHERE clause in a SQL JOIN clause. They are applied using AND logic, such that all conditions must be met for a row to be included.

To use a many-to-many relationship, you need to follow a few rules:

-   There must be one equality condition defined between the two tables.
-   Each table must be sharded on the same key that will be used for the equality condition.
-   There can optionally be one or more range conditions defined.

This example shows the TQL statements that create the two fact tables and the relationship between them.

```
TQL> CREATE TABLE "wholesale_buys" (

  "order_number" VARCHAR(255),

  "date_ordered" DATE,

  "expiration_date" DATE,

  "supplier" VARCHAR(255),

  "fruit" VARCHAR(255),

  "quantity" VARCHAR(255),

  "unit_price" DOUBLE

  )  PARTITION BY HASH (96) KEY ("fruit");


TQL> CREATE TABLE "retail_sales" (

  "date_sold" DATE,

  "location" VARCHAR(255),

  "vendor" VARCHAR(255),

  "fruit" VARCHAR(255),

  "quantity" VARCHAR(255),

  "sell_price" DOUBLE

  )  PARTITION BY HASH (96) KEY ("fruit");


TQL> ALTER TABLE "wholesale_buys" ADD RELATIONSHIP WITH "retail_sales" AS "wholesale_buys"."fruit" = "retail_sales"."fruit" and ("wholesale_buys"."date_ordered" < "retail_sales"."date_sold" and "retail_sales"."date_sold" < "wholesale_buys"."expiration_date");
```
