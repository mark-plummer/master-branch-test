---
title: [Understand embedding]
summary: "This page provides an explanation of what you must
consider when embedding ThoughtSpot."
last_updated: 11/18/2019
toc: true
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Embedding allows you to embed all or part of ThoughtSpot in another client
application.

## Decide what to embed and where

The type of embedding your company requires can help you determine what type of
embedding to use. For example, you may simply need a single chart displayed as a
wallboard or you may want your customers to access reports on their own data.
The first example could require modifying a single HTML page while the later
example may require working with a development team and several different
workflows in a browser application.

Regardless of the simplicity or complexity of your client application, its
infrastructure must allow for loading and calling the ThoughtSpot JS library.
This library allows you to authenticate to ThoughtSpot and load specific
objects.

There are different methods for embedding ThoughtSpot into a client application:

<table>
<colgroup>
   <col style="width:25%">
   <col style="width:75%">
</colgroup>
  <tr>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>Full</td>
    <td>Embeds the entire ThoughtSpot application including menu bars. Full navigation is supported.</td>
  </tr>
  <tr>
    <td>Page-level</td>
    <td>Embeds pages without the menus bars or page-level navigation. This is useful where you want to limit the inclusion to a portion of ThoughtSpot. For example, you may only embed the <strong>Search</strong> or the <strong>Answers</strong> page.</td>
  </tr>
  <tr>
    <td>Object-level</td>
    <td>Embed a single visualization in your application. Content is created in ThoughtSpot and then that content is embedded. The content is rendered within an <code>iframe</code>. This returns a JSON object that includes the underlying data.</td>
  </tr>
</table>

You can also use the ThoughtSpot data APIs to request data from ThoughtSpot.

### Configuration requirements for embedding

Only Extended Enterprise installation can use ThoughtSpot's embed functionality.
ThoughtSpot Enterprise installations must also work with ThoughtSpot Support to
enable embed before using this functionality.

### Optional settings for embedding

There are some settings that apply to embedding which ThoughtSpot Support or your other ThoughtSpot technical contact can make for you.

One of these involves what happens when a user clicks on a link within the data. When your data includes URLs, they display as clickable links in ThoughtSpot tables. By default, clicking on a link opens the URL in a separate tab. But there is a system-wide setting that can be changed to open the links within the context in which they appear.

Changing this setting opens the links:

|Link type|Opens in|
|Link in search result table in ThoughtSpot|Same browser tab as ThoughtSpot application|
|Link in table embedded in an iFrame|Same iFrame that contains the table|
|Link in full ThoughtSpot application embedded in an iFrame|Same iFrame that contains the application|

## Choose an authentication methodology

You can control which type of authentication you use between your client
application and ThoughtSpot.

### No Authentication

You can simply not set up authentication. This would require the user to
_already be logged into ThoughtSpot_ before interacting with your client
application. This is typically only useful when testing your client. You would
not use this in your production environment.

### SAML

Before you can embed all or part of ThoughtSpot, you must authenticate to
ThoughtSpot using SAML with the the public REST API call. After authentication,
a URL is provided to call the desired visualization and populate it into an
`iframe`.

You must [configure SAML]({{
site.baseurl}}/admin/setup/configure-SAML-with-tscli.html) on your ThoughtSpot
instance before using this method.

### Trusted authentication service

A ThoughtSpot installation can enable support for token-based authentication
service. This allows an installation to use a central authentication service
rather than using ThoughtSpot to authenticate. In this architecture, ThoughtSpot
provides the service with a token that allows it to authenticate on behalf of
users.

A trusted authenticator application or service obtains a token from ThoughtSpot.
This token is used to obtain trust from other, third-party client applications
that need access to ThoughtSpot. In the following scenario, the trust authenticator
forwards requests for ThoughtSpot data from client applications to ThoughtSpot.

![]({{ site.baseurl }}/images/authentication.png "Authentication flow")


A user already logged into client-application interacts with a ThoughtSpot embed
point which causes the following processes:

1. The client-side application requests a user token from the trusted authenticator.
2. The trusted authenticator requests user token from ThoughtSpot.
3. ThoughtSpot verifies the authenticator and returns a user token.
4. The authenticator returns the user token to the client.
5. The client forwards the user token to ThoughtSpot.
6. ThoughtSpot validates the token and returns information commensurate with that authenticated user's authorization.


## Plan for Cross-Origin HTTP Requests (CORS)

Collecting user credentials from one application (domain) and sending them to
another (such as ThoughtSpot) can present security vulnerabilities such as a
phishing attack. Cross-origin or cross-domain verification closes this vulnerability.

When embedding, you must enable CORS between your client application domain and
the ThoughtSpot domain. This protects your data, so that another actor cannot
use the same URL to embed the visualization in its own Web pages.

## Decide if you need to change the feedback email

ThoughtSpot has an automated feature that collects feedback from users and sends
it to `support@thoughtspot.com`. Depending on what and how you embed, user
actions with your embedded application can trigger feedback. You can continue to
forward feedback in this manner or direct the feedback to another email. To
learn how to change the feedback email, see [Manage the feedback contact]({{
site.baseurl }}/admin/setup/work-with-ts-support.html#manage-the-feedback-contact).

## Remove the ThoughtSpot branded footer

The ThoughtSpot footer appears by default in the ThoughtSpot application. It
also appears with an embed application that encompasses an individual pinboard
or a full application. In embed applications that are have a single
visualization, you can ask your ThoughtSpot support engineer to disable the
footer.
