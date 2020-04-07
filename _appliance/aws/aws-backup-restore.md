---
title: [Back up and Restore an AWS cluster using S3]
last_updated: 3/13/2020
sidebar: mydoc_sidebar
summary: "Learn how to back up or restore your ThoughtSpot cluster hosted in AWS using an S3 bucket."
permalink: /:collection/:path.html
---
It is recommended to use a bucket in the same region as your cluster. By doing this, you avoid additional cross-region data transfer costs.

## Backing up to an Amazon S3 bucket

To back up your cluster to an S3 bucket, use the ThoughtSpot tscli:

1. Log in to the Linux shell of your cluster using SSH.
    ```
    $ ssh admin@<cluster-IP>
    ```
2. Run the backup command using the following syntax:  

    `tscli backup create --storage_type=cloud <SNAPSHOT NAME> <PATH TO BACKUP> --bucket_name=<BUCKET NAME>`

    Example:
    ```
    $ tscli backup create --storage_type=cloud snapshot_1 my_backup001 --bucket_name=my_bucket
    ```

## Restoring from an Amazon S3 bucket

To restore your cluster from an S3 bucket, use the ThoughtSpot tscli:

1. Log in to the Linux shell of your cluster using SSH.
    ```
    $ ssh admin@<cluster-IP>
    ```
2. Run the restore command using the following syntax:  

    `tscli cluster restore <PATH TO BACKUP ON CLOUD> --enable_cloud_storage=s3a`

    Example:
    ```
    $ tscli cluster restore s3://bucket0001/backup/my_backup001 --enable_cloud_storage=s3a
    ```
