---
title: [Metadata API]
summary: "The Metadata APIs allow you to fetch metadata for ThoughtSpot objects."
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

The Metadata APIs enable you to fetch metadata details for various objects in the ThoughtSpot system. For example, you may want to see the visualization headers of a particular answer or a pinboard.

## Get visualization headers

Use this API to list the visualization headers from the ThoughtSpot system. The expected output includes a list of objects, each with information about the visualizations of
the given pinboard or an answer.

### Resource URL
<code class="api-method-get">get</code> /tspublic/v1/metadata/listvizheaders


### Request Parameters

<table>
   <colgroup>
   <col style="width:20%" />
   <col style="width:15%" />
   <col style="width:65%" />
   </colgroup>
   <thead class="thead" style="text-align:left;">
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
      <td>ID of a particular answer or a pinboard.</td>
    </tr>
</tbody>
</table>

### Request Example
##### cURL
```
curl -X GET --header 'Accept: application/json' --header 'X-Requested-By: ThoughtSpot' 'https://<instance>/callosum/v1/tspublic/v1/metadata/listvizheaders?id=97begg839e-71b6-42ad-a980-20c38b4d6db5'
```
##### Request URL

```
https://<instance>/callosum/v1/tspublic/v1/metadata/listvizheaders?id=97be839e-71b6-42ggad-a980-20c38b4d6db5
```

### Response Example
```
[
  {
    "id": "dd7f5467-99c3-4278-998b-6dd0c4346cd4",
    "name": "Headline Viz answer book guid max timestamp answer book guid != {null} sort by max timestamp descending today last 180 days",
    "author": "67e15c06-d153-4924-a4cd-ff615393b60f",
    "created": 1536179170172,
    "modified": 1536179170172,
    "modifiedBy": "67e15c06-d153-4924-a4cd-ff615393b60f",
    "owner": "ec718bc5-4608-4ea9-93e2-c1f82e9f2b31"
  },
  {
    "id": "fcb65fdb-3965-4f56-8bda-e5e3c2a127a7",
    "name": "Filter Viz answer book guid max timestamp answer book guid != {null} sort by max timestamp descending today last 180 days Row: 1",
    "author": "67e15c06-d153-4924-a4cd-ff615393b60f",
    "created": 1536179170172,
    "modified": 1536179170172,
    "modifiedBy": "67e15c06-d153-4924-a4cd-ff615393b60f",
    "owner": "ec718bc5-4608-4ea9-93e2-c1f82e9f2b31"
  },
  {
    "id": "0f6e7220-5088-4a0e-8122-50b637c356fc",
    "name": "Table Viz answer book guid max timestamp answer book guid != {null} sort by max timestamp descending today last 180 days",
    "author": "67e15c06-d153-4924-a4cd-ff615393b60f",
    "created": 1536179170172,
    "modified": 1536179170172,
    "modifiedBy": "67e15c06-d153-4924-a4cd-ff615393b60f",
    "owner": "ec718bc5-4608-4ea9-93e2-c1f82e9f2b31"
  }
]
```

## Get object headers
Use this API to fetch a comprehensive list of metadata headers of a specific object type in the Thoughtspot system.

### Resource URL
<code class="api-method-get">get</code> /tspublic/v1/metadata/listobjectheaders

### Request Parameters

<table>
   <colgroup>
   <col style="width:20%" />
   <col style="width:15%" />
   <col style="width:65%" />
   </colgroup>
   <thead class="thead" style="text-align:left;">
      <tr>
         <th>Query Parameter</th>
         <th>Data Type</th>
         <th>Description</th>
      </tr>
   </thead>
   <tbody>
    <tr>
      <td><code>type</code></td>
      <td>string</td>
      <td>Specifies the metadata object type. Valid values are:
         <ul>
         <li><code>QUESTION_ANSWER_BOOK</code></li>
         <li><code>PINBOARD_ANSWER_BOOK</code></li>
         <li><code>QUESTION_ANSWER_SHEET</code></li>
         <li><code>PINBOARD_ANSWER_SHEET</code></li>
         <li><code>LOGICAL_COLUMN</code></li>
         <li><code>LOGICAL_TABLE</code></li>
         <li><code>LOGICAL_RELATIONSHIP</code></li>
         <li><code>TAG</code></li>
         <li><code>DATA_SOURCE</code></li>
         </ul>
         </td>
    </tr>
    <tr>
      <td><code>subtypes</code></td>
      <td>string</td>
      <td>Specifies the sub-types of metadata object. Valid values are:
      <ul>
      <li><code>ONE_TO_ONE_LOGICAL</code></li>
      <li><code>WORKSHEET</code></li>
      <li><code>PRIVATE_WORKSHEET</code></li>
      <li><code>USER_DEFINED</code></li>
      <li><code>AGGR_WORKSHEET</code></li>
      </ul>
      <b>Note:</b> This parameter only applies to the <code>LOGICAL_TABLE</code> type.
      </td>
    </tr>
    <tr>
      <td><code>category</code></td>
      <td>string</td>
      <td>Specifies the metadata object category. Valid values are:
      <ul>
      <li><code>ALL</code></li>
      <li><code>MY</code></li>
      <li><code>FAVORITE</code></li>
      <li><code>REQUESTED</code></li>
      </ul> </td>
    </tr>
    <tr>
      <td><code>sort</code></td>
      <td>string</td>
      <td>Sort order of returned headers. Valid values are:
          <ul>
          <li><code>DEFAULT</code></li>
          <li><code>NAME</code></li>
          <li><code>DISPLAY_NAME</code></li>
          <li><code>AUTHOR</code></li>
          <li><code>CREATED</code></li>
          <li><code>MODIFIED</code></li>
          </ul>
    </td>
    </tr>
    <tr>
      <td><code>sortascending</code></td>
      <td>boolean</td>
      <td>A flag to specify the sort order. A null value defines the default order.
      <ul>
      <li>Choose <code>true</code> to set ascending order</li>
      <li>Choose <code>false</code> to set descending order</li>
      </ul>
      </td>
    </tr>
    <tr>
      <td><code>offset</code></td>
      <td>integer</td>
      <td>The batch offset to fetch the page headers. The system default is <code>-1</code> that implies first page.</td>
    </tr>
    <tr>
      <td><code>batchsize</code></td>
      <td>integer</td>
      <td>The batch size of the object. A value of <code>-1</code> implies no pagination.</td>
    </tr>
    <tr>
      <td><code>tagname</code></td>
      <td>string</td>
      <td>A JSON array containing a set of tag names to filter headers by.</td>
    </tr>
    <tr>
      <td><code>pattern</code></td>
      <td>string</td>
      <td>A pattern to match for object name. Use <code>%</code> for wildcard match.</td>
    </tr>
    <tr>
      <td><code>skipids</code></td>
      <td>string</td>
      <td>IDs of metadata objects to exclude.</td>
    </tr>
    <tr>
      <td><code>fetchids</code></td>
      <td>string</td>
      <td>IDs of metadata objects to fetch.</td>
    </tr>
    <tr>
      <td><code>auto_created</code></td>
      <td>boolean</td>
      <td>A flag that indicates whether to list auto-created objects only. A value of null signifies return all.</td>
    </tr>
   </tbody>
  </table>


### Request Example
##### cURL
```
curl -X GET --header 'Accept: application/json' --header 'X-Requested-By: ThoughtSpot' 'https://<instance>/callosum/v1/tspublic/v1/metadata/listobjectheaders?type=PINBOARD_ANSWER_BOOK&subtypes=WORKSHEET&category=ALL&sort=CREATED&offset=-1'
```
##### Request URL

```
https://<instance>/callosum/v1/tspublic/v1/metadata/listobjectheaders?type=PINBOARD_ANSWER_BOOK&subtypes=WORKSHEET&category=ALL&sort=CREATED&offset=-1

```
### Response Example

```
[
  {
    "id": "7752fa9e-db22-415e-bf34-e082c4bc41c3",
    "name": "Basic Pinboard 1",
    "description": "This pinboard contains one TPCH based visualization",
    "author": "59481331-ee53-42be-a548-bd87be6ddd4a",
    "created": 1450823023991,
    "modified": 1504281997165,
    "modifiedBy": "59481331-ee53-42be-a548-bd87be6ddd4a",
    "owner": "7752fa9e-db22-415e-bf34-e082c4bc41c3",
    "isAutoCreated": false,
    "isAutoDelete": false
  },
  {
    "id": "6715f768-8930-4180-9a3d-1efdbfaa8e7f",
    "name": "Headline Pinboard",
    "author": "59481331-ee53-42be-a548-bd87be6ddd4a",
    "created": 1519940021267,
    "modified": 1519945210514,
    "modifiedBy": "59481331-ee53-42be-a548-bd87be6ddd4a",
    "owner": "6715f768-8930-4180-9a3d-1efdbfaa8e7f",
    "isAutoCreated": false,
    "isAutoDelete": false
  },
  {
    "id": "601be8e5-140e-477c-8812-843795306438",
    "name": "Pinboard Filter - datatypes",
    "author": "59481331-ee53-42be-a548-bd87be6ddd4a",
    "created": 1519943239150,
    "modified": 1519944533160,
    "modifiedBy": "59481331-ee53-42be-a548-bd87be6ddd4a",
    "owner": "601be8e5-140e-477c-8812-843795306438",
    "isAutoCreated": false,
    "isAutoDelete": false
  }
]
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
    <tr> <td><code>10002</code></td>  <td>Bad request. Invalid parameter values i.e., wrong pinboard ID.</td> <td><code>400</code></td></tr>
  </tbody>
</table>-->
