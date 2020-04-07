---
title: [User API]
summary: "The User APIs enable you to manage user- and group-related operations in the ThoughtSpot system."
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

You can use the User APIs to manage your users and groups in ThoughtSpot. For example, you may want to view all users and groups in your ThoughtSpot cluster.

## Transfer ownership
Use this API to transfer ownership of _all_ objects from one user to another.

{% include note.html content="You cannot transfer objects to or from the system user or the administrative user." %}

### Resource URL  
<code class="api-method-post">post</code> /tspublic/v1/user/transfer/ownership

### Request Parameters

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
         <td><code>fromUserName</code></td>
         <td>string</td>
         <td>Username to transfer from.
            </td>
      </tr>
      <tr>
         <td><code>toUserName</code></td>
         <td>string</td>
         <td>Username to transfer to.</td>
      </tr>
</tbody>
</table>

### Request Example

##### cURL
```
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-Requested-By: ThoughtSpot' 'https://<instance>/callosum/v1/tspublic/v1/user/transfer/ownership?fromUserName=guest&toUserName=guest1'
```

##### Request URL

```
https://<instance>/callosum/v1/tspublic/v1/user/transfer/ownership?fromUserName=guest&toUserName=guest1
```

### Response Example

```
Not applicable
204 - Successful login
```

## Synchronize principals
Use this API to synchronize ThoughtSpot users and groups with your external database. The payload takes principals containing all users and groups present in the external database and a successful API call returns the object that represents the changes that were made in ThoughtSpot system. This means the following:
- Objects (users or groups) present in ThoughtSpot, but not present in the external list -  will be deleted in ThoughtSpot.
- Objects present in ThoughtSpot, and present in the external list - will be updated such that the object attributes in ThoughtSpot match those present in the list. This includes group membership.
- Objects not present in ThoughtSpot, and present in the external list - will be created in ThoughtSpot.

### Resource URL
<code class="api-method-post">post</code> /tspublic/v1/user/sync

### Request Parameters

This API uses `multipart/form-data` content type.

<table>
   <colgroup>
   <col style="width:20%" />
   <col style="width:15%" />
   <col style="width:65%" />
   </colgroup>
   <thead>
      <tr>
         <th>Form Parameter</th>
         <th>Data Type</th>
         <th>Description</th>
      </tr>
   </thead>
   <tbody>
   <tr>
      <td><code>principals</code></td><td>string</td>
      <td>Specifies a list of principal objects. This is ideally a JSON file containing containing all users and groups present in the external database.</td>
   </tr>
      <tr>
         <td><code>applyChanges</code></td><td>boolean</td>
         <td>A flag indicating whether to sync the users and groups to the system, and apply the difference evaluated. <p><b>Note</b>: Use this parameter to validate a difference before applying changes.</p>
         </td>
      </tr>

      <tr>
         <td><code>removeDeleted</code></td><td>boolean</td>
         <td>A flag indicating whether to remove deleted users/groups. When true, this flag removes any deleted users or groups.</td>
      </tr>
      <tr>
         <td><code>password</code></td><td>string</td>
         <td>Specifies a password.</td>
      </tr>
   </tbody>
</table>

### Request Example
##### cURL
```
curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' -d 'applyChanges=false' 'https://<instance>/callosum/v1/tspublic/v1/user/sync'
```

##### Request URL

```
https://<instance>/callosum/v1/tspublic/v1/user/sync
```

### Response Example

```
{
  'usersAdded': ['username1','username2'],
  'usersDeleted': ['username3'],
  'usersUpdated': ['username4'],
  'groupsAdded': ['groupname1'],
  'groupsDeleted': ['groupname2','groupname3'],
  'groupsUpdated': ['groupname4']
}
```


## Change password
Use this API to change the password of a user.

### Resource URL
<code class="api-method-post">post</code> /tspublic/v1/user/updatepassword


### Request Parameters
<table>
   <colgroup>
   <col style="width:20%" />
   <col style="width:15%" />
   <col style="width:65%" />
   </colgroup>
   <thead>
      <tr>
         <th>Form Parameter</th>
         <th>Data Type</th>
         <th>Description</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td><code>name</code></td><td>string</td>
         <td>Name of the user.</td>
      </tr>
      <tr>
         <td><code>currentpassword</code></td><td>string</td>
         <td>The current password of the user.</td>
      </tr>
      <tr>
         <td><code>password</code></td><td>string</td>
         <td>A new password of the user.</td>
      </tr>

   </tbody>
</table>

### Request Example
##### cURL
```
curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'X-Requested-By: ThoughtSpot' -d 'name=guest¤tpassword=test&password=foobarfoobar' 'https://<instance>/callosum/v1/tspublic/v1/user/updatepassword'
```
##### Request URL
```
https://<instance>/callosum/v1/tspublic/v1/user/updatepassword
```

### Response Example
```
Not applicable
204 - Successful password update
```

## Fetch users and groups
Use this API to get a list of all users, groups, and their inter-dependencies in the form
of principal objects. A typical principal object contains the following properties:
<table>
<colgroup>
      <col style="width:20%" />
      <col style="width:80%" />
   </colgroup>
   <thead>
      <tr>
         <th>Property</th>
         <th>Description</th>
      </tr>
   </thead>
<tbody>
            <tr>
         <td><code>name</code></td>
         <td>
            <p>Name of the principal.</p>
            <p>This field, in conjunction with whether the object is a user or group, is
               used to identify a user/group. Consequently, this field is required to be
               unique (unique for users and groups separately. i.e., you can have user “x”
               and group “x”).
            </p>
         </td>
      </tr>
 <tr>
         <td><code>displayName</code></td>
         <td>Display name of the principal.</td>
      </tr>
 <tr>
         <td><code>description</code></td>
         <td>Description of the principal.</td>
         </tr>
<tr>
         <td><code>mail</code></td>
         <td>Email address of the user. This field should be populated in case of user only. It is ignored in the case of groups.</td>
      </tr>
      <tr>

         <td><code>principalTypeEnum</code></td>
         <td><p>Type of the user created in the ThoughtSpot system.</p>
            <ul>
            <li><code>LOCAL_USER</code>(a user is validated through password saved in the ThoughtSpot database)</li>
            <li><code>LOCAL_GROUP</code></li></ul>
         </td>
      </tr>
   <tr>
         <td><code>password</code></td>
         <td>Password of the user. This field should be populated in case of user only. It is ignored in the case of groups. Password is only required:
         <ul>
         <li>if the user is of LOCAL_USER type, </li>
         <li>when the user is created for the first time. </li></ul>In subsequent update, the user password is not updated even if it changes in the source system.</td>
      </tr>
      <tr>
         <td><code>groupNames</code></td>
         <td>Group names that a principal belongs to. Groups and users can belong to other groups.</td>
      </tr>  
   </tbody>
</table>

### Resource URL
<code class="api-method-get">get</code> /tspublic/v1/user/list

### Request Example

##### cURL
```
curl -X GET --header 'Accept: application/json' 'https://<instance>/callosum/v1/tspublic/v1/user/list'
```
##### Request URL

```
https://<instance>/callosum/v1/tspublic/v1/user/list
```

### Response Example

```
[
  {
    "name": "Administrator",
    "displayName": "Administration Group",
    "created": 1354006445722,
    "modified": 1354006445987,
    "principalTypeEnum": "LOCAL_GROUP",
    "groupNames": [],
    "visibility": "DEFAULT"
  },
  {
    "name": "Analyst",
    "displayName": "Analyst Group",
    "created": 1354006445722,
    "modified": 1354006445987,
    "principalTypeEnum": "LOCAL_GROUP",
    "groupNames": [],
    "visibility": "DEFAULT"
  },
  {
    "name": "rls-group-3",
    "displayName": "rls-group-3",
    "description": "Contains directly rls-group-1, rls-group-2 and belongs direclty to rls-group-5",
    "created": 1459376495060,
    "modified": 1459376590681,
    "principalTypeEnum": "LOCAL_GROUP",
    "groupNames": ["rls-group-5"],
    "visibility": "DEFAULT"
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
   <tr> <td><code>10000</code></td>  <td>Internal server error.</td> <td><code>500</code></td></tr>
    <tr> <td><code>10002</code></td>  <td>Bad request. No user found with the given username.</td> <td><code>400</code></td></tr>
    <tr> <td><code>10003</code></td>  <td>Unable to authenticate user</td><td><code>403</code></td></tr>
  </tbody>
</table>-->
