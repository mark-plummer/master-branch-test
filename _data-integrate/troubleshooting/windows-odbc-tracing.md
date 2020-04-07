---
title: [ODBC tracing on Windows]
summary: "Using logs to aid in troubleshooting."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Windows shows ODBC specific tracing in the ODBC Data Source Administrator
Tracing tab. You can start tracing there by clicking **Start Tracing Now**. This
logs every ODBC call from this system, and prints the input and output for the
call.

![]({{ site.baseurl }}/images/ssis_tracing.png "Tracing tab")

Although this is lower level information, it can still be helpful in
troubleshooting. When you are not sure if it is our driver or the tool causing
an issue, doing this trace will help narrow the inquiry.

![]({{ site.baseurl }}/images/ssis_trace_log.png "Simbaclient Connection Trace Log")

If you start or stop tracing, make sure you do not have the SSIS client open.
Close it, change the trace, and reopen.
