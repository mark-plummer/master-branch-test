---
title: [Configure trusted authentication]
summary: "Learn how to configure trusted authentication."
last_updated: 11/18/2019
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
If your organization has a trusted authentication server, you can use this
server to authenticate users of the embedded ThoughtSpot application. After
authenticating a user, the trusted authenticator server or service obtains an
authentication token from ThoughtSpot on the user's behalf. In this way, the
user need only authenticate one time, with the trusted authentication server.


## How users are authenticated

In the following scenario, the trust authenticator forwards requests for ThoughtSpot
data from client applications to ThoughtSpot.

![]({{ site.baseurl }}/images/authentication.png "Authentication flow")


A user already logged into the client application interacts with a ThoughtSpot embed
point which launches the following sequence:

1. The client-side application requests a user token from the trusted authenticator.

   This trusted authenticator server was previously configured as an
   authenticated server.

2. The trusted server authenticates the user and requests a token from ThoughtSpot on the user's behalf.
3. ThoughtSpot verifies the authenticator server's request and returns a user token.
4. The authenticator returns the user token to the client, which it uses to complete the user request.
5. The client forwards the request and the user token to ThoughtSpot.
6. ThoughtSpot validates the token and returns information commensurate with that authenticated user's authorization.

## Enable trusted authentication and get a token

  1. Log in to the ThoughtSpot server.
  2. Enable trusted authentication and generate an authenticate token.  (service secret)  -- used to identify the server to ThoughtSpot.

      ```
      [admin@ourthoughtspot ~]$ tscli tokenauthentication enable

      Token generated. Copy the GUID in the box.

      ########################################
      # b0cb26a0-351e-40b4-9e42-00fa2265d50c #
      ########################################

      Override added successfully
      ```

Tokens are like any other password. You should store them securely and protect
knowledge of them.  At any point in time, your installation can have a single
authentication token. Repeated calls to enable overwrite the existing token and
return a new one. To disable a token and not overwrite it:

```
tscli tokenauthentication disable
```

Generated tokens do not expire.

## Trusted authentication call     

1. A user in another application or web page requests access to embedded ThoughtSpot.

   This is a REST request for an embedded ThoughtSpot object, page, or the entire application. Your trusted authenticator server intercepts the request. Your server application must determine at minimum:

     - if the requestor is itself authenticated with your server
     - which user (`username`) is making the request
     - what is being requested, an object, page, or the entire ThoughtSpot application

    It is also important the the `username` is a match for a `username` on the ThoughtSpot application.

2. The trusted web server requests an authentication token on the user's behalf from ThoughtSpot.

    `POST https://<instance>/callosum/v1/tspublic/v1/session/auth/token`

    This post takes the following parameters:

      <table>
      <tr>
        <th>Parameter</th>
        <th>Description</th>
      </tr>
      <tr>
        <td><code>secret_key</code></td>
        <td>A required <code>formData</code> parameter containing a string which is the authentication token provide by the ThoughtSpot server.</td>
      </tr>
      <tr>
        <td><code>username</code></td>
        <td>A required <code>formData</code> parameter containing a string which is the user's <code>username</code> on ThoughtSpot.</td>
      </tr>
      <tr>
        <td><code>access_level</code></td>
        <td>A required <code>formData</code> parameter containing one of <code>FULL</code> or <code>REPORT_BOOK_VIEW</code>. </td>
      </tr>
      <tr>
        <td><code>id</code></td>
        <td>An optional <code>formData</code> parameter containing a ThoughtSpot object identifier. This is only required if you specified <code>REPORT_BOOK_VIEW</code> for the <code>access_level</code> parameter.</td>
      </tr>
      </table>

4. The trusted authenticator server is responsible for managing this token.  

    The token can be managed in any way you see fit. Tokens expire in XXX minutes/hours/day.

5. The trusted authenticator server returns a token to the original requestor.
6. Client completes the user's request providing the token along with the request.  

    For example, if the customer was requesting a specific object:

    `GET https://<instance>/callosum/v1/session/login/token?username=<user>&auth_token=<token>&redirect_url=<full-encoded-url-with-auth-token>`

    If you are using ThoughtSpot embed with objects or pages, you must request
    reauthenticate requests for each new object.
