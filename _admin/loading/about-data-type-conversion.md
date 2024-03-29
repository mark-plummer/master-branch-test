---
title: [Convert column data type]


last_updated: tbd
summary: "You can convert the data in a column from one data type to another by issuing a TQL command. "
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
There are some details you should be aware of when doing a data type conversion.

## Data type conversion behavior

When converting from one data type to another, any values that can not be
converted will be set to NULL. If errors occur during data type conversion, the
operation is aborted. However, you may choose to force the conversion despite
the errors. You can start TQL in allow_unsafe mode to continue with the data
conversion, at your own risk, of course! To start TQL in unsafe mode, issue this
command:

```
tql --allow_unsafe
```

Multiple columns of a single table can be converted using a single TQL command.
The behavior is transactional. So for example, you would issue a command like
this example:

```
ALTER TABLE products
   MODIFY COLUMN product_id int,
   MODIFY COLUMN supplier VARCHAR(4);
```

Also note that changing data type has implications on the primary key and
sharding enforcement. For example, changing the data type of a column that is
part of the sharding key would lead to a redistribution of data. Then imagine
that the sharding key column contained the text values `00100`, `0100`, and
`100`, which all map to same integer value. If this type of a column is changed
from a `VARCHAR` to an `INT`, then it would be subject to the upsert behavior on
primary keys. So, in this example, only one of the three rows would be preserved.

Be aware that data type conversion will preserve the data in the underlying
database table, but there is no guarantee that any objects built on top of it
(worksheets or pinboards) will be preserved. This is because you might make a
data type change that makes a chart built on top of the table invalid (for
example a growth chart would be invalidated if the date column it depends on
were changed to a varchar column).

## Supported data type conversions

In general, the data type conversions that make logical sense are supported. But
there are a few nuances you should be aware of:

-   When you convert from `INT` to `BOOL`, zero is converted to false, and all non-zero values are converted to true.
-   When you convert from `BOOL` to `INT`, true gets converted to 1, and false gets converted to 0.
-   When you convert from `DOUBLE` to `INT`, the value gets rounded.
-   When you convert from `INT` to `DOUBLE`, the value gets rounded.
-   When you convert from `DATETIME` to `DATE`, the date part of value is preserved and the time part is dropped.
-   When you convert from `DATE` to `DATETIME`, the time gets added as `00:00:00`. The date part of the value is preserved.
-   When you convert from `DATETIME` to `TIME`, the time part of the value is preserved.
-   Conversion from TIME to `DATETIME` is not supported.

## Date and time conversions

Some data type conversion require a format string. These include:

-   conversion from `DATE`/`TIME`/`DATETIME`
-   conversion to `DATE`/`TIME`/`DATETIME`

For these types of conversions, you can use a special syntax using parsinghint
and the date format specifications supported in the [strptime library
function](http://man7.org/linux/man-pages/man3/strptime.3.html).

For the example, first create a table with a timestamp stored as a `VARCHAR`:

```
CREATE TABLE fruit_sales
   (time_of_sale VARCHAR(32));

INSERT INTO fruit_sales
   VALUES ('2015-12-29 13:52:39');
```

Now, convert the column from a `VARCHAR` to `DATETIME`, using the format `%Y-%m-%d %H:%M:%S`:

```
ALTER TABLE fruit_sales
   MODIFY COLUMN time_of_sale DATETIME
   [parsinghint="%Y-%m-%d %H:%M:%S"]
```

Finally, convert the column back to VARCHAR:

```
ALTER TABLE fruit_sales
   MODIFY COLUMN time_of_sale VARCHAR(32);
```

## String to boolean conversions

String to boolean conversions have format strings, too. You can use `parsinghint`
as you do for date and time conversions. You can choose among these approaches:

**OPTION 1: Specify string values for both true and false.** Any non-matching values
get converted to null. In this example, "100" gets converted to true, and "0"
gets converted to false. "-1" gets converted to null.

```
ALTER TABLE db
   MODIFY COLUMN s bool [parsinghint="100_0"];
```

**OPTION 2: Specify a string value for true.** Any non-matching value gets converted
to false. In this example, "100" gets converted to true, "-1" and "0" get
converted to false.

```
ALTER TABLE db
   MODIFY COLUMN s bool [parsinghint="100_"];
```

**Option 3: Specify a string value for false.** Any non-matching value get
converted to true. In this example, "-1" and "100" get converted to true, and
"0" gets converted to false.

```
ALTER TABLE db
   MODIFY COLUMN s bool [parsinghint="_0"];
```


## String to boolean conversions

When converting from a string to a boolean, you must specify a string for true and false. By default, a string to boolean conversion generates `true` for `true`, `false` for `false`.

```
ALTER TABLE db
   MODIFY COLUMN b varchar(32);
```

But you may override the default strings that get generated by using
`parsinghint`, as in this example:

```
ALTER TABLE db
   MODIFY COLUMN b varchar(32) [parsinghint="tr_fa"];
```

## Change the Data Type of a Column

When you issue the TQL command to convert a column from one data type to
another, the conversion is handled automatically. However, you must ensure
that any visualizations built on top of the table display correctly.

You should always take a snapshot of your database before making any schema
changes. This will allow you to revert back to the prior state if you make an
error, or something doesn't work as you expected after the schema change.

When changing a data type in an existing table, be aware that answers and
pinboards created on top of that table (or worksheets that include it) may
change. This is because charts and aggregations depend upon the data type. So
for example changing from `INTEGER` to `VARCHAR` could break charts that used
the numeric data type `INTEGER` to calculate an average or a total. Because of
this, use caution, and check all dependent objects before and after changing the
data type, to ensure that they display as intended.

To change the data type of a column:

1. [Connect to the database with the ThoughtSpot SQL Command Line (TQL)](prep-schema-for-load.html#connect-with-tql).
2. Issue the command to change the data type using this syntax:

    ```
    TQL> ALTER TABLE <table>
         MODIFY COLUMN <column> <new_data_type>;
    ```

    For example:

    ```
    ALTER TABLE fact100
       MODIFY COLUMN product_id int;
    ```
