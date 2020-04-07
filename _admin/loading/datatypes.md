---
title: [Data types]


last_updated: 3/26/2020
summary: "ThoughtSpot supports the common data types."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Before you import data, compare the data types you want to load with these supported data types. Then, convert your data before loading it. Typically, you would export the data, transform it to meet these type rules, and then load the data. This is known as an extract-transform-load process.

## Supported data types

The tables you create to receive the data must have the same number of columns and data types as the data you will be loading. Choose a data type for each column from the list of supported data types:

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="50%" />
</colgroup>
  <tr>
    <th>Data</th>
    <th>Supported data types</th>
    <th>Details</th>
  </tr>
  <tr>
    <td>Character</td>
    <td><code>VARCHAR(*n*)</code></td>
    <td>Specify the maximum number of characters, as in <code>VARCHAR(255)</code>. The size limit is 64MB for <code>VARCHAR</code> values.</td>
  </tr>
  <tr>
    <td>Floating point</td>
    <td><code>DOUBLE</code> or <code>FLOAT</code></td>
    <td><code>DOUBLE</code> is recommended. <code>DOUBLE</code> has a range of <code>1.7E +/- 308</code> (15 digits).</td>
  </tr>
  <tr>
    <td>Boolean</td>
    <td><code>BOOL</code></td>
    <td>Can be <code>true</code> or <code>false</code>.</td>
  </tr>
  <tr>
    <td>Integer</td>
    <td><code>INT32</code> or <code>INT64</code></td>
    <td><code>INT32</code> holds 32 bits. <code>INT64</code> holds 64 bits. <code>INT32</code> has a range of <code>–2,147,483,648</code> to <code>2,147,483,647</code>. <code>INT64</code> has a range of <code>–9,223,372,036,854,775,808</code> to <code>9,223,372,036,854,775,807</code>.</td>
  </tr>
  <tr>
    <td>Date or time</td>
    <td><code>DATE</code>,  <code>DATETIME</code>, <code>TIMESTAMP</code>, <code>TIME</code></td>
    <td><code>DATETIME</code>, <code>TIMESTAMP</code>, and <code>TIME</code> are stored at the granularity of seconds. <code>TIMESTAMP</code> is identical to <code>DATETIME</code>, but is included for syntax compatibility.</td>
  </tr>
</table>

{% include warning.html content="There is a 64MB limitation on the number of characters for `VARCHAR`. If you have any `VARCHAR` data that exceeds this limit, the entire load will fail."%}

## Geographical data types

For geographical data types, use `VARCHAR`. Use `VARCHAR` as the data type for zipcodes and other geographical data so that the geographical data in your table defaults to the correct configuration. See the following example:

![Geo data example]({{ site.baseurl }}/images/geoconfig-zipcodes.png "Geo data example")

In the above example, the zipcodes were imported as text values. By default, the `data type` is `VARCHAR`, the `column type` is `attribute`, and `additive` is `no`. You must specify the `geo config` for your data yourself. ThoughtSpot does not specify geo config automatically.

If you import zipcodes as numeric values, the data type defaults to `INT64`. ThoughtSpot recommends that you import zipcodes as text values. The `column type` defaults to  `measure` when you import numeric values. In ThoughtSpot, a `measure` is a numeric value that you can you use in mathematical formulas. For zipcodes, you ***must*** change the `column type` to `attribute` and specify `additive` as `no`.

For latitude and longitude, you can use either `VARCHAR` or `DOUBLE`. After loading the data, designate it as a geographical data type when you [Edit the system-wide data model]({{ site.baseurl }}/admin/data-modeling/edit-model-file.html#). Wherever abbreviations or codes are used, they are the same as what the USPS (United States Postal Service) recognizes.

These data types can be designated as geographical data, which enables them to be visualized using the Geo chart types:

* Countries, for example:
  - United States
    -   `long name`: United States
    -   `name_sort`: United States of America
    -   `abbreviation`: U.S.A.
    -   `adm0_a3`: USA
    -   `adm0_a3_is`: USA
    -   `adm0_a3_us`: USA
    -   `admin`: United States of America
    -   `brk_a3`: USA
    -   `brk_name`: United States
    -   `formal_en`: United States of America
    -   `iso_a2`: US
    -   `iso_a3`: USA
    -   `iso_n3`: 840
* `COUNTY` for counties in the United States, for example:
  -   santa clara county
  -   pike county, ohio
  -   pike county, OH
* `STATE_PROVINCE` for states in the United States, for example:
  -   `name`: California
  -   `US Postal Service abbreviation`: CA
* `LATITUDE` which must be used with `LONGITUDE`, for example:
  -   37.421023
  -   1.282911
* `LONGITUDE` which must be used with `LATITUDE`
  -   122.142103
  -   103.848865
* `ZIP_CODE` for zip codes in the United States
  -   `po_name`: MT MEADOWS AREA
  -   `ZIP`: "00012"
  -   `zip2`: 12
* Other Sub-nation Regions which are administrative regions found in countries other than the United States, for example:
  -   bremen
  -   normandy
  -   west midlands
  {% include important.html content="You cannot upload your own custom boundaries." %}
