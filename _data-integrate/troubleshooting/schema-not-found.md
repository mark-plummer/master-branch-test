---
title: [Schema not found error with ODBC]

last_updated: tbd
toc: false
summary: "Correct schema not found errors."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
When connecting with ODBC, you need to specify both the `DATABASE` and `SCHEMA`
parameters. This is true even if you do not use schema names in ThoughtSpot. If
you don't supply a `SCHEMA`, you get an error indicating that the schema could
not be found.

The default schema name in ThoughtSpot is `falcon_default_schema`. To set the
`SCHEMA` on Windows, adding a custom
property with the key `SCHEMA` and the value `falcon_default_schema`.

![]({{ site.baseurl }}/images/ODBC_add_schema.png "Edit a custom property on Windows")

On Linux, you can edit the properties in the `odbc.ini` file for the driver you are using:

```
[ThoughtSpot]
Description = ThoughtSpot 64-bit ODBC Driver
Driver = ThoughtSpot
ServerList =  172.18.231.17 12345
Locale = en-US
ErrorMessagesPath = /home/admin/linux/ErrorMessages
UseSsl = 0
#SSLCertFile = # Set the SSL certificate file path. The certificate file can be obtained by extracting the SDK tarball
#LogLevel = 0 # Set log level to enable debug logging
#LogPath = # Set the debug log files path
DATABASE = # Set the default database to connect to
SCHEMA = # Set the default schema to connect to
```

## Related information

* [Configuring ODBC on Windows]({{ site.baseurl}}/data-integrate/clients/install-odbc-windows.html#)
* [Configuring ODBC on LINUX]({{ site.baseurl}}/data-integrate/clients/install-odbc-linux.html#)
* [ODBC and JDBC configuration properties]({{ site.baseurl}}/data-integrate/reference/simba-settings.html#)
