---
title: [Understand backup modes]
summary: Learn about types of backups.
last_updated: 3/10/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

A backup is a procedure that stores a snapshot *outside* of a ThoughtSpot cluster. Backups are stored in a directory on a local or network file system. You can store all of the data associated with a snapshot, a portion of that data, or only metadata. Other advanced administrative operations also use backups.

You can use a backup to restore a cluster to a prior state or to a differently configured appliance. You can also use a backup to move a cluster from an appliance to a virtual cluster, or vice versa.

You can create a manual backup or configure an automated, periodic backup. For manual backups, the system creates a backup using the named snapshot you specify. For periodic backups, the system uses the most recent snapshot to create the backup.

{% include warning.html content="You should never disable the periodic snapshot system, because backups rely on it. For example, if you have disabled the periodic snapshots system and periodic backups are enabled, then the periodic backup may use a very outdated snapshot or it may fail all together." %}

ThoughtSpot usually stores backups on a [NAS (network attached storage) file system]({{ site.baseurl }}/admin/setup/NAS-mount.html#) but you can store them on a local disk as well. When creating a backup, ThoughtSpot copies a release tarball and several supporting files to a disk you specify. Storing these supporting files takes about 10 GB of extra space beyond the backup itself. The final backup image is smaller because these extra files are removed after the backup completes successfully. So, make sure you have enough disk space both to _take_ a backup and store the result. Use the `tscli storage df` command to identify the amount of space available.

You can create a backup using one of three modes: `full`, `lightweight`, or `dataless`.

## Full backups

Full backups are entire backups of the cluster with all data, whether loaded
from the web interface or from `tsload`. This is the best mode for restoring a
cluster and all your data. After a `FULL` backup is created, you can move the backup
between clusters, even if the cluster configuration is different. Full backups
can be as large as 20 GB in addition to the 5 GB of additional files. Some
installations can exceed these limits, this is why it is important to test your
backup configuration.

Before creating a manual backup or configuring automated backups, make sure
there is enough disk space on the target disk. Consider an example, where you
want to store three backups. If the backup itself takes 18GB, you need about 18 +
5 = 23 GB of free disk space. Don't forget that the backup size can grow over
time, so you should occasionally check to ensure you are not in danger of
running out of disk space to store backups.


## Lightweight backups

Lightweight backups contain everything that makes up a cluster:

-   Cluster configuration (SSH, LDAP, etc.)

-   In-memory data cache

-   All data that is stored unencrypted in HDFS

-   Data uploaded by users

-   Metadata for the data store

-   Users, groups and permissions

-   Objects created by users (pinboards, worksheets, and formulas) with their shares and permissions.

-   Data model and row-level security rules.


Lightweight backups do **not** contain data loaded through ThoughtSpot Loader (`tsload`), ODBC/JDBC drivers, and Data
Connect. The expectation is that data loaded by `tsload` is from
external sources and so can be re-loaded after the cluster is restored. An
exception is if these mechanisms were used to load data into tables that were
first created through CSV import (that is, a user first loaded the tables using
the UI). In this case, the data, like the tables they were loaded into, are
saved.

## Dataless backups

A dataless backup saves a backup of the schema (metadata), with no data.
Dataless backups allow you to send a copy of your cluster metadata to
ThoughtSpot Support for troubleshooting without compromising data security and
privacy. The size of a dataless backup is usually within 10's of megabytes
provided you do not have customized binaries.

When restoring from a dataless backup, you must supply the correct release
tarball, since this type of backup does not include the software release.
