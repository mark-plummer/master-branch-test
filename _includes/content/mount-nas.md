Some operations, like backup/restore and data loading, require you to either
read or write large files. You can mount a NAS (network attached storage) file
system for these operations. Currently, ThoughtSpot does not have an option for
direct attached storage. Your NAS storage can use whichever drive format you
would like.

This procedure shows you how to mount a NAS file system for storing or accessing
large files. The file system will be mounted at the same location on each node
in the cluster automatically. When any node is restarted, the file system will
be mounted again automatically, if it can be found.

When supplying a directory for writing or reading a backup, you can specify the
`mount` point as the directory to use. Likewise, you can stage data there for
loading.

Backups are written by the Linux user `admin`. If that user does not have
permission to write to the NAS file system, you could write the backups to disk
(for example `/export/sdc1`, `/export/sdd1`, `/export/sde1`, or `/export/sdf1`)
and then set up a cron job that executes as root user and copies the backup to
the NAS device every night, then deletes it from the directory.

Do not send the periodic backups or stage files on `/export/sdb1` since it is a
name node. It is used internally by Hadoop Distributed File System (HDFS) and if
this drive fills up, it can cause serious problems. Do not allow backups or data
files to accumulate on ThoughtSpot. If disk space becomes limited, the system
will not function normally.

1. Log in to the Linux shell using SSH.
2. Mount the directory to the file system, by issuing the appropriate command:
    -   For an NFS (Network File System) directory:

        ```
        tscli nas mount-nfs
           --server <server_NFS_address>
           --path_on_server <path>
           --mount_point <target>
           --options vers=<version>, sec=<security scheme>, <OPTIONS>
        ```

        {% include note.html content="Other command-line options are available to forward to the command (default: `noexec`)." %}

    -   For a CIFS (Common Internet File System) directory:

        ```
        tscli nas mount-cifs
           --server <server_CIFS_address>
           --path_on_server <path>
           --mount_point <target>
           --username <user>
           --password <password>
           --uid <uid>
           --gid <gid>
           --options <OPTIONS>
        ```

        {% include note.html content="Other command-line options are available to forward to the `mount.cifs` command (default: `noexec`)." %}

3. Use the mounted file system as you wish, specifying it by referring to its mount point.
4. When you are finished with it, you may optionally unmount the NAS file system:

    ```
    tscli nas unmount --dir <directory>
    ```
