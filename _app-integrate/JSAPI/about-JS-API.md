---
title: [Using the JavaScript API]
summary: You can use ThoughtSpot within your own Web application with the ThoughtSpot JavaScript API.
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
The ThoughtSpot JavaScript API (JS API) enables you to use ThoughtSpot
within your own Web application and to perform the following tasks:

-   Authenticate users to ThoughtSpot
-   Embed ThoughtSpot visualizations in your Web page using the `<iframe>` HTML tag
-   Supply ThoughtSpot data to your Web page through ThoughtSpot's REST APIs

You can download the <a href="{{"/release/downloads.html" | prepend: site.baseurl }}" target="_blank">ThoughtSpot JavaScript library</a> from our secure storage server.

{% include note.html content="To use the JS API in your Web page, you must have the access and permissions to
update the code of your Web page or application." %}

## Browser Support {#browser-support}

The JS API works in the following browsers:

{% include content/browser-support.md %}

### Internet Explorer 10 ### {#ie-10}

Microsoft introduced a compatibility mode in Internet Explorer 10, which
displays the page using the version of Internet Explorer that is most
compatible with that page. Because we do not support any version earlier than 11,
this feature may break the code.

There are two approaches for forcing the Internet Explorer to emulate the most recent version:

- **Add a Custom Response Header**
    We recommend this approach because it is more robust, offers more
    control, and has a lower risk of introducing a bug to your code. in general,
    you must set the response header to match the server and the technology.
    * set the header name to "X-UA-Compatible"
    * set the value to "IE=Edge"

- **Add a Meta Tag**
    Add this meta tag as the _first_ tag in the header section of the page:

    ```<meta http-equiv="X-UA-Compatible" content="IE=Edge" \>```

## Cross-Origin HTTP Requests (CORS) ## {#cross-origin-http-requests}

Collecting user credentials from one application (domain) and sending them to
another (such as ThoughtSpot) can present security vulnerabilities such as a
phishing attack. Cross-origin or cross-domain verification closes this vulnerability.

When you use the JavaScript API, your client calls ThoughtSpot from your Web
page, portal, or application. Because your client and ThoughtSpot are on different
domains, you must enable cross-origin HTTP requests from your client application
to the ThoughtSpot application. This protects your data by preventing another actor
from using the same URL to embed the visualization in its own Web pages.

Your cluster's CORS configuration controls which domains can use your
client code to authorize users. It also prevents code copying and deployment on
unauthorized sites.  For example, if your Web site is hosted on
the domain `example.com`, you must enable CORS for that domain. Similarly, to
test your code locally, you must also add the domain for your
local server, such as `http://localhost:8080`. We recommend that you disable the
`localhost` access after you finish testing.

To enable CORS between your client applications and your ThoughtSpot instance,
you must work with <a href="mailto:support@thoughtspot.com">ThoughtSpot
Support</a>.
