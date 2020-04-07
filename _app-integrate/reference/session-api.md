---
title: [Session API]
summary: "The Session APIs enable you to manage the sessions of existing users."
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

## Managing login
Use this API to authenticate and login a user.

### Resource URL
<code class="api-method-post">post</code> /tspublic/v1/session/login

### Request Parameters

<table>
   <colgroup>
   <col style="width:20%" />
   <col style="width:15%" />
   <col style="width:65%" />
   </colgroup>
   <thead class="thead" style="text-align:left;">
      <tr>
         <th>Form Parameter</th>
         <th>Data Type</th>
         <th>Description</th>
      </tr>
   </thead>
   <tbody>
    <tr> <td><code>username</code></td> <td>string</td> <td>Username of the user.</td> </tr>
    <tr> <td><code>password</code></td> <td>string</td> <td>Password of the user.</td> </tr>
    <tr> <td><code>rememberme</code></td> <td>boolean</td> <td>A flag to remember the user session. The system default is <code>false</code>.</td></tr>
  </tbody>
</table>

### Request Example
##### cURL

```
curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'X-Requested-By: ThoughtSpot' -d 'username=test&password=fhfh2323bbn&rememberme=false' 'https://<instance>/callosum/v1/tspublic/v1/session/login'
```

##### Request URL

```
https://<instance>/callosum/v1/tspublic/v1/session/login
```
### Response Example
```
Not applicable
204 - Successful login
```

## Managing logout

Use this API to log a current user out of an existing session. The user details are captured from the active user session.

### Resource URL
<code class="api-method-post">post</code> /tspublic/v1/session/logout

### Request Example
##### cURL
```
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-Requested-By: ThoughtSpot' 'https://<instance>/callosum/v1/tspublic/v1/session/logout'
```

##### Request URL

```
https://<instance>/callosum/v1/tspublic/v1/session/logout
```

### Response Example
```
Not applicable
204 - Successful logout
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
   <tr> <td><code>10000</code></td>  <td>Internal server error.</td> <td><code>500</code></td></tr>
    <tr> <td><code>10002</code></td>  <td>Bad request. Invalid parameter values.</td> <td><code>400</code></td></tr>
    <tr> <td><code>10003</code></td>  <td>Login or logout failure. Unauthorized.</td><td><code>401</code></td></tr>
  </tbody>
</table>-->
