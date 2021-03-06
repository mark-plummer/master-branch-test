---
title: [Data REST API pagination]

last_updated: tbd
summary: "You can paginate the JSON response that is called from the REST API. The order of the data is retained from page to page."
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Given the ability to paginate, you can quickly populate tables and make new REST calls every time you go to the next page of the data on the table. There is significant load time if you want to populate the data table with many rows (greater than 1000) from the Data REST API.

To paginate results in your API response, you must add new parameters to the query:

`PageSize` determines the number of rows to be included.

```
{
    "name": "pagesize",
    "description": PageSize: The number of rows.",
    "defaultValue": "-1",
    "type": "integer"
}
```

`Offset` determines the starting point.

```
{
    "name": "offset",
    "description": Offset: The starting point",
    "defaultValue": "-1",
    "type": "integer"
}
```

`PageNumber` is an alternate way to determine the offset. You must make a call with `pageNumber = 1` first. Then you can access any page. Calling with `pageNumber != 1` as the initial call will fail. `pageNumber = 0` is not a valid value.

```
{
    "name": "pagenumber",
    "description": PageNumber: This is an alternate way to set offset. This is 1-based
                   indexing. Offset = (pageNumber - 1) * pageSize.
    "defaultValue": "-1",
    "type": "integer"
}
```

`FormatType` is the JSON format type.

```
{
    "name": "formattype",
    "description": FormatType: This sets the JSON format type. Values that are allowed are
                   FULL and COMPACT.
    "defaultValue": "COMPACT",
    "type": "string"
}
```

`COMPACT` is the default type, and is formatted as follows: `['col1', 'col2'] [1, 'a']`. While `FULL` is formatted like this: `{'col1': 1 'col2': 'a'}`

## Example

The following example shows ThoughtSpot data that is being populated in a table:

```
 /**
 * Sample response for Page-1.
 */
{
    "totalRowCount": 1500,
    "pageSize": 100,
    "pageNumber": 1
        "data":
    [    
       {
            "key1": "value1",
            "key2": "value2",
        },
        {
            "key1": "value1",
            "key2": "value2",
        },
    ]
}
```
