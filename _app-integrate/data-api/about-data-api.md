---
title: [About the Data REST API]

last_updated: 11/18/2019
summary: "The REST API allows you to get data out of ThoughtSpot so you can use it in a Web page, portal, or application."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
When using the Data REST API, authentication is achieved through SAML. After authentication, use the POST method to call a URL for the desired visualization or pinboard. A JSON (JavaScript Object Notation) representation of the data will be returned.

## Authentication

Before you can use the Data REST API, you must authenticate to ThoughtSpot using SAML with the [JavaScript API]({{ site.baseurl }}/app-integrate/JSAPI/about-JS-API.html#).

## Cross Domain Verification

You can enable cross-domain verification when using the Data REST API. This protects your data, so that another website cannot use a URL to get data from ThoughtSpot. The procedure for [enabling the JavaScript API]({{ site.baseurl }}/app-integrate/JSAPI/enable-JS-API.html#) includes information on how to enable this.

## Data REST API capabilities

Use a POST method to access the URL, which calls the REST API. The data is returned as a JSON string. When using this method, you must extract the data from the JSON file and render it on your Web page, portal, or application.

You can use the REST API to do things like:

-   Generate dynamic picklists on your Web page.
-   Display a single value.
-   Retrieve the data to populate a visualization drawn by your own renderer.
-   Pull data directly from ThoughtSpot

Remember that the data you retrieve from ThoughtSpot is live data, so whenever the Web page is rendered, the current value(s) will be shown.

## Direct Search-to-Embed API

The [Direct Search-to-Embed API]({{ site.baseurl }}/app-integrate/data-api/direct-search-to-embed.html#) enables searching directly from an external application or web page to pull data from ThoughtSpot. This feature was introduced in ThoughtSpot 5.0. When using it, you can access data stored in ThoughtSpot directly. You do not have to save a search result to a pinboard and then reference it using the visualization's URL.

## Public API reference

You can find more information on our public APIs in the [Reference guide]({{ site.baseurl }}/app-integrate/reference/public-api-reference.html#).

# Related information

- [API Reference guide]({{ site.baseurl }}/app-integrate/reference/public-api-reference.html#).
- [Direct Search-to-Embed API]({{ site.baseurl }}/app-integrate/data-api/direct-search-to-embed.html#).
