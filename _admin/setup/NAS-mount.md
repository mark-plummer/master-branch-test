---
title: [Configure NAS file system]
last_updated: 3/4/2020
sidebar: mydoc_sidebar
summary: "Some operations, like backup, restore, and data loading, require either
reading or writing very large files. You can mount a network attached storage (NAS) file
system to support these operations. Your NAS storage can be in the drive format you choose."
permalink: /:collection/:path.html
---
{: id="mount-nas"}
## About NAS mount

ThoughtSpot enables you to mount a NAS file system for storing or accessing
large files. The file system will be mounted at the same location on each node in the cluster automatically. When any node is restarted, the file system will be mounted again automatically, if it can be found.

When supplying a directory for writing or reading a backup, you can specify the a new mount point within `/export` as the directory to use. Likewise, you can stage data there for loading. It is best to have 2 separate NAS volumes, individually dedicated to data loads and backups.

Backups are written by the Linux user `admin`. If that user does not have
permission to write to the NAS file system, you can write the backups to a disk
(for example `/export/sdc1`, `/export/sdd1`, `/export/sde1`, or `/export/sdf1`)
and then set up a cron job that executes as root user and copies the backup to
the NAS device every night, then deletes it from the directory.

Do not send the periodic backups or stage files on `/export/sdb1` since it is a
name node. It is used internally by Hadoop Distributed File System (HDFS) and if
this drive fills up, it can cause serious problems. Do not allow backups or data
files to accumulate on ThoughtSpot. If disk space becomes limited, the system
will not function normally.

{: id="mount-nas-tscli"}
## Mount NAS using tscli

To mount a NAS file system using the tscli, follow these steps:

1. Log in to the Linux shell using SSH.
2. Mount the directory to the file system by issuing the appropriate command:
    -   Example for an NFS (Network File System) directory:

        ```
        tscli nas mount-nfs --server storageservername.file.yourdomain.net
           --path_on_server <path>  /tsdev-backup --mount_point /export/BACKUPS/
           --options vers=<version>,sec=<security scheme>,<OPTIONS>
        ```

        {% include note.html content="Other command-line options are available to forward to the command (default: `noexec`)." %}

    -   Example for a CIFS (Common Internet File System) directory:

        ```
        tscli nas mount-cifs --server storageservername.file.yourdomain.net
          --path_on_server /tsdev-backup --mount_point /export/BACKUPS/
          --username 'avtprdweutspotdev' --uid 1001 --gid 1001 --options 'vers=3.0'
        ```

        {% include note.html content="Other command-line options are available to forward to the `mount.cifs` command (default: `noexec`)." %}

3. Use the mounted file system by referring to its mount point.

4. When you are finished with it, you can optionally unmount the NAS file system:

    ```
    tscli nas unmount --dir <directory>
    ```
