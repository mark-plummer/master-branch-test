---
title: [How to improve throughput]
last_updated: tbd
summary: "Adjusting the transaction size may correct poor performance and low throughput."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
The transaction/commit size value can improve the throughput of the load when setting up the ODBC Driver.

Adjusting the transaction size may correct poor performance and low throughput
issues. The transaction size should be set to match the total number of rows
that are expected to be loaded in the load cycle. However, increasing this value
even higher should help improve throughput of the load.

{% include warning.html content="A high transaction size may slow down the ThoughtSpot system." %}

![]({{ site.baseurl }}/images/transaction_size_troubleshooting.png "SSIS transaction size field")

This is where the transaction size field exists for SSIS. Clicking on the ODBC
destination reveals the properties on the right hand side, where the
**Transaction Size** can be found.

See [Set up the ODBC Driver for SSIS]({{ site.baseurl
}}/data-integrate/clients/set-up-the-odbc-driver-using-ssis.html#) for more
details on setting the transaction size.
