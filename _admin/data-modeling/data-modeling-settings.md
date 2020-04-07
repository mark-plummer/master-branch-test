---
title: [Overview of data modeling settings]
summary: Learn about data modeling settings.
last_updated: 11/15/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

You can change data modeling settings in two ways, both of which change the model.
If you want to make a few small changes, you should [make them in the
ThoughtSpot application ]({{ site.baseurl
}}/admin/data-modeling/model-data-in-UI.html). If you want to make many changes
[you should edit the modeling file]({{ site.baseurl
}}/admin/data-modeling/edit-model-file.html#). Whether you are changing data
modeling settings using the modeling file or the Web interface, the settings and
their accepted values are the same.

## Modeling settings

The following index includes mutable data modeling settings that you can apply to columns, both tables and worksheets.

| Setting&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| Description |
| --- | ---|
| [Column Name](change-column-basics.html#change-the-column-name#) | Sets the name of the column to be used in searches. |
|[Description](change-column-basics.html#change-column-description) | Adds a text description of what the column contains. |
| [Data Type]({{ site.baseurl }}/admin/loading/datatypes.html#) | <strong>Read only.</strong> Shows the column's data type. |
| [Column Type](change-column-basics.html#change-column-type) | Sets the type of column, either `ATTRIBUTE` or `MEASURE`. |
| [Additive](change-aggreg-additive.html#) | Controls the type of aggregations that will be available for a column. |
| [Aggregation](change-aggreg-additive.html#) | Sets the default aggregation type for a column. |
| [Hidden](change-visibility-synonym.html#) | Sets the visibility of a column. |
| [Synonyms](change-visibility-synonym.html#) | Adds synonyms that can be used in the search bar to refer to a column. |
| [SpotIQ Preference](spotiq-data-model-preferences.html#) | Excludes specified columns from SpotIQ analyses. By Default, all columns are included in SpotIQ. |
| [Index Type](change-index.html#) | Sets the type of index that will be created for a column. |
| [Geo Config](model-geo-data.html#) | Enables a column to be used in GeoMap visualizations. |
| [Index Priority](change-index.html#) | Changes the priority of a column in search suggestions. |
| [Format Pattern](set-format-pattern-numbers.html#) | Specifies the format to use for numeric values or dates that show in the column. |
| [Currency Type](set-format-pattern-numbers.html#set-currency-type) | Specifies the format of currencies in a column. |
| [Attribution Dimension](attributable-dimension.html#) | Only applies to tables that join over a [Chasm Trap]({{ site.baseurl }}/admin/loading/chasm-trap.html#). Designates whether the tables depend on this column for attribution. |
| [Calendar Type]({{ site.baseurl }}/admin/setup/set-custom-calendar.html) | Specifies what type of calendar a date type column uses. It can be Gregorian calendar (default), a fiscal calendar, or any custom calendar. |
| [Entity Category](set-entity-category.html#) | Specifies how to categorize the data in the column: person, place, time, and so on. Important for configuring SearchIQ (**Beta**). |
| SearchIQ Enabled | Indicates if the column is enabled for SearchIQ. Note that SearchIQ is in **Beta**. |

## Data modeling best practices

As a best practice, make any data modeling settings in the table when you will be creating multiple worksheets that use that table. This way, you won't have to make the same settings in each worksheet. The settings will be inherited when you create worksheets that uses columns from the table.

If you have settings that only apply in the context of a particular worksheet, make those settings in the worksheet rather than in the underlying table(s).

Note that if you make your settings at the table level, and then create a worksheet that uses columns from the table, the settings are inherited from the table at the point in time that the worksheet is created. If you then go back and change the settings at the table level, your changes will not be reflected in the worksheet.

If you want the worksheet to have the changes you made at the table level, you must drop those columns from the worksheet and re-add them. Then save the worksheet. At this point, the new settings will be used in the worksheet. Note that any saved answers or pinboards based on the worksheet may display differently because of your changes. For example, if you've changed the GeoMap setting from "None" to "Country", you will now see a map where before you might have seen a table.

## Related information  

- [Model the data for searching]({{ site.baseurl }}/admin/data-modeling/about-data-modeling-intro.html)
- [Add a geographical data setting for a column]({{ site.baseurl }}/admin/data-modeling/model-geo-data.html)  
