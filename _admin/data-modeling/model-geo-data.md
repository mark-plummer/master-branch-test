---
title: [Add a geographical data setting]
summary: Learn how to model your geographical data.
last_updated: 3/26/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Certain attribute columns that contain location data can be used to create
GeoMaps. ThoughtSpot supports Latitude, Longitude, Zip Code, US States, US
Counties, Countries, and select international sub-nation regions.

You can designate a column as `Geo` by editing the **GEO CONFIG** column in the
table **Columns** page. You cannot edit the geo configuration column information
in the `model.xls` file.

## Guidelines for geographic columns

Columns that can be designated as `Geo` columns need to contain text (`VARCHAR`)
data unless they contain latitude/longitude data. Latitude and longitude columns
can contain numeric data (`DOUBLE`) or text.

If you import `geo` columns as numeric values, the data type defaults to `INT64`. ThoughtSpot recommends that you import `geo` columns, such as zipcodes as text values. The `column type` defaults to  `measure` when you import numeric values. In ThoughtSpot, a `measure` is a numeric value that you can you use in mathematical formulas. For geo data, you ***must*** change the `column type` to `attribute` and specify `additive` as `no`.

If you are using a column with the data type `DOUBLE` for latitude and
longitude, change the following settings for those
columns:

-   set **Column Type** to `ATTRIBUTE`
-   set **Additive** to `NO`
-   set **Aggregation Type** to `NONE`

For information on these settings, see [Set ADDITIVE or AGGREGATION](change-aggreg-additive.html).

As a best practice, you should make the following changes to your geographical data ***before*** importing it to ThoughtSpot:

1. Specify `geo` columns as text values, and not numeric.

2. Make sure your data is specific, and does not contain duplicates.

    | For example, you may be collecting data for locations in Washington County, Alabama, and also for locations in Washington County, Wisconsin.<br/><br/>According to the 2010 Census, there are 31 distinct Washington Counties in the United States.<br/><br/>To account for multiple different geographical entities with the same name, you must be specific within your data.<br/><br/>A value of *Washington County* without a state attached to it may result in incorrect or incomplete geo maps. | ![Washington Counties in United States]({{ site.baseurl }}/images/wa-county.png "Washington Counties in United States") |


## How to edit geographic columns

1. Find the **GEO CONFIG** for the column that contains the geographical data.
2. Select the column to display the **Specify Geographic Configuration** dialog.

    ![Configure geo data]({{ site.baseurl }}/images/geomap-config.png "Configure geo data")

3. Change the value to the appropriate **GEO CONFIG**, depending on the kind of geo data the column contains.

    If your data includes latitude and/or longitude columns that are stored as a
    numeric data type (`DOUBLE`), make these changes for those columns:

    1. Change the **Type** to `ATTRIBUTE`.
    2. Change **ADDITIVE** to `NO`/`FALSE`.

4. Save your changes.

## Supported geo maps

For a complete list of supported geo maps in ThoughtSpot, refer to: [Geo Map Reference]({{ site.baseurl }}/reference/geomap-reference#)

## Related information  

[Model the data for searching]({{ site.baseurl }}/admin/data-modeling/about-data-modeling-intro.html)
