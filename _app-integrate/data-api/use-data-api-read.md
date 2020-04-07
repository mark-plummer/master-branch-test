---
title: [Use the Data REST API to get data]

last_updated: tbd
summary: "This procedure shows how to use the REST API to get data out of ThoughtSpot, so you can use it in a Web page, portal, or application. "
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Data retrieved using the Data REST API is returned as JSON (JavaScript Object Notation).

Before you can use the Data REST API, you need to enable the [JavaScript API (JS API)]({{ site.baseurl }}/app-integrate/JSAPI/enable-JS-API.html#) and authenticate to ThoughtSpot.

Use this procedure to construct the URL you will use to call the Data REST API:

1. Log in to ThoughtSpot from a browser.

2. Navigate to the pinboard from which you want to get data. If it doesn't exist yet, create it now.

3. Find the ID number of the object you want to get the data from. If the object is:
    -   A pinboard, click ellipses icon ![more options menu icon]({{ site.baseurl }}/images/icon-ellipses.png){: .inline} the and select **Copy Link**.

        ![]({{ site.baseurl }}/images/copy_pinboard_link.png "The Actions menu")

    -   A visualization, click the **Copy Link** icon in the upper right corner of the table or chart.

         ![]({{ site.baseurl }}/images/copy_link.png "Copy link")

4. Copy the ID number from the link shown. Paste it somewhere so that you can use it later to construct the URL to use when calling the REST API.

    If the object is:
    -   A pinboard, copy the identifier that appears after "viz/". Omit the trailing "/".

        ![]({{ site.baseurl }}/images/copy_link_pinboard.png "The pinboard ID")

    -   A visualization (table or chart), copy the identifier that appears after "viz/". This is the visualization ID.

        ![]({{ site.baseurl }}/images/copy_link_viz_pinboard_part.png "The pinboard ID")

5. Construct the URL as follows: For a pinboard, the URL takes the form:

    ```
    https://<thoughtspot_server>/callosum/v1/tspublic/v1/pinboarddata?id=<pinboard_id>
    ```

    For a visualization, the URL takes the form:

    ```
    https://<thoughtspot_server>/callosum/v1/tspublic/v1/pinboarddata?id=<pinboard_id>&vizid=%5B<visualization_id>%5D
    ```

6. If you want to apply any filters to the data that will be returned, apply [Runtime Filters]({{ site.baseurl }}/app-integrate/runtime-filters/about-runtime-filters.html#).

7. Now your URL is complete, and you can use it to access the data directly through the HTTP POST method.
  The Data REST API returns the data formatted as JSON.

8. Retrieve the data from the JSON and display it in your Web page, Web portal, or application.
