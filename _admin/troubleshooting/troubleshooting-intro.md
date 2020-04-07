---
title: [About troubleshooting]
summary: Learn the basics of troubleshooting for ThoughtSpot.
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
The information here provides very basic troubleshooting.

-   **[Get your configuration and logs]({{ site.baseurl }}/admin/troubleshooting/get-logs.html)**  
For troubleshooting on specific incidents or cluster problems, getting a log bundle can help.
-   **[Upload logs to ThoughtSpot Support]({{ site.baseurl }}/admin/troubleshooting/upload-logs-egnyte.html)**
-   **[Network connectivity issues]({{ site.baseurl }}/admin/troubleshooting/check-connectivity.html)**  
If network connectivity to and from ThoughtSpot is not working, try using these steps to find and correct the issue.
-   **[Check the timezone]({{ site.baseurl }}/admin/troubleshooting/set-timezone.html)**  
ThoughtSpot comes configured with the timezone where it is to be installed.
-   **[Browser untrusted connection error]({{ site.baseurl }}/admin/troubleshooting/certificate-warning.html)**  
If you are not using a SSL certificate for authentication, users will see an untrusted connection error in their browser when accessing ThoughtSpot. The error looks slightly different depending upon the Web browser being used.
-   **[Characters not displaying correctly]({{ site.baseurl }}/admin/loading/char-encoding.html)**  
Your CSV files are more likely to load smoothly if they are encoded with UTF-8. If you're having problems with some characters rendering incorrectly, you can convert the files to UTF-8 encoding before loading the data.
-   **[Clear the browser cache]({{ site.baseurl }}/admin/troubleshooting/clear-browser-cache.html)**  
You might occasionally see unexpected behavior that is due to the Web browser caching information from ThoughtSpot. In this case, clearing the browser cache and reloading the page should resolve the problem.
-   **[Cannot open a saved answer that contains a formula]({{ site.baseurl }}/admin/troubleshooting/formula-date-problem.html)**  

-   **[Data loading too slowly]({{ site.baseurl }}/admin/troubleshooting/data-loading-too-slowly.html)**  
Some tables may take an unusually long time to load due to a high data version issue. This issue normally arises when ThoughtSpot completes an upgrade or the system is recovering after a crash.
-   **[Search results contain too many blanks]({{ site.baseurl }}/admin/troubleshooting/search-too-many-blanks.html)**  
If you find that your search results contain too many blanks when your data source is a worksheet, there is a simple adjustment you can make to fix this.

 For more detailed troubleshooting, [Contact ThoughtSpot]({{ site.baseurl }}/admin/misc/contact.html#).
