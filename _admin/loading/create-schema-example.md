---
title: [Schema creation examples]


last_updated: tbd
summary: "Use the TQL and the ThoughtSpot Loader."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
These examples demonstrate the steps involved in creating a schema using the ThoughtSpot SQL Command Line (TQL). After the schema is created, you can load data into it with ThoughtSpot Loader.

## Simple schema creation example

The example creates a database (`tpch`) with two tables (`customer`, `transaction`). The example does not create a schema explicitly. So it will use the default schema (falcon_default_schema).

In this example:

-   The table `customer` has a primary key called customer_id. The table `customer_transactions` has a primary key called transaction_id.
-   The `customer` table is unsharded.
-   The `customer_transactions` table is sharded into 96 shards using the `transaction_id` column.
-   Both tables have referential integrity on `customer_id`.

```
$tql


TQL> CREATE DATABASE tpch;


TQL> USE tpch;


TQL> CREATE TABLE customer (

      name  VARCHAR(100),

      address VARCHAR(255),

      zipcode INT,

      customer_id INT,

      CONSTRAINT PRIMARY KEY (customer_id)

      );


TQL> CREATE TABLE customer_transactions (

     transaction_id INT,

     customer_id INT,

     amount DOUBLE,

     transaction_date DATETIME,

     CONSTRAINT PRIMARY KEY (transaction_id),

     CONSTRAINT FOREIGN KEY (customer_id) REFERENCES

     customer(customer_id)

     )  PARTITION BY HASH (96) KEY (transaction_id);
```

## More complex schema creation example

The example uses a custom schema called sample_schema to hold the tables. Because of this, every table reference has to be schema qualified.

```
$ tql


TQL> CREATE DATABASE "sample_db";

TQL> USE "sample_db";

TQL> CREATE SCHEMA "sample_schema";

TQL> CREATE TABLE "sample_schema"."customer" (

  "c_custkey" BIGINT,

  "c_name" VARCHAR(255),

  "c_address" VARCHAR(255),

  "c_city" VARCHAR(255),

  "c_nation" VARCHAR(255),

  "c_region" VARCHAR(255),

  "c_phone" VARCHAR(255),

  CONSTRAINT PRIMARY KEY ("c_custkey")

);

TQL> CREATE TABLE "sample_schema"."supplier" (

  "s_suppkey" BIGINT,

  "s_name" VARCHAR(255),

  "s_address" VARCHAR(255),

  "s_city" VARCHAR(255),

  "s_nation" VARCHAR(255),

  "s_region" VARCHAR(255),

  "s_phone" VARCHAR(255),

  CONSTRAINT PRIMARY KEY ("s_suppkey")

);

TQL> CREATE TABLE "sample_schema"."lineorder" (

  "lo_orderkey" BIGINT,

  "lo_linenumber" BIGINT,

  "lo_custkey" BIGINT,

  "lo_partkey" BIGINT,

  "lo_suppkey" BIGINT,

  "lo_orderdate" DATE,

  "lo_orderpriority" VARCHAR(255),

  "lo_shippriority" VARCHAR(255),

  "lo_quantify" BIGINT,

  "lo_extendprice" BIGINT,

  "lo_ordtotalprice" BIGINT,

  "lo_discount" BIGINT,

  "lo_commitdate" DATE,

  CONSTRAINT PRIMARY KEY ("lo_orderkey","lo_linenumber"),

  CONSTRAINT FOREIGN KEY ("lo_custkey") REFERENCES "sample_schema"."customer" ("c_custkey"),

  CONSTRAINT FOREIGN KEY ("lo_suppkey") REFERENCES "sample_schema"."supplier" ("s_suppkey")

  )  PARTITION BY HASH (96) KEY (lo_orderkey);
```
