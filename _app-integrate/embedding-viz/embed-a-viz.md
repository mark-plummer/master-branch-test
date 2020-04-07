---
title: [Embed pinboard or visualization]
summary: Learn how to embed a visualization or pinboard in your own Web page.
last_updated: 11/18/2019
sidebar: mydoc_sidebar
toc: true
permalink: /:collection/:path.html
---
This page explains, through an example, how to embed a visualization (table or
chart) or pinboard from ThoughtSpot in your own static Web page, portal, or
application.

To build this sample, you need to have access to a text editor and
a ThoughtSpot instance with a visualization. You should also have some
experience working with Javascript.

## Get the link for an entire pinboard or single visualization

This procedure assumes the pinboard with the visualization you want to embed
already exists. If the pinboard or visualization doesn't exist, create it now
before continuing.

1. Log in to ThoughtSpot from a browser.

2. Navigate to a visualization on the **Pinboard** tab.

3. Open a pinboard.

3. Copy the URL for the entire pinboard and for a single visualization.

   If the object is a pinboard, click the ellipses icon
   ![more options menu icon]({{ site.baseurl }}/images/icon-ellipses.png){: .inline} >
    **Copy Link**.

   ![]({{ site.baseurl }}/images/embed-link-1.png "Pinboard Link")

   The format for the link is:  `<protocol>:<host>:<port>/#/embed/viz/<pinboardID>`

   For a vizualization in a pinboard, click the ellipses icon
   ![more options menu icon]({{ site.baseurl }}/images/icon-ellipses.png){: .inline} >
    **Copy Link**.

   ![]({{ site.baseurl }}/images/embed-link-2.png "Visualization Link")

   The format for the link is:  `<protocol>:<host>:<port>/#/embed/viz/<pinboardID>/<vizualizationId>`

## Edit the test.html

You must edit the page in your application or web page where you want to
embed a ThoughtSpot pinboard or visualization. For this example, you can get a copy of the
<a href="{{"/downloads/test.html" | prepend: site.baseurl }}" target="_blank"><code>test.html</code></a>  file.

1. Create an empty directory called `test`.
2. Save the `test.html` file to the `test` directory.
3. <a href="{{"/release/downloads.html" | prepend: site.baseurl }}" target="_blank">Download</a> the ThoughtSpot JavaScript library.
4. Place the Javascript library in an `api` directory co-located with the `test.html` file.
5. Edit the `test.html` file in your favorite editor.
6. Scroll down to the `Variables` section (about line 37).

    Here are the fields in the `test.html` file you need to edit.

    ```JavaScript
    var protocol = "THOUGHTSPOT_PROTOCOL";
    var hostPort = "HOST_PORT";   

    var pinboardId = "PINBOARD_ID";
    var vizualizationId = "VIZUALIZATON_ID";
    ```
7. Edit each variable in the section and replace it with the IDs you copied from the pinboard.

   For example, your URL may look similar to the following:

    `http://172.18.202.35:8088/#/embed/viz/061457a2-27bc-43a9-9754-0cd873691bf0/9985fccf-b28d-4262-b54b-29619a38348e`

    This is a link copied from an individual visualization, the result in the file is:

    ```JavaScript
    var protocol = "http";
    var hostPort = "172.18.202.35:8088";   

    var pinboardId = "061457a2-27bc-43a9-9754-0cd873691bf0";
    var vizualizationId = "9985fccf-b28d-4262-b54b-29619a38348e";
    ```

    The protocol (`http` or `https`) of your client and your ThoughtSpot instance
    should match. You can use this identifier in the next part.

7. Save your changes and close the `test.html` file.


## Enable CORS for your client domain

You must work with ThoughtSpot support to enable CORS between your client
application domain and the ThoughtSpot domain. If you don't do this, you will
receive an error message when `test.html` attempts to load the embedded objects.

The test infrastructure uses Python's `simplehttpserver`, which runs by default
as `localhost:8000`. ThoughtSpot support must have this information. You can
also copy the `test` directory to an existing web server. If you do this,
you must DNS for the server when you contact Support.

## Test the example page

You are almost ready to view your embedded pinboard and visualization. The
fastest way to run a webserver and test the code is using Python's
`simplehttpserver`.  If you have Python on your system you already have the
`simplehttpserver`.

1. Log in to ThoughtSpot.

   In production, you would have added authentication code to your client. You
   haven't done that with this system. So, before you test, you must login to the
   ThoughtSpot. Successfully logging in causes the system to create a session
   and an authentication key. Your browser has this information and so when you
   load the `test.html` page in another tab, you won't need to authenticate
   again.

2. Change to your `test` directory.
3. Start the `simplehttpserver` web server.

    ```
     python -m SimpleHTTPServer 8000
    ```

4. Open your browser's **Developer** tools.

5. Navigate to the test page in your browser.

    `http://localhost:8000/test.html`

    You should see something similar to the following:

    ![]({{ site.baseurl }}/images/embed-3.png "Working embedded")

6. Check the browser console.

    Success is appears in the console with a message similar to this:

    ```
    test.html:60 Initialization successful.
    test.html:113 http://172.18.202.35:8088/#/embed/viz/061457a2-27bc-43a9-9754-0cd873691bf0
    test.html:129 http://172.18.202.35:8088/#/embed/viz/061457a2-27bc-43a9-9754-0cd873691bf0/9985fccf-b28d-4262-b54b-29619a38348e
    ```

## Troubleshooting embeds

If your embeds don't load, open the developer tools on your browser.  Look for
errors in the page loading, usually on the **Console** tab. If you see an error
similar to:

```
No 'Access-Control-Allow-Origin' header is present on the requested resource.
```

Typically you see this if the cross domain (CORS) setting was not completed correctly on
your ThoughtSpot cluster. Contact <a
href="mailto:support@thoughtspot.com">support@thoughtspot.com</a> for more help.
