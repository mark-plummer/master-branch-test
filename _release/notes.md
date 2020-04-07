---
title: ["6.1 Release Notes"]
toc: false
last_updated: March 30, 2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

ThoughtSpot version 6.1 is now available. These release notes include information about new features,
fixed issues from previous releases, and any known issues.

* [6.1 New Features](#6-new)
* [6.1 Fixed Issues](#6-fixed)
* [Beta Programs](#beta-program)
* [Supported Upgrade Paths](#upgrade-paths)
* [Notes from Older Versions](#notes-for-older-versions)

{: id="6-1-new"}
## 6.1 New Features and Functionality

### Updating ThoughtSpot UI through CDN

Starting with this release, you can configure automatic updates of the front end of the ThoughtSpot application by uploading from CDN (Amazon Cloudfront). This enables your organization to get many new features of ThoughtSpot and get many critical bug fixes without experiencing the traditional upgrade downtime.

UI auto-update is in the Early Access phase. Please contact us if you are interested in participating in the <a href="mailto:early_access@thoughtspot.com?subject=UI%20Update%20Early%20Access%20Program%20Request" target="_blank">UI Update Early Access Program</a>.

### Back up and restore ThoughtSpot AWS and GCP clusters using cloud storage

With AWS, you can back up and restore using an S3 bucket. With GCP, you can back up and restore using a GCS bucket.

For details, see:
- [Back up and restore an AWS cluster using S3]({{ site.baseurl }}/appliance/aws/aws-backup-restore.html#)
- [Back up and restore a GCP cluster using GCS]({{ site.baseurl }}/appliance/gcp/gcp-backup-restore.html#)

### Geo map support for Norway and Switzerland

For details, see: [Geo Map reference]({{ site.baseurl }}/reference/geomap-reference.html#)

### Additional SQL commands for ODBC drivers

For developers creating tools to connect to ThoughtSpot through the ODBC or JDBC driver, the following new commands are available:

- `ALTER TABLE`
- `CREATE DATABASE`
- `CREATE SCHEMA`
- `DROP`
- `SCRIPT`
- `SHOW`
- `TRUNCATE`

For details, see: [Supported SQL commands]({{ site.baseurl }}/data-integrate/reference/odbc-commands.html)

{: id="6-1-fixed"}
## 6.1 Fixed Issues

The following issues are fixed in the 6.1 release:

  - When using the `tscli fileserver upload` command to upload a file that is larger than the maximum supported file size, an error message with an incorrect maximum file size appears.
  - The tscli event list displays messages for creation, modification, and deletion that are not user friendly.
  - Sorting or filtering a column in a chart does not work.
  - The column order in the PDF of a visualization is different than the order in shown in ThoughtSpot.
  - Removing a key from a table is not possible because multiple joins for an old column cannot be detected.
  - Intermittent slow search response time.
  - Entering a search generates results from columns outside the selected data source.
  - An incorrect result is displayed when a filter is created on the Group_Max aggregation function.
  - Backup policy names are not validated to ensure they won't cause backups to fail.
  - The headline table aggregate summary is not available when group aggregate functions are used.
  - Removing a column from a search increases the number of rows shown.
  - Multiple variables cannot be added to a single map visualization.
  - Drilling down on a visualization causes the date format to change.
  - Double-clicking on the legend of a stacked column chart does not show hidden values.
  - Data load fails due to a primary key having multiple rows.
  - Filtering on a pinboard card causes a NullPointerException error.
  - A formula with Group_Max function doesn't work with Growth key word.
  - The confirmation message for deleting a restored cluster indicates the wrong cluster name.
  - Modifying a date filter of a pinboard from a set date range to none, causes the filter to disappear.
  - R visualization downloads fail when exporting to PDF.
  - A pinboard with filters cannot be saved.
  - Using a weekly date aggregation with a custom calendar, causes the days to be split at the end of the month if the month ends in the middle of the week.
  - Worksheet filters provide different answers than search filters.
  - Drilling down on a date in a custom calendar displays an incorrect epoch.
  - Menu items, including Share, Copy a Link, and Send Feedback, cannot be disabled when ThoughtSpot is embedded.
  - ThoughtSpot instances hosted in GCP have a 127.0.0.1 address for eth0.
  - Keywords do not provide correct results when using a custom calendar.
  - A worksheet cannot be saved after changing a join type.
  - Top and Bottom keywords do not work on a measure with the `unique_count_if` formula applied.
  - Non-admin users are unable to search for a newly added column in the worksheet.
  - Colors of slices in pie chart change when you filter on the pie chart.
  - Total labels in a Stacked Bar chart do not account for negative amounts.
  - When adding a connection in Embrace, not all tables in the external database are displayed.
  - ThoughtSpot TQL does not list tables that don't exist in the default Falcon schema.
  - The date format in a PDF is not correct for the user's locale.
  - Various display issues with Admin Portal.
  - Periodic backups fail after upgrade.
  - Geo maps allow regional German names for states.
  - In ThoughtSpot clusters hosted in Azure, Log rotate does not rotate `large_files`.

{: id="early-access"}
## Early Access Programs

### UI update

Please contact us if you are interested in participating in the <a href="mailto:early_access@thoughtspot.com?subject=UI%20Update%20Early%20Access%20Program%20Request" target="_blank">UI Update Early Access Program</a>.

### RHEL support
RHEL support is in the Early Access phase. To deploy ThoughtSpot on RHEL, you must have the Ansible tarball; please contact us if you are interested in participating in the <a href="mailto:early_access@thoughtspot.com?subject=RHEL%20Early%20Access%20Program%20Request" target="_blank">RHEL Early Access Program</a>. For more information, see [RHEL Deployment Overview]({{ site.baseurl }}/appliance/rhel/rhel.html).

{: id="beta-program"}
## Beta Programs

If you are interested in seeing some of our newest features, we want to add you to our testing group. ThoughtSpot is looking for people with all levels of experience: end-users, analysts, administrators, configurators, and so on.
We like to have a diversity of experience and perspective, and want to hear from you. Because we strive for excellence, we will partner with you to adjust the final details of our offerings based on your feedback.

### Monitor

Please contact us if you are interested in participating in the <a href="mailto:BetaProgram@thoughtspot.com?subject=Monitor%20Beta%20Program%20Request" target="_blank">Monitor Beta Program</a>, for monitoring selected metrics over time.

{: id="upgrade-paths"}
## Supported Upgrade Paths

If you are running one of the following versions, you can upgrade to the 6.1 release
directly:

* 5.3.x to 6.1
* 5.2.x to 6.1

(This includes any hotfixes or customer patches on these branches.)

If you are running a different version, you must do a multiple pass upgrade.
First, upgrade to version 5.2.x, or version 5.3.x, and then to the 6.1 release.

{% include note.html content="To successfully upgrade your ThoughtSpot cluster, all user profiles must include a valid email address. Without valid email addresses, the upgrade is blocked." %}

{: id="notes-for-older-versions"}
## Notes for earlier releases

* [6.0 Release Notes](/6.0/pdf/ThoughtSpot_Release_Notes_6.0.pdf)
* [5.3 Release Notes](/5.3/pdf/ThoughtSpot_Release_Notes_5.3.pdf)
* [5.2 Release Notes](/5.2/pdf/ThoughtSpot_Release_Notes_5.2.pdf)
* [5.1 Release Notes](/5.1/pdf/ThoughtSpot_Release_Notes_5.1.pdf)
* [5.0 Release Notes](/5.0/pdf/ThoughtSpot_Release_Notes_5.0.pdf)
* [4.5 Release Notes](/4.5/pdf/ThoughtSpot_Release_Notes_4.5.pdf)
* [4.4 Release Notes](/4.4/pdf/ThoughtSpot_Release_Notes_4.4.pdf)
