---
title: [Upload logs to ThoughtSpot Support]
summary: You can send logs to ThoughtSpot Support to get troubleshooting help.
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
ThoughtSpot Support uses a secure file sever to collect log files or other files
needed for troubleshooting. You can easily send log files to this file server
directly from the ThoughtSpot instance.

## Metrics collection

ThoughtSpot collects the diagnostic information from your system on an ongoing basis: there is no time needed to collect diagnostic information after a problem is reported. These metrics allow for:

* Our support team can begin working to remediate any issue with you immediately.
* Metrics provides direct visibility to the ThoughtSpot team on your system's limits. Therefore, our Support team can proactively identify critical threshold issues and work to prevent failures. Metrics also help reduce SLA times as the team can debug much faster.
* ThoughtSpot can tune search algorithms by studying search history and schema.
* ThoughtSpot analyzes expensive and complex query patterns to look for performance optimizations.

Finally, the metrics pipeline allows ThoughtSpot to identify application-use
patterns that contribute to performance bottlenecks with specific browsers and
help your team prevent or alleviate them.

## Other log uploads

Before you can upload a file to the secure file server:

1.  [Configure the connection to the file server]({{ site.baseurl }}/admin/setup/work-with-ts-support.html#).
2.  Obtain the directory path on the file server.

The server directory path for uploading a file is formatted like this example:
`/Shared/support/<customer_name>`. If you do not know the customer name,
[contact ThoughtSpot Support]({{ site.baseurl }}/admin/misc/contact.html#).

You can upload files directly to the file server using this procedure:

1. Log in to the Linux shell using SSH.
2. Navigate to the directory where the file to be uploaded is located.
3. Issue the command to upload the file, specifying the file name and directory path:

    ```
    $ tscli fileserver upload --file_name <file> --server_dir_path <path>
    ```

    When your upload succeeds, you will see a confirmation message.
