---
title: [Data loading too slowly]
summary: If your data is loading slowly, there are a few things you can do to fix it.
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Some tables may take an unusually long time to load due to a high data version
issue. This issue normally arises when ThoughtSpot completes an upgrade or the
system is recovering after a crash.

The data version is the number of loads that have been historically applied to a
table. Every completed load increments the version number of the table by one.
ThoughtSpot would need to process each version of the table during restoration,
which could increase the time it takes to build the table.

There are a few steps you can take to check for a high data version issue and
fix it. To improve data loading speed, run the following command to find the
number of tables that are building and their names

```
tscli cluster status --mode table
```

You may notice that a few small tables are taking up a lot of time to be built.
This could simply be due to the deceivingly large size of the table. There is
also the chance it could be due to a high data version issue. To determine if
this is a high data version issue, check the size of the table by running the
following command:

```
echo 'show statistics for server;' | tql
```

If there is a large number of rows in the table, go on to shard the table. If
the table has a small number of rows, then the slow loading speed is caused by a
high data version issue, and you do not have to shard the table. Use the compact
table functionality to trim the table down to its actual size:

```
tql> compact table <table name>;
```
