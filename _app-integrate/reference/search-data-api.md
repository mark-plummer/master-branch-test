---
title: [Search Data API]
last_updated: 01/28/2020
summary: "To use the data retrieved from a search query programmatically, you can first query this data using the ThoughtSpot Search Data API."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

It is often difficult to programmatically use the result set of a query that runs in the ThoughtSpot UI search  bar.  To use the data that we retrieve from a query programmatically, you can use ThoughtSpot Search Data API.

When issuing a query through the ThoughtSpot UI, users make selections to disambiguate a query. Because selection is not possible with an API approach, we modified the API query language to include query disambiguation. See [Components of a search query](#components).

## Resource URL

<code class="api-method-post">post</code>/tspublic/v1/searchdata

## Request Parameters

<table>
   <colgroup>
      <col style="width:20%" />
      <col style="width:15%" />
      <col style="width:65%" />
   </colgroup>
   <thead>
      <tr>
         <th>Query Parameter</th>
         <th>Data Type</th>
         <th>Description</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td><code>query_string</code></td>
         <td>string</td>
         <td>The data search query.<p>See <a href="#components">Components of a search query</a>.</p></td>

      </tr>
     <tr>
         <td><code>data_source_guid</code></td>
         <td>string</td>
         <td>The GUID of the data source, either a worksheet, a view, or a table.<p>Example: <code>["4fdf9d2c-6f34-4e3b-9fa6-bd0ca69676e1"]</code></p>
         </td>
      </tr>
      <tr>
         <td><code>batchsize</code></td>
         <td>integer</td>
         <td>The batch size for loading search objects.<p>The system default is <code>-1</code>.</p></td>

      </tr>
      <tr>
         <td><code>pagenumber</code></td>
         <td>integer</td>
         <td>Alternate way to specify <code>1</code>-based offset:
         <p><code>indexingOffset = (pageNumber - 1) * batchSize</code></p>
         <p>The system default is <code>-1</code>.</p></td></tr>
     <tr>
         <td><code>offset</code></td>
         <td>integer</td>
         <td>Specify a <code>1</code>-based offset.
         <p>The system default is <code>-1</code>.</p></td>

      </tr>
      <tr>
         <td><code>formattype</code></td>
         <td>string</td>
         <td>The format of the data.<p>Valid values are <code>COMPACT</code> (default) or <code>FULL</code> JSON.</p></td>
      </tr>
   </tbody>
</table>

{: id="components"}
## Components of a search query

In ThoughtSpot Query Language, we classify components of a query into various types of tokens: _[Column](#column)_, _[Operator](#operator)_, _[Value](#value)_, _[Date Bucket](#date-bucket)_, _[Keyword](#keyword)_, and _[Calendar](#calendar)_:

<dl>
<dlentry id="column">
<dt>Column</dt>
<dd>
<p>Columns must be enclosed in square brackets, <code>[ ]</code>.</p>
<p><strong>Example</strong> In the query <code>revenue by ship mode</code>, both <code>revenue</code> and <code>ship mode</code> are columns. A valid query for the API is:</p>
<pre>[revenue] by [ship mode]</pre>
</dd>
</dlentry>
<dlentry id="operator">
<dt>Operator</dt>
<dd>
<p>ThoughtSpot supports various operators such as <code>=</code>, <code>!=</code>, <code>&gt;</code>, <code>&gt;=</code>, <code>&lt;=</code>, <code>&lt;</code>, <code>contains</code>, <code>not contains</code>, and so on. Use these operators in the API query in the same manner as in the UI.</p>
<p><strong>Example</strong> Specify <code>revenue</code> over 1000, and limit <code>ship mode</code> to 'air':</p>
<pre>[revenue] &gt; 1000 [ship mode] = &lsquo;air&rsquo;</pre>
</dd></dlentry>

  <dlentry id="value">
  <dt>Value</dt>
<dd><p>All user-defined column values and constants must be enclosed within quotes, <code>&rsquo; &rsquo;</code>. </p>
  <p>When using multiple values, separate them by a comma, <code>,</code>.</p>
  <p><strong>Example</strong> When a ThoughtSpot UI query is <code>revenue top 2 ship mode</code>, the equivalent API is:</p>
  <pre>[revenue] top 2 [ship mode]</pre>
  <p><strong>Example</strong>  When a ThoughtSpot UI query is <code>revenue ship mode = air</code>, the equivalent API is:</p>
  <pre>[revenue] [ship mode] = &lsquo;air&rsquo;,&rsquo;ship mode&rsquo;</pre></dd>
  </dlentry>

  <dlentry id="date-bucket">
    <dt>Date Bucket</dt>
<dd>
<p>In the ThoughtSpot UI, when there are several date columns, users can bind date bucket tokens to a specific column. When using the API, this binding between the date column and the date bucket must be made explicit. The column with which the date bucket is bound, and the date bucket token, must be separated by a period, <code>.</code>.</p>
<p>Single word date buckets can be expressed <em>as is</em>. Multi-word date buckets must be enclosed within quotes.</p>
<p><strong>Example</strong> When a ThoughtSpot UI query is <code>revenue commit date monthly</code>, and if <code>monthly</code> is bound to <code>commit date</code>, the equivalent API is:</p>
<pre>[revenue] [commit date].monthly</pre>
<p><strong>Example</strong> When a ThoughtSpot UI query is <code>revenue day of week = 5</code>, and if <code>day of week</code> is bound to <code>commit date</code>, the equivalent API is:</p>
<pre>[revenue] [commit date].'day of week' = 5</pre>
</dd>
  </dlentry>

  <dlentry id="keyword">
    <dt>Keyword</dt>
    <dd><p>Use keywords in the API query in the same manner as in the UI.</p>
    <p><strong>Example</strong> When a ThoughtSpot UI query uses keywords <code>growth of</code> and <code>sort by</code>, the equivalent API form is:</p>
    <pre>growth of [revenue] by [commit date]</pre></dd>
  </dlentry>

  <dlentry id="calendar">
    <dt>Calendar</dt>
    <dd><p>You can specify a custom calendar in the query. Use the <code>calendar.<em>calendar_name</em></code> format explicitly.</p>
  <p>When the calendar name contains multiple words, these words must be enclosed in single quotes.</p>
<p><strong>Example</strong> When a ThoughtSpot UI query is <code>revenue by commit date fiscal</code>, where the name of the calendar is <code>fiscal</code>, the equivalent API is:</p>
  <pre>[revenue] by [commit date] calendar.fiscal</pre>
  <p><strong>Example</strong> When a ThoughtSpot UI query is <code>revenue by commit date my calendar</code>, where the name of the calendar is <code>my calendar</code>, the equivalent API is:</p>
  <pre>[revenue] by [commit date] calendar.'my calendar'</pre></dd>
  </dlentry>
</dl>

## Request example

##### cURL - COMPACT

```
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-Requested-By: ThoughtSpot' 'https://<instance>/callosum/v1/tspublic/v1/searchdata?query_string=%5Bsales%5D%20%5Bstore%20region%5D&data_source_guid=06517bd1-84c0-4bc6-bd09-f57af52e8316&batchsize=-1&pagenumber=-1&offset=-1&formattype=COMPACT'
```

##### Request URL - COMPACT

```
https://<instance>/callosum/v1/tspublic/v1/searchdata?query_string=%5Bsales%5D%20%5Bstore%20region%5D&data_source_guid=06517bd1-84c0-4bc6-bd09-f57af52e8316&batchsize=-1&pagenumber=-1&offset=-1&formattype=COMPACT
```

##### cURL - FULL

```
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-Requested-By: ThoughtSpot' 'https://<instance>/callosum/v1/tspublic/v1/searchdata?query_string=%5Bsales%5D%20%5Bstore%20region%5D&data_source_guid=06517bd1-84c0-4bc6-bd09-f57af52e8316&batchsize=-1&pagenumber=-1&offset=-1&formattype=FULL’
```

##### Request URL - FULL
```
https://<instance>/callosum/v1/tspublic/v1/searchdata?query_string=%5Bsales%5D%20%5Bstore%20region%5D&data_source_guid=06517bd1-84c0-4bc6-bd09-f57af52e8316&batchsize=-1&pagenumber=-1&offset=-1&formattype=FULL
```

## Response example

```
{
  "columnNames": [
    "Store Region",
    "Total Sales"
  ],
  "data": [
    [
      "east",
      18934491.05134509
    ],
    [
      "midwest",
      29157090.327609923
    ],
    [
      "south",
      25484693.074720126
    ],
    [
      "southwest",
      34241076.52103955
    ],
    [
      "west",
      30848491.458509445
    ]
  ],
  "samplingRatio": 1,
  "totalRowCount": 5,
  "rowCount": 5,
  "pageSize": 100000,
  "offset": 0
}
```

## Using the Search Data API

To test the search query API, follow these steps:

{: id="get-guid"}
##### Determine the GUID of the data source

1. In a Web Browser tab, navigate to the following address, and log in as admin user:

   ```
   https://<instance>/
   ```

2. In the top navigation, click **Data**.

   Alternatively, navigate to the following address:

   ```
   https://<instance>/#/data/tables/
   ```

3. Select a data source that you plan to query: a worksheet, a table, or a view.

4. In the address bar of the Web Browse, note the GUID of the selected data source; it is the last string of the address.  For example, in the following address string, the GUID is `9d93a6b8-ca3a-4146-a1a1-e908b71b963f`:

    ```
    https://<instance>/#/data/tables/9d93a6b8-ca3a-4146-a1a1-e908b71b963f
    ```

5. Copy and save the GUID.

##### Run the Search Data API

1. In another browser, navigate to the following address:

  ```
  https://<instance>/external/swagger/#!/tspublic%2Fv1/searchData
  ```

2. Click on `POST /tspublic/v1/searchdataTS`.

   The parameter interface appears.

3. In the **Parameters** interface, enter the values for the following:

    - `query_string` is the actual search query. See [Components of a search query](#components).
    - `data_source_guid` is the identifier you  obtained earlier, in [Determine the GUID of the data sources](#get-guid).

    You can leave other parameters at their default value.

4. Click **Try it out!**, and note the results.

   You may wish to check that the same query, when you run it in the ThoughtSpot UI search bar (with slightly different syntax), returns the same data.

## Limitations of Search Query API

- To avoid join path ambiguities, a query can use only a **single data source**.

- Search execution of query strings is **case insensitive**.

- All Column names in the data source must have **unique names** that also pass the "case insensitivity" test.

  For example, Columns `[Revenue]` and `[revenue]` are not unique.
- Column names cannot contain square brackets, `[` or `]`.

- Values must be enclosed in quotes, `‘’`, but they cannot contain quotes.

- The API does not support **in-query formula** definitions. To use a formula, first create it on the worksheet or a table using the ThoughtSpot UI, and then use the named formula inside the API query.

- Users must be **authenticated** and have **read access** to the data source.
