---
title: [About restore operations]
summary: Learn how to restore ThoughtSpot from a snapshot or backup.
last_updated: 3/10/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
When restoring to a running cluster where the ThoughtSpot software is not updated, we recommend that you use a snapshot. If you updated the cluster to a new release, if the configuration changed significantly, or when restoring to a different cluster, you must restore from a backup.

Restoring from backup require that you first delete the old cluster. Changes to a cluster that require restoring from a backup instead of a snapshot include:

-   Removal of a node.
-   Restoring to a different cluster from the one where the snapshot/backup was taken.
-   Restoring to a cluster running a different release from the one where the snapshot/backup was taken.

You should never restore from a snapshot or backup yourself. To restore from a snapshot or backup, contact [ThoughtSpot Support]({{ site.baseurl }}/appliance/contact.html).

## Restoring a ThoughtSpot cloud deployment

For details on how to restore a ThoughtSpot cluster hosted in the cloud, see:
- [Backup and Restore with AWS ]({{ site.baseurl }}/appliance/aws/aws-backup-restore.html#)
- [Backup and Restore with GCP]({{ site.baseurl }}/appliance/gcp/gcp-backup-restore.html#)
