---
title: [Set up high availability for AWS]
last_updated: 12/10/2019
summary: "This article explains how to set up High Availability (HA) for your ThoughtSpot cluster using the AWS Elastic File System (EFS)."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

{: id="configure-ha"}
## Configure high availabiity
Follow these steps to set up High Availability (HA) for your ThoughtSpot cluster using the AWS Elastic File System (EFS).

1. Create an EFS File System that spans across different availability zones, and across different subnets. Refer to AWS documentation on [creating an EFS File System](https://docs.aws.amazon.com/efs/latest/ug/getting-started.html?shortFooter=true).

2. Create two ThoughtSpot clusters in each availability zone and in the subnets, where the new file system is.

3. Change the IP addresses of the cluster, if necessary.

4. Create an EFS <customizable_name> directory in the <code>/home/admin</code> path.

5. Issue the following command to mount the new file system.

   Modify the fields as necessary for your installation.

   ```
   sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,
                        noresvport fs-f756f1ee.efs.us-west-1.amazonaws.com:/ /home/admin/efs/
   ```
6. Modify permissions to ensure that all clusters with EFS mount points have read and write permissions.
   ```
   chmod 777 /home/admin/efs
   ```

5. On the first cluster, create a snapshot on to the EFS mount point, and back it up.

   ```
   tscli snapshot create EfsTest HA 2
```
7. Create a backup on the cluster.
   ```
   tscli backup create --mode full --type full
                       --storage_type local EfsTest /home/admin/efs/Efs-backup
   ```

6. Ensure that the backup is successful, and that it can be accessed from all clusters where EFS is mounted, by listing all backups and looking for the new one.
```
  tscli backup ls
```
7. Take down the first cluster instances.

8. On the second cluster, delete the existing cluster.

8. Create a new cluster by restoring from the first cluster backup. This is accessible from the EFS mount point.

   ```
   tscli cluster restore /home/admin/EFS/Efs-backup
   ```

Your cluster is now successfully restored to the second cluster from the backup on the EFS, achieving HA for ThoughtSpot clusters.

{: id="replace-cluster"}
## Replace a cluster

For information on how to recover from infrastructure failure scenarios, see: [Cluster replacement]({{ site.baseurl }}/disaster-recovery/cluster-replacement.html).

{% include note.html content="At this time, ThoughtSpot does not support AWS Auto Scaling or deployment across AWS availability zones or regions." %}
