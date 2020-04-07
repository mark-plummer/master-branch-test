---
title: [Browser untrusted connection error]
summary: "If you do not have an SSL certificate, users get an untrusted connection error."
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
If you are not using an SSL certificate for authentication, users will see an untrusted connection error in their browser when accessing ThoughtSpot. The error looks slightly different depending upon the Web browser being used.

ThoughtSpot uses secure HTTP (the HTTPS protocol) for communication between the browser and ThoughtSpot. By default there is no SSL certificate for authentication. This must be added by the site administrator. If the site administrator has not added the certificate, the browser warns the user.

|Browser|Warning|
|-------|-------|
|Google Chrome|The site's security certificate is not trusted!|
|Mozilla Firefox|This Connection is Untrusted|

If you see the warning message, choose one of the following options:

-   Ask the site administrator to install the certificate.
-   Ask the site administrator to turn off SSL using this command in the shell on the ThoughtSpot instance:

    ```
    $ tscli ssl off
    ```

-   You can choose to ignore the message, and access ThoughtSpot without SSL.
