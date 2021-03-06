---
title: [Set up ThoughtSpot Data Connect]
summary: "Set up Data Connect with tscli."
last_updated: 11/19/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
The ThoughtSpot team will assist you in the initial setup and configuration of ThoughtSpot Data Connect. You must provide the credentials for logging in to the various data sources you want to connect to.

Your purchase of ThoughtSpot Data Connect includes the necessary credentials for connecting to Informatica. ThoughtSpot Support will supply the Informatica credentials, if you do not already have an account. You can change the Informatica credentials later, if you would like. You need these credentials when issuing the command to enable ThoughtSpot Data Connect.

To set up ThoughtSpot Data Connect. First, check with ThoughtSpot Support to ensure they have provisioned an account for you with the appropriate connectivity licenses. A full list of supported connectivity licenses is available in the [Data Connect connectors reference]({{ site.baseurl }}/data-connect/reference/data-connect-connection-credentials.html#).

Enable ThoughtSpot Data Connect by completing the following steps:

1. Log in to the Linux shell using SSH.
2. Invoke `tscli` to enable ThoughtSpot Data Connect, which will register with Informatica Cloud and start the `infaagent` service.

    The process will take a couple of minutes:

    ```
    tscli etl enable-lw
    --admin_username <admin_user>
    --username <Informatica_user>
    --thoughtspot_url <URL>
    --org_id <informatica_org_id>
    [--pin_to <IP_address>]
    [--proxy_host <proxy_server_hostname>]
    [--proxy_port <proxy_server_port>]
      ```

    If you want to use HTTPS with your URL, you must use a signed certificate.

    The parameter `org_id` specifies the Informatica id of the organization
    (company). `org_id` shouldn't include the prefix `Org`. For example, if on
    Informatica cloud, the `orgid` is `Org003XYZ`, then use only `003XYZ`

    The command `--pin_to` is optional. If you specify an IP to pin to, that node
    becomes sticky to the Informatica agent, and will always be used. This
    defaults to the public IP address of the localhost where this command was run.

    The commands `--proxy_host <proxy_server_hostname>` and `--proxy_port
    <proxy_server_port>` are also optional, and specify the proxy details.

3. You may change your user password using the following `tscli` command:

    ```
    `tscli etl change-password --admin_username <admin_user> --username <Informatica_user>`
    ```

Now, you can log in to ThoughtSpot, and begin using ThoughtSpot Data Connect.
