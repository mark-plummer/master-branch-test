---
title: [Materialization API]
summary: "The materialization API allows you to synchronize a view's data with the latest data."
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

This API enables you to refresh a materialized view to synchronize its data with the latest data load to the underlying tables. You may want to invoke this API in the following scenarios:
- When the status of a materialized view is `Stale` (out of sync) due to an incremental data load,
- When the status of a materialized view is `Error` due to an error that occurred.

{% capture download_note %}
To refresh a materialized view, you must have the [**Can administer ThoughtSpot** privilege]({{ site.baseurl }}/admin/users-groups/about-users-groups.html#list-of-privileges).
{% endcapture %}

{% include note.html content=download_note %}


## Resource URL

<code class="api-method-post">post</code> /tspublic/v1/materialization/refreshview/{id}

## Request Parameters

<table>
   <colgroup>
      <col style="width:20%" />
      <col style="width:15%" />
      <col style="width:65%" />
   </colgroup>
   <thead>
      <tr>
         <th>Path Parameter</th>
         <th>Data Type</th>
         <th>Description</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td><code>id</code></td>
         <td>string</td>
         <td>ID of the metadata object</td>

      </tr>

   </tbody>
</table>

## Request Example

##### cURL

```
curl -X POST --header 'Content-Type: */*' --header 'Accept: application/json' --header 'X-Requested-By: ThoughtSpot' 'https://<instance>/callosum/v1/tspublic/v1/materialization/refreshview/e27f3c1c-a9cd-4996-9029-097449cd6f60'
```

##### Request URL

```
https://<instance>/callosum/v1/tspublic/v1/materialization/refreshview/e27f3c1c-a9cd-4996-9029-097449cd6f60
```

## Response Example

```
Not applicable
204 - Refresh submitted
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
    <tr> <td><code>10000</code></td>  <td>Internal server error.</td><td><code>500</code></td></tr>
  </tbody>
</table>-->
