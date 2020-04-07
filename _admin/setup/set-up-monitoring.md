---
title: [Set up monitoring]


last_updated: tbd
summary: "Setting up monitoring is a one time operation."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
To configure monitoring of your cluster, set up the frequency of heartbeat and monitoring reports and an email address to receive them.

1. Log in to the Linux shell using SSH.
2. Issue the `tscli` command to set up monitoring:

    ```
    tscli monitoring set-config
       --email <email>
       --heartbeat_interval <heartbeat_interval>
       --report_interval <report_interval>
    ```

    The parameters are:

    -   `--email <email>` is a comma separated list (no spaces) of email addresses where the cluster will send monitoring information.

    -   `--heartbeat_interval <heartbeat_interval>` is the heartbeat email generation interval in seconds. Must be greater than 0.

    -   `--report_interval <report_interval>` sets the cluster report email generation interval in seconds. Must be greater than 0.

3. To view your settings and verify that they have been applied, issue:

    ```
    tscli monitoring show-config
    ```

    You should see information like:

    ```
    Monitoring Configuration:

      Alert Email: dev-alerts@thoughtspot.com

      Heartbeat Interval: 900 sec

      Report Interval: 21600 sec
    ```

4. After the heartbeat interval has passed, check your email to verify that emails are being delivered.
5. If you don't receive any emails, [verify that email is working](set-up-relay-host.html#verify-the-relay-with-an-email).
