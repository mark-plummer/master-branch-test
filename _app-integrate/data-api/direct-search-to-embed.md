---
title: [Use the Embedded Search API to pull data from ThoughtSpot]

last_updated: 11/18/2019
summary: "This procedure shows how to use the Embedded Search API to get data from ThoughtSpot."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
The Embedded Search API enables searching directly from an external application or web page to pull data from ThoughtSpot. This feature was introduced in ThoughtSpot 5.0. When using it, you can access data stored in ThoughtSpot directly. You do not have to save a search result to a pinboard and then reference it using the visualization's URL.

This embedded search is useful when you want to allow an application to pull data directly from ThoughtSpot in an ad hoc fashion.

To have the Embedded Search API functionality turned on, contact ThoughtSpot Support.

Data retrieved using the Embedded Search API is returned as JSON (JavaScript Object Notation). You must parse the JSON to get the data values you need, generally using JavaScript in the receiving application.

Use this procedure to construct the call to the Embedded Search API:

1. [Enable the JavaScript API (JS API)]({{ site.baseurl }}/app-integrate/JSAPI/enable-JS-API.html#) on the receiving page of the target application.

2. [Authenticate to ThoughtSpot]({{ site.baseurl }}/app-integrate/JSAPI/about-JS-API.html#) on the receiving page of the target application.

3. [Embed the ThoughtSpot application]({{ site.baseurl }}/app-integrate/embedding-viz/about-full-embed.html#) in your own web page or application.

4. To subscribe to results for all the searches the user does in the embedded ThoughtSpot application, use the API JavaScript function subscribeToData( ). This will allow your page to listen for data coming from ThoughtSpot.

   Now when a user searches, the iFrame will send data to the subscription. The parent web page or application receives the data as JSON, and can do whatever you want with it.

5. You can set up your web page or application to display or otherwise act on the data it receives from the subscription.

6. To test it out, do a search in the embedded ThoughtSpot application to retrieve the data. Your application should act on the data in the way you set it up to do so.
