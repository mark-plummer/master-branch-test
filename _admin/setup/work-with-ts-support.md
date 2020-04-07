---
title: [Configure support services]
last_updated: 3/4/2020
summary: "There are several configurations you can set up in your installation to ensure
your company's support from ThoughtSpot works smoothly."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

{: id="reverse-tunnel"}
## Set up a reverse tunnel for support

You can set up a reverse tunnel to allow ThoughtSpot Support to get access to
your ThoughtSpot instance, to perform support-related activities. This setup is
scalable, more secure, and a much simpler alternative to using a
virtual meeting room.

Granting remote support access can streamline troubleshooting activities, because
it enables your support agent to work directly on your computer form a secure setting. The remote
tunnel enables SSH and HTTP access to your ThoughtSpot instance by ThoughtSpot Support.
This access can be granted and revoked easily, so you can enable it for a troubleshooting
session, and then disable it again. Before doing this procedure, make sure your
company's security policies allow reverse tunneling.

{% include note.html content="Before you set up a reverse tunnel, open port `22`
in your firewall outgoing rules to whitelist `tunnelrelay.thoughtspot.com`." %}

{: id="remote-support-tscli"}
## Using remote support with tscli

To enable remote support, follow these steps:

1. Contact [ThoughtSpot Support]({{ site.baseurl }}/admin/misc/contact.html) and open a support ticket for making the appropriate reverse tunnel settings on our end.
    Provide the cluster name of the cluster for which you want to enable remote support.
2. After the ticket is completed, continue with the remaining steps in this procedure to make the settings on your side.
3. Log in to the Linux shell using SSH.
4. Issue the command to configure the destination for the remote tunnel.

    You only need to do this one time, when you are enabling the tunnel for the very
    first time. After that, this setting persists when you start and stop the
    remote tunnel.

    ```
    $ tscli support set-remote --addr tunnelrelay.thoughtspot.com --user ubuntu
    ```

5. Test that the setting is configured:

    ```
    $ tscli support show-remote
    ```

6. Enable the remote tunnel:

    ```
    $ tscli support start-remote
    ```

7. Contact ThoughtSpot Support (https://docs.thoughtspot.com/latest/admin/misc/contact.html) and test your setup.
8. After your remote session with ThoughtSpot Support is over, turn the remote tunnel off until you need to use it again:

    ```
    $ tscli support stop-remote
    ```

    You can repeat the steps to start and stop the remote tunnel as needed for future support operations.

9. Ensure that the remote tunnel is disabled:

    ```
    $ tscli support show-remote
    ```

{: id="configure-secure-file-server"}
## Configure a secure file server

ThoughtSpot Support uses a secure file server to distribute new releases and to
access your logs and troubleshooting files. You must also use a secure server
connection to enable the optional performance statistics collection.

Before uploading files to the secure file server, obtain your user name
and password for logging into the secure file server. You can get these from
ThoughtSpot Support.

Configuring the connection to the file server is a one-time operation. You do
not have to reconfigure the connection unless your password changes. Note that
you can do a one time override of the user and password you used to configure
the connection. This is done by passing a different user and password on the
command line when uploading or downloading a file.

To configure the connection to the secure file server, follow these steps:

1. Log in to the Linux shell using SSH.
2. Issue the command to configure the file server:

    ```
    $ tscli fileserver configure --user <user_name> [--password <password>]
    ```

    If you do not supply the `--password` parameter, you are prompted to enter it.

{: id="cluster-usage-data"}
## Call home with cluster usage data

"Call home" data is metadata and usage data from your ThoughtSpot cluster. This
data allows ThoughtSpot's Support team to troubleshoot your cluster. They use
the data to see basic usage information over time for your ThoughtSpot instance.
ThoughtSpot's "call home" functionality intermittently sends a call home bundle
of  statistics to a ThoughtSpot S3 server through HTTPS. The data is encrypted at
rest on the server.

By default, call home is enabled on your cluster. You can disable call home in
by doing the following:

1. Log in to the ThoughtSpot server as `admin` user.
2. Use the `tscli` command to disable.

    ```
    $ tscli callhome disable
    ```

{: id="support-contact"}
## Designate a support contact

A support contact person can answer your questions about data and search at
your company. If the person can't answer your system and software-related questions, that person should submit
 the questions to ThoughtSpot Support. The designated support contact should have an available email and phone number.

To designate the custom support contact, follow these steps:

1. Log in to the Linux shell using SSH.
2. Issue the `tscli` command to set the email address:

    ```
    $ tscli support set-admin-email <email_address>
    ```

3. Issue the `tscli` command to set the phone number:

    ```
    $ tscli support set-admin-phone <phone_number>
    ```

4. If you need to reset both of these to the default (ThoughtSpot Support), issue these commands:

    ```
    $ tscli support rm-admin-email
    $ tscli support rm-admin-phone
    ```

{: id="feedback contact"}
## Manage the feedback contact

Users in ThoughtSpot may be asked for feedback for new or BETA features in the
system. By default, feedback goes directly to ThoughtSpot support.

Alternatively, and especially in cases of using ThoughtSpot in embedded mode, you can send feedback to someone in your company.

Your designated feedback contact should have an available email. To designate
the custom feedback contact, follow these steps:

1. Log in to the Linux shell using SSH.

2. To set the feedback email address, issue this command:

    ```
    $ tscli support set-feedback-email <email_address>
    ```
3. Verify the email address is set:

    ```
    $ tscli support show-feedback-email
    ```

To reset the email to the default (ThoughtSpot support), issue this command:

```
$ tscli support rm-feedback-email
```

You can also choose not to send feedback on your system. Issue this command:

```
$ tscli support set-feedback-email ' '
```

{: id="find-support-contact"}
## How users find your company's support contact

After you set the custom support contact information, your users
can see it in the following parts of ThoughtSpot:

-   In the Help Center, when a user selects **Contact Support**.

     ![]({{ site.baseurl }}/images/help_center_support_contact.png "Help Center support contact")

-   In error messages, when a user selects **What Happened?**

    <!-- ![]({{ site.baseurl }}/images/trace_log.png "Error message support contact")-->
