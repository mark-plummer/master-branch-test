---
title: [System security tools and processes]
summary: "System security refers to audit logs and security policies."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
ThoughtSpot includes a number of management tools, monitoring applications, and automated processes to support system security. System security includes managing access and privileges, audit logs, security policies, and Linux OS installed package updates.

## Audit logs

There are several ways you can view audit log information in ThoughtSpot. You can see recent events in the Control Center or view more detailed audit logs using tscli. Administrators can view audit logs of configuration changes users have made to ThoughtSpot in these ways:

- Monitor events from the [Control Center]({{ site.baseurl }}/admin/system-monitor/monitor-pinboards.html#).
- Generate audit log reports through the `tscli` command.


You can access an audit log of cluster events through tscli. You can also access information on cluster updates, configurations, data loading and metadata events.

Use the `tscli event list` command to return an audit list of events from the cluster. The syntax is:

```
tscli event list
   [--include <all|config|notification>]
   [--since <hours,minutes,days>
   | --from <yyyymmdd-HH:MM>
   --to <yyyymmdd-HH:MM>]
   [--detail]
   [--summary_contains
   <'string1'| 'string2' ...>]
   [--detail_contains
   <'string1'| 'string2' ...>]
   [--attributes
   <key1='value1'|
   key2='value2' ...>]
```

Optional parameters are:

| Parameter | Description |
|---------------|---------------------|
| `--include` | Specifies the type of events to include, and can be `all`, `config`, or `notification`. |
| `--detail` | Returns the events in a detail format rather than a tabular summary, which is the default. |
| `--summary_contains <'string1' | 'string2' ...>` | Specifies a string to check for in the event summary. Enclose strings in single quotes, and separate multiple strings with &pipe;. Events that match all specified strings will be returned. |
| `--detail_contains <'string1'| 'string2' ...>` | Specifies a string to check for in the detail. Enclose strings in single quotes, and separate multiple strings with `|` (pipe symbol). Events that match all specified strings will be returned.|
| `--attributes <key1='value1' &pipe; key2='value2' ...>` | Specifies attributes to match as key=value pairs. Separate multiple attributes with `|` (pipe symbol). Events that match all specified key/value pairs will be returned. Put single quotes around the value(s). |

And a time window made up of either:

- `--since <hours,minutes,days>` is a time in the past for where the event audit begins, ending at the present time. Specify a human readable duration string, e.g. 4h (4 hours), 30m (30 minutes), 1d (1 day).

Or both:

- `--from <yyyymmdd-HH:MM>` is a timestamp for where to begin the event audit. It must be of the form: yyyymmdd-HH:MM.
- `--to <yyyymmdd-HH:MM>` is a timestamp for where to end the event audit. It must be of the form: yyyymmdd-HH:MM.

To get audit logs:

1. Log in to the Linux shell using SSH.
2. Issue the `tscli event list` command, with the desired parameters, for example:

    ```
    $ tscli event list
       --include config
       --since 24 hours
    ```


## Security policies

Security policies are the principles and processes ThoughtSpot uses in development to ensure a product that conforms to security standards. Security policies ensure a secure product with each release. When a release is in development, each build is tested using Qualys Network Security and Vulnerability Management Suite. Issues and vulnerabilities are fixed proactively, based on the results.

The ThoughtSpot Engineering and ThoughtSpot Support teams are notified of Common Vulnerabilities and Exposures (CVEs), so they can patch OS packages proactively as well. You can view installed packages along with their version numbers at any time, in order to see if you require an update to ThoughtSpot.

Whenever a CVE is identified, and an OS package needs to be updated, the next patch release will include the patch or update. You can view installed Linux packages at any time, along with the version numbers of the installed packages.

## Third-party security software for security, governance, and monitoring of ThoughtSpot

You can install supported [third-party security and monitoring software]({{ site.baseurl}}/admin/data-security/about-secure-monitor-sw.html#) on a ThoughtSpot cluster.
