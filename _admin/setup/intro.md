---
title: [About installation and upgrades]
last_updated: 3/4/2020
summary: "As administrator, you are responsible for setting up and configuring ThoughtSpot. This guide explains how. It will also assist you in troubleshooting some common problems, finding additional resources, and contacting ThoughtSpot."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Your ThoughtSpot application software is already installed for you in a
ThoughtSpot appliance. This is true for both physical and virtual appliances.

The ThoughtSpot software is updated by ThoughtSpot Support. ThoughtSpot Support
will contact you to schedule an update when one becomes available.

As administrator, you are responsible for setting up and configuring
ThoughtSpot. This guide explains how. It will also assist you in troubleshooting
some common problems, finding additional resources, and contacting ThoughtSpot.

{: id="display-current-config"}
## Display your current configuration

To perform the setup and configuration, you must first learn how to [gain
administrative access]({{ site.baseurl }}/admin/setup/logins.html).

1. Log in to the ThoughtSpot cluster as the `admin` user.
2. Use the `tscli feature` subcommand to display your current configuration.

    ```
    $ tscli feature get-all-config
    +---------------------------------+----------+---------------+
    |              NAME               |  STATUS  | CONFIGURATION |
    +---------------------------------+----------+---------------+
    | Firewall                        | Disabled |               |
    | Saml                            | Disabled |               |
    | Ldap                            | Disabled |               |
    | CustomBranding                  | Disabled |               |
    | CustomBrandingFontCustomization | Disabled |               |
    | DataConnect                     | Disabled |               |
    | RLS                             | Enabled  |               |
    | Callhome                        | Enabled  |               |
    | SSHTunnel                       | Enabled  |               |
    | Fileserver                      | Disabled |               |
    +---------------------------------+----------+---------------+
    ```

{: id="related" }
## Related information

The following tasks are also available:

* [Set your locale]({{ site.baseurl }}/admin/setup/set-your-thoughtspot-locale.html)
* [Test connectivity between nodes]({{ site.baseurl }}/admin/setup/test-network.html)
* [Set up a fiscal calendar year]({{ site.baseurl }}/admin/setup/set-custom-calendar.html)
* [Integrate LDAP]({{ site.baseurl }}/admin/setup/about-LDAP.html)
* [Set up monitoring]({{ site.baseurl }}/admin/setup/set-up-monitoring.html)
* [Configure support services]({{ site.baseurl }}/admin/setup/work-with-ts-support.html)
* [Network ports]({{ site.baseurl }}/admin/setup/firewall-ports.html)
* [Configure load balancing and proxies]({{ site.baseurl }}/admin/setup/about-load-balancer-configuration.html)
* [Customize look and feel]({{ site.baseurl }}/admin/setup/customize-style.html)
* [Add the Slack integration]({{ site.baseurl }}/admin/setup/slack-integration.html)
