---
title: [Chasm traps]


last_updated: tbd
summary: "A chasm trap occurs when two many-to-one joins converge on a single table."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
In a complex schema, you may have a fact table with no relationship to another
fact table, except that each contains a foreign key to a shared dimension table.
This is known as a chasm trap, and ThoughtSpot can handle it!

## Understand how chasm traps occur

A fact table, just as it sounds, stores facts about your business. If you are
selling apples, the sales fact table has facts about these apples.

| SaleID  | AppleTypeID  | StoreID  |  Units Sold |
|---|---|---|---|
| 4  |  55 |   2|  12 |
| 8 |  34 |  33 |  3 |
| 10  | 09  |  09 | 1  |

Dimension tables describe the attributes that are interesting to analyze. For
example, the apple table might look like this.

| AppleTypeID  | Color  | Name  | Use |
|---|---|---|---|
| 55  |  Red |   Red Delicious |  Snack |
| 34 |  Green |  Granny Smith |  Cooking |
| 09  | Yellow  |  Golden  | Snack  |

As you can imagine, in a business you might have several fact tables that access
dimension tables. So, an apple business may record waste as well as sales.

| TimeID  | AppleTypeID  | StoreID  |  Units Wasted |
|---|---|---|---|
| 4  |  55 |   2|  2 |
| 8 |  34 |  33 |  43 |
| 10  | 09  |  09 | 11  |

Both the sales and waste tables are facts that reference the apple dimension table.

A chasm trap in a data schema can introduce problems of over counting if you
join the two fact tables through their shared dimension table. This diagram
shows a typical complex schema with several tables that are related over a chasm
trap:

 ![]({{ site.baseurl }}/images/chasm_trap_complex.png "Complex schema with chasm traps")

Examples of use cases where a chasm trap could occur when attribution analysis
compare campaign data with purchase data, where all they have in common is that
both contain a customer identifier that is a foreign key to a customer dimension
table. Chasm traps also occur, for example, in cost of sales analysis when
wholesale orders data is only related to the retail sales data through a shared
products dimension table.

In many databases, joining tables across a chasm trap creates a _Cartesian
product_ or _cross join_. That is each row from the first fact table is joined to
each row from the second table. A Cartesian product causes over counting when
computing counts and aggregates. ThoughtSpot protects you from this kind of over
counting.

There are still just a few things to look out for when using a schema that contains chasm traps:

-   The tables should be joined to the dimension table by an equi-join (a primary key/foreign key relationship). They cannot be joined using a range of values.
-   Review the column setting called [Attribution Dimension]({{ site.baseurl }}/admin/data-modeling/attributable-dimension.html#). You may need to change this setting if some of the columns in the shared dimension table should not be used for attribution when combining fact tables.
-   Tables that will be joined across a chasm trap do not have to be co-sharded. They will be joined appropriately automatically in the most efficient way.

## Chasm trap limitations

Join information in **What am I Looking At?** does not appear for searches on a worksheet containing a chasm trap or on base tables that are related over a chasm trap.
