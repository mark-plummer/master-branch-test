---
title: [Proximity keywords 'near' and 'farther than']
last_updated: tbd
summary: "If your table contains Latitude and Longitude data, you can use proximity searches that find entities related to each other by location."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
The "near" and "farther than" keywords provide proximity searches. First, you must designate the longitude and latitude columns as "Geo" by editing the GeoType column in the modeling file or the **Columns** setting screen.

Columns that can be designated as "Geo" columns need to contain text (VARCHAR) data unless they contain latitude/longitude data. Latitude and longitude columns can contain numeric data (DOUBLE) or text.

If you are using a column with the data type DOUBLE for latitude and longitude, you must change the following settings for those columns:

-   Set Column Type to ATTRIBUTE.
-   Set Additive to NO.
-   Set Aggregation Type to NONE.

If you want to be able to use one of the keywords _near_, _near…within n miles|km|meters_, or _farther than n miles|km|meters from_, the data source (worksheet or one of the tables) must contain a column of type longitude and a column of type latitude, and these must be set using the appropriate GeoType, as shown in this procedure.

**Note:** The latitude and longitude data have to be on the same base tables for the feature to work.

These keywords allow you to search with spatial filters on data contained in a table or worksheet which contains geo type columns with latitude/longitude data. This lets you search based on spherical distance. The distance is calculated as a straight-line distance (not road distance) radius using miles, kilometers, or meters from the central point. If not specified, the default is 10 km.

 ![]({{ site.baseurl }}/images/geospatial_search.png "Geospatial search on a geo area map")

**Note:** These keywords have the following properties:

-   they work on duplicate counties
-   they can be used in filtering
-   they display a circle that represents the specified distance on the geo charts when filtering on a GeoType column
-   they are limited to 33 latitude/longitude pairs

1. Find the **GEO CONFIG** for the column that contains the geographical data.
2. Change the value to the appropriate GeoType, depending on the kind of data the column contains.
3. If your data includes latitude and/or longitude columns that are stored as a numeric data type (DOUBLE), make these changes for those columns:
    1. Change the **Type** or **ColumnType** to ATTRIBUTE.
    2. Change **ADDITIVE** to NO/FALSE.
4. Save your changes.

## List of geotypes

{% include content/geotypes.html %}
