---
title: [Sharding]
last_updated: 3/16/2020
summary: "Sharding partitions very large tables into smaller, faster, more easily managed parts called data shards."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
ThoughtSpot tables can be replicated or sharded. Replicated tables exist in
their entirety, as the complete data set, on each node. Sharded tables consist of a
single data set, divided into multiple tables, or *shards*. The shards have
identical schemas, but different sets of data.

Note that sharding and loading tables into ThoughtSpot only apply to ThoughtSpot's in-memory database. If you use [Embrace]({{ site.baseurl }}/data-integrate/embrace/embrace-intro.html), and store your data in another data warehouse such as Snowflake or Amazon Redshift, your data modeling is done in that data warehouse, and not in ThoughtSpot.

## When to shard your data

By default, ThoughtSpot replicates tables. To shard tables, you must add the `PARTITION BY HASH ( )` clause to your `CREATE TABLE` statement.

Sharding your tables impacts the total amount of memory used by the table, as
well as its performance.

For example, you might shard a large table of sales data. You could divide a
single sales table into shards that each contain only the data for a single year. The system then distributes these shards across several nodes.
Requests for sales data are dispersed both by the year and the location of the
shard in the node cluster. No single table or node is overloaded, improving both query performance and system load.

To optimize ThoughtSpot performance and memory usage, you should _shard_ very large fact tables
whenever possible. If you have a large dimension table, you might choose to
shard it along with the fact table it is joined with. Sharding both the fact and
dimension table(s) is known as _co-sharding_.

### Table sizes and sharding recommendations

|---------------           | ----------------             |
| Number of rows per shard | 5-10 million                 |
| Maximum                  | 10 million rows per shard    |   
| Maximum number of shards | ~ 80% of CPU cores           |   

### Example

|---------------           | ----------------               |
| Number of rows in table  | 1.1 billion                    |
| CPUS in cluster          | 256                            |   
| HASH (128)               | ~50% of total CPUs             |
| Rows per shard           | 8.6 million                    |

## How to shard

Sharding is a type of partitioning. It is sometimes called _Horizontal
partitioning_. The term _sharding_ is particular to situations where data is
distributed not only among tables, but also across nodes in the system. To create a sharded table, add the `PARTITION BY HASH ( )` clause to your `CREATE TABLE` statement.

```
TQL> CREATE TABLE
...
PARTITION BY HASH (96) KEY ("customer_id");
```

Note the following parameters, specified above as `96` and `"customer_id"`:
<dl>
  <dlentry><dt>HASH</dt><dd>Determines the number of shards. In this case, <code>96</code>.</dd></dlentry>
  <dlentry><dt>KEY</dt><dd>Specifies how to assign data into the shards (shard key). In this case, <code>customer_id</code>.</dd></dlentry>
</dl>

The recommended number of shards depends on the number of nodes
in the cluster:

|Number of Nodes|Number of Shards|
|---------------|----------------|
|1 | 32  |
|2   | 64  |
|3|96|
|4-12|128|
|13-24|256|
|25-36|384|
|37-48|512|
|49-60|640|
|61-72|768|

If you omit the `PARTITION BY HASH` statement or if the `HASH` parameter is 1
(one), the table is unsharded. The table is replicated instead, and physically exists in
its entirety on each node. This increases memory usage, since you are storing multiple copies of the same table.

If you want to use a table's primary key as the shard key, specify that the table
is to be partitioned by `HASH` on the primary key, as in this example:

```
TQL> CREATE TABLE "supplier" (
  "s_suppkey" BIGINT,
  "s_name" VARCHAR(255),
  "s_address" VARCHAR(255),
  "s_city" VARCHAR(255),
  "s_phone" VARCHAR(255),
  CONSTRAINT PRIMARY KEY ("s_suppkey")
  )  PARTITION BY HASH (96) KEY ("s_suppkey");
```

## How to choose a shard key

{% include tip.html content="We recommended that you always specify the `KEY` parameter when `HASH` is greater than 1. If you omit the `KEY` parameter in your `CREATE TABLE` statement, ThoughtSpot shards the table randomly." %}

ThoughtSpot does not have a default shard key.

- If the table has no primary key, the sharding is unconstrained. You can choose ***any*** subset of columns that is valid for use as the primary key as the shard key. If you do not specify the shard key, ThoughtSpot implements random sharding.

- If the table has a primary key, you ***must*** specify the `KEY` parameter of the `PARTITION BY HASH` statement. This shard key ***must*** be a subset of the primary key.

***DO***
```
...
CONSTRAINT PRIMARY KEY("saleid,vendorid”))
PARTITION BY HASH(n) KEY ("saleid");
```
```
...
CONSTRAINT PRIMARY KEY("saleid,vendorid”))
PARTITION BY HASH(n) KEY ("vendorid");
```
In the above examples, the table has a primary key. The `KEY` parameters specified, `saleid` and `vendorid`, are subsets of the primary key.

In the below example, the table has a primary key. The `KEY` parameter specified, `locationid`, is *not* a subset of the primary key, and therefore cannot be used as the shard key.

***AVOID***
```
...
CONSTRAINT PRIMARY KEY("saleid,vendorid”))
PARTITION BY HASH(n) KEY ("locationid");
```

When you shard a large table, you select a _shard key_ from the table. This key
exists in every shard. Choosing a shard key plays an important role in
the number of shards and the size of any single shard.

## Best practices for choosing a shard key
Here is a full `CREATE TABLE` statement.

```
CREATE TABLE "sales_fact"
  ("saleid" int,
  "locationid" int,
  "vendorid" int,
  "quantity" int,
  "sale_amount" double,
  "fruitid" int,
  CONSTRAINT
PRIMARY KEY("saleid,vendorid"))
PARTITION BY HASH(96)
KEY ("saleid");
```

The shard key is a subset of the primary key. However, that is not the only guideline to follow when choosing a shard key.

1. **If the table has a primary key, the shard key must be a subset of the primary key.**

    If the shard key is ***not*** a subset of the primary key, and the shard key changes, data with the same primary key may reside in different nodes. This impacts ThoughtSpot's performance, and may result in incorrect query results.

    You should not use a shard key that is not a subset of the
    primary key. If you use a shard key that is not a subset of the primary key, it is
    possible to get two versions of a record if the shard key for a record changes,
    but the primary key does not. In the absence of
    a unique shard key, the system creates a secondary record rather than doing a SQL
    MERGE (`upsert`). These two versions of a record may result in incorrect results when you search your data in ThoughtSpot.

    If you try to use a shard key that is not a subset of the primary key, your `CREATE TABLE` command returns an error.

2. **Choose a shard key that distributes data well across keys.**

    For example, suppose the table you want to shard has a primary key made up of
    `saleid`,`custid`,and `locationid`. The table has 10K sales, 400 locations,
    and 2000 customers. If 5K sales are in just two locations, you should not use `locationid` as your shard key. If you use `locationid` as your shard key, you have data in fewer shards, which impacts performance. Instead, you should use `custid` or `locationid`.

    As a more concrete example, suppose you want to shard a table of retail data. Many retailers have an increase in sales around the winter holidays. You should not use `date` as your shard key, because you may have five or ten times your usual number of daily transactions during the month of December. Using `date` as your shard key would result in data skew, and would impact performance.

    Here is an example of data skew, where `Los Angeles` has many more transactions than the average, so you should not use `store county` as your sharding key.

    ![Skew example]({{ site.baseurl }}/images/sharding-skew.png "Skew example")

    You may also have to clean up your data and any null values before sharding. For example, your retail data may have a `customer` column. One of the values for `customer` may be `unknown`. A value like `unknown` would exist in many more transactions than a single customer name. A value like `unknown`, or any null values, result in data skew, and impact performance.

3. **Choose a shard key that results in a wide variety of keys.**

    For example, suppose the table you want to shard has a primary key made up of
    `saleid`, `productid`, and `locationid`. The table has 10K sales, 40
    locations, and 200 products. Even if the sales are evenly distributed across
    locations, you should not use `locationid` in your shard key, because there are only 40 possible keys. Instead, use `saleid` or `productid` for more variety.

4. **If you plan to join two or more tables that are both sharded, both tables must use the same shard key.**

    This guideline ensures better join performance. For example, if you have two tables
    and the primary keys are:

    `PRIMARY KEY("saleid,vendorid")` on A<br>
    `PRIMARY KEY("saleid,customerid")` on B

    Use `saleid` as the shard key when you shard both tables.

You can always use your primary key as a shard key. If you have trouble picking another shard key based on the above requirements and best practices, use your primary key.

## Sharded dimension tables

 In a typical schema,
you'd have a sharded fact table, with foreign keys to small dimension tables.
ThoughtSpot replicates these small dimension tables in their entirety and distributes them on every node. This works best if your dimension tables are under 50MB in size.

If you have a large dimension table, replicating it and distributing it can
impact the performance of your ThoughtSpot system. In this case, you want to
shard the dimension tables *and* the fact table. Note that you can co-shard multiple fact tables and one or more dimension tables on the same shard key. ThoughtSpot can handle chasm traps.

When sharding both a fact table and its dimension table(s), (known as co-sharding) keep
in mind the guidance for creating a shard key. Only shard dimension tables if
the dimension table is large (over 50MB), and the join between the fact and
dimension tables uses the same columns. Specifically, the tables must:

-   be related by a primary key and foreign key
-   be sharded on the same primary key/foreign key
-   have the same number of regions (or shards)

If these requirements are met, ThoughtSpot automatically co-shards the tables
for you. Co-sharded tables are always joined on the shard key. Data skew can
develop if a very large proportion of the rows have the same value for the shard key. For example, you may have an `unknown` value for a `customer` column. Many of the rows of a fact table may include this value, resulting in data skew. Refer to [sharding best practices](#sharding-best) to learn how to check for data skew.

You can view your `row count skew` from the ThoughtSpot application. Go to **admin**, then **System health**, then **data**. Choose the table you would like to view, and scroll to `row count skew`. Use this number to calculate your row count skew ratio: row count skew / (total row count / number of partitions). A row count skew ratio higher than 1 may require changes to your data modeling.

This example shows the `CREATE TABLE` statements that meet the criteria for
sharding both a fact table and its dimension table:

```
TQL> CREATE TABLE products_dim (
  "id" int,
  "prod_name" varchar(30),
  "prod_desc" varchar(100),
  PRIMARY KEY ("id")
)
PARTITION BY HASH (96) KEY ("id")
;

TQL> CREATE TABLE retail_fact (
  "trans_id" int,
  "product_id" int,
  "amount" double,
  FOREIGN KEY ("product_id") REFERENCES products_dim ("id")
)
PARTITION BY HASH (96) KEY ("product_id")
;
```

## Joining two sharded fact tables

You can also join two sharded fact tables with different shard keys, but it is not recommended. This is
known as _non co-sharded_ tables. It may take a while to join two tables sharded
on different keys, since ThoughtSpot has to redistribute your data. Therefore,
ThoughtSpot recommends that you use a common shard key for two fact tables.

You are not limited by the column connection or relationship type.

{: id="sharding-best"}
## Sharding best practices
There are several best practices related to sharding.

1. Shard your tables **before** loading data.

    Your data loads faster if you have already sharded the tables. Use the `CREATE TABLE` command to specify how you want your tables sharded, but do not load any data. After you shard the tables, your data loads faster.

2. You may need to re-evaluate your sharding over time, as your data evolves. Take a look at how your sharding impacts performance after you change your data significantly. Data also changes naturally over time, so you should re-evaluate sharding at a regular cadence.

    To evaluate your sharding strategy, run the following script. It checks for over- or under-sharded tables on your cluster.

    1. Log into your cluster on the command line.
        ```
        $ ssh admin@<cluster-IP>
        ```

    2. Run the following script to check for over- or under-sharded tables.
        ```
        $ /usr/local/scaligent/release/bin/sharding_diagnostics.sh 
        ```

    3. Adjust your sharding strategy appropriately.

    Note that resharding automatically loads data into a new incarnation of the table you sharded. You do not need to reload the table's data.

3. Check your `row count skew` ratio when you re-evaluate sharding.

    You can view your `row count skew` from the ThoughtSpot application. Go to **admin**, then **System health**, then **data**. Choose the table you would like to view, and scroll to `row count skew`. Use this number to calculate your row count skew ratio: row count skew / (total row count / number of partitions). A row count skew ratio higher than 1 may require changes to your data modeling.
