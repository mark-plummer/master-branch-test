---
title: [Public API reference]
summary: "ThoughtSpot has several public APIs."
last_updated: 1/9/2020
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
This reference details all the public ThoughtSpot APIs. The descriptions are
aimed to help you solve specific use cases, such as syncing users and groups, or
fetching visualization headers. The following public APIs are available:
<table>
   <colgroup>
      <col style="width:15%" />
      <col style="width:45%" />
      <col style="width:40%" />
   </colgroup>
   <thead>
      <tr>
         <th>Public APIs</th>
         <th>Functional Behaviour</th>
         <th>Despcription</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td><a href="{{ site.baseurl }}/app-integrate/reference/pinboarddata.html">Pinboard Data</a></td>
         <td><code class="api-method-post">POST</code> /tspublic/v1/pinboarddata</td>
         <td>Get the pinboard data from the ThoughtSpot system</td>
      </tr>
     <tr>
         <td rowspan="2"><a href="{{ site.baseurl }}/app-integrate/reference/metadata-api.html">Metadata</a></td>
         <td><code class="api-method-get">GET</code> /tspublic/v1/metadata/listobjectheaders</td>
         <td>List the metadata object headers in the repository</td>
      </tr>
      <tr>
         <td><code class="api-method-get">GET</code> /tspublic/v1/metadata/listvizheaders</td>
         <td>Get the visualization headers from the ThoughtSpot system</td>
      </tr>
      <tr>
         <td rowspan="2"><a href="{{ site.baseurl }}/app-integrate/reference/session-api.html">Session</a></td>
         <td><code class="api-method-post">POST</code> /tspublic/v1/session/login</td>
         <td>Authenticate and login a user</td>
         </tr>
     <tr>
         <td><code class="api-method-post">POST</code> /tspublic/v1/session/logout</td>
         <td>Logout a user out of an existing session</td>
      </tr>
      <tr>
         <td rowspan="4"><a href="{{ site.baseurl }}/app-integrate/reference/user-api.html">User</a></td>
         <td><code class="api-method-post">POST</code> /tspublic/v1/user/transfer/ownership</td>
         <td>Transfer ownership of all objects from one user to another</td>
         </tr>
     <tr>
         <td><code class="api-method-post">POST</code> /tspublic/v1/user/sync</td>
         <td>Synchronize principal from your external system with ThoughtSpot system</td>
      </tr>
      <tr>
         <td><code class="api-method-post">POST</code> /tspublic/v1/user/updatepassword</td>
         <td>Change the password of a user</td>
      </tr>
      <tr>
         <td><code class="api-method-get">GET</code> /tspublic/v1/user/list</td>
         <td>Get all users, groups and their inter-dependencies</td>
      </tr>
      <tr>
         <td rowspan="2"><a href="{{ site.baseurl }}/app-integrate/reference/group-api.html">Group</a></td>
         <td><code class="api-method-post">POST</code> /tspublic/v1/group/addprivilege</td>
         <td>Add a privilege to a group</td>
      </tr>
      <tr>
         <td><code class="api-method-post">POST</code> /tspublic/v1/group/removeprivilege</td>
         <td>Remove a privilege from a group</td>
      </tr>
      <tr>
         <td><a href="{{ site.baseurl }}/app-integrate/reference/materialization-api.html">Materialization</a></td>
         <td><code class="api-method-post">POST</code> /tspublic/v1/materialization/refreshview/{id}</td>
         <td>Re-execute the query and load data into the materialized view</td>
      </tr>
      <tr>
         <td><a href="{{ site.baseurl }}/app-integrate/reference/search-data-api.html">Search Data</a></td>
         <td><code class="api-method-post">POST</code> /tspublic/v1/searchdata</td>
         <td>Search data from a specific data source in the ThoughtSpot system.</td>
      </tr>
   </tbody>
</table>

See [About the REST API]({{ site.baseurl
}}/app-integrate/data-api/about-data-api.html#) for information on how to call
and use the REST APIs.

<!-- HIDE THIS UNTIL PUBLIC AND PRIVATE APIs are separated
## Interactive Swagger rest browser

Your ThoughtSpot installation has an interactive REST browser application built
in.  You can view the Swagger content at:

`https://<instance_name>/external/swagger/#/`

You can use the instance to review API documentation and test the APIs before
using them in an application.

{% include warning.html content="The Swagger browser application reveals both
private and public APIs. You should not use the private APIs, their signature
can change without warning breaking your application." %}
-->
