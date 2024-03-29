---
title: [Pinboard Data API]
summary: "You can retrieve the data in a pinboard or other ThoughtSpot visualization."
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

This API enables you to retrieve the data of a pinboard or visualization from the ThoughtSpot system. You may want to visualize the following:
 - Fetch all the visualization objects on a pinboard.
 - Fetch a specific or a group of visualizations on a pinboard.

## Resource URL

<code class="api-method-post">post</code> /tspublic/v1/pinboarddata

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
         <td><code>id</code></td>
         <td>string</td>
         <td>The pinboard id in the system.</td>

      </tr>
     <tr>
         <td><code>vizid</code></td>
         <td>string</td>
         <td>(Optional) The visualization id(s) on a pinboard. Use this parameter to fetch a specific visualization on a pinboard. The syntax is:
         <p><code>["4fdf9d2c-6f34-4e3b-9fa6-bd0ca69676e1", "......"]</code></p>
         </td>

      </tr>
      <tr>
         <td><code>batchsize</code></td>
         <td>integer</td>
         <td>The batch size for loading of pinboard objects. The system default is <code>-1</code>. </td>

      </tr>
      <tr>
         <td><code>pagenumber</code></td>
         <td>integer</td>
         <td>
            The system default is <code>-1</code>.
         </td>

         </tr>
     <tr>
         <td><code>offset</code></td>
         <td>integer</td>
         <td>The system default is <code>-1</code>. Alternately, set the offset using the following code:
         <p><code>1-based indexingOffset = (pageNumber - 1) * batchSize</code></p></td>

      </tr>
      <tr>
         <td><code>formattype</code></td>
         <td>string</td>
         <td>Valid values are <code>COMPACT</code> or <code>FULL</code> JSON. The system default is <code>COMPACT</code>. </td>

      </tr>
   </tbody>
</table>

## Request Example

##### cURL

```
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-Requested-By: ThoughtSpot' 'https://<instance>/callosum/v1/tspublic/v1/pinboarddata?id=f4533461-caa5-4efa-a189-13815ab86770&batchsize=-1&pagenumber=-1&offset=-1&formattype=COMPACT'
```

##### Request URL

```
https://<instance>/callosum/v1/tspublic/v1/pinboarddata?id=f4533461-caa5-4efa-a189-13815ab86770&batchsize=-1&pagenumber=-1&offset=-1&formattype=COMPACT
```

## Response Example

```
{
  "4fdf9d2c-6f34-4e3b-9fa6-bd0ca69676e1": {
    "name": "Sample Name",
    "columnNames": [
      "Opportunity Stage",
      "Opportunity Owner Name",
      "Total Amount"
    ],
    "data": [
      [
        "s3 alignment with eb",
        "jeff cameron",
        1102272
      ],
      [
        "s4 validation",
        "brian mcquillan",
        59150
      ]
    ],
    "samplingRatio": 1,
    "totalRowCount": 14,
    "rowCount": 14,
    "pageSize": 10,
    "offset": 0
  }
}
```

<!--## Error Codes

<table>
   <colgroup>
      <col style="width:20%" />
      <col style="width:60%" />
      <col style="width:20%" />
   </colgroup>
   <thead class="thead" style="text-align:left;">
      <tr>
         <th>Error Code</th>
         <th>Description</th>
         <th>HTTP Code</th>
      </tr>
   </thead>
   <tbody>
    <tr> <td><code>10002</code></td>  <td>Bad request. Invalid parameter values.</td> <td><code>400</code></td></tr>
    <tr> <td><code>10000</code></td>  <td>Internal server error. Malformed JSON Exception.</td><td><code>500</code></td></tr>
  </tbody>
</table>-->
