---
title: [Using the tscli cluster create command]
last_updated: [1/8/2020]
summary: "Learn how to use the cluster create command to install your appliance."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
{: id="using-cluster-create"}
## Using the tscli cluster create command
To install your appliance, you must install the cluster using the release tarball (estimated time 1 hour).
1. **Download the release tarball** Download the release tarball from the download link sent by ThoughtSpot Support.<br>
Refer to your welcome letter to find a link to download the release tarball. If you do not have a download link, open a support ticket at [ThoughtSpot Support](https://support.thoughtspot.com) to access the release tarball.  
2.  **Copy the release tarball** In your Terminal (Apple) or using [Winscp](https://winscp.net/eng/index.php) (Windows application), copy the downloaded release tarball to `/home/admin/` and run the cluster installer as shown below.<br>
Run the secure copy command: `scp <release-number> admin@<hostname>:/home/admin/<file-name>`. Note the following parameters:<br>
* `release-number` is the version of ThoughtSpot you have on your cluster, such as `6.0` or `5.3`. `release-number` is of the form `0.0.tar.gz`.
* `hostname` is your network hostname. Ask your network administrator if you do not know your hostname.
* `file-name` is the name of the tarball file on your local machine.
    For example:
```
    $ scp 6.0.tar.gz admin@ThoughtSpot:/home/admin/TS-tarball.
```
  ThoughtSpot recommends that you start the session using [screen](https://linux.die.net/man/1/screen), so you do not lose your progress if you lose your connection at any point.
  ```
    $ scp <release-number> admin@<hostname>:/home/admin/<file-name>
  ```
3. **Run the `tscli cluster create` command** Run `tscli cluster create <release-number>` in your terminal.<br>
If you are using an s3 or GCS bucket for object storage, include the flag `--enable_cloud_storage=s3` or `--enable_cloud_storage=gcs`. GCS is GCP's object storage, and s3 is AWS's object storage.
```
    $ tscli cluster create 6.0.tar.gz --enable_cloud_storage=s3
```  
```
    $ tscli cluster create 6.0.tar.gz --enable_cloud_storage=gcs
```  
4. **Specify your installation information** Fill out the cluster name, cluster ID, email alert preferences and the IP’s of the nodes at the prompts specified in [Parameters of the tscli cluster create command]({{ site.baseurl }}/appliance/hardware/parameters-cluster-create.html).
5. **Wait for output** You may need to wait about 15 seconds before you see any output. The installer is unpacking files and copying them over to the nodes, which can take a few seconds.

Do not edit any part of the installer file except the sections specified in [Parameters of the tscli cluster create command]({{ site.baseurl }}/appliance/hardware/parameters-cluster-create.html). if you delete colons, commas, or other parts of the code, setup may fail.

Refer to [Parameters of the tscli cluster create command]({{ site.baseurl }}/appliance/hardware/parameters-cluster-create.html) for further information.

Your `tscli cluster create` output may look something like the following:

{: id="run-installer"}

### Run the Installer
The output for a hardware installation:
```
[admin@jessi-gcs-test ~]$ tscli cluster create 6.0-145.tar.gz
Unpacking 6.0-145.tar.gz to /export/release_cache/e695feeec627591dc644635c0d8ea03d
################################################################
#                                                              #
#               Welcome to ThoughtSpot installer               #
#                                                              #
################################################################
Enter a name for the cluster (alphanumeric characters only): jessi-ts-gcs-test
Enter cluster ID: 0x0000
Enter IP addresses of all hosts in the cluster (space separated): 10.116.0.66
Enter email addresses for alerts (space separated, "later" to skip): later
2019-11-03 21:26:47,959 Pushing /usr/local/scaligent/toolchain/jolokia to localhost
2019-11-03 21:26:48,195 Rsync finished on localhost
2019-11-03 21:26:48,195 Rsync finished to all hosts
2019-11-03 21:26:48,195 Pushing /usr/local/scaligent/toolchain/jvm to localhost
2019-11-03 21:26:48,461 Rsync finished on localhost
2019-11-03 21:26:48,461 Rsync finished to all hosts
2019-11-03 21:26:48,462 Pushing /usr/local/scaligent/toolchain/hadoop to localhost
2019-11-03 21:26:48,738 Rsync finished on localhost
2019-11-03 21:26:48,738 Rsync finished to all hosts
2019-11-03 21:26:48,738 Pushing /usr/local/scaligent/toolchain/zookeeper to localhost
2019-11-03 21:26:49,004 Rsync finished on localhost
2019-11-03 21:26:49,004 Rsync finished to all hosts
################################################################
  Setup Hadoop
################################################################
Installing Zookeeper
First deleting existing Zookeeper service
Deleting Zookeeper
Zookeeper Deleted
Starting Zookeeper servers
Zookeeper Ready
Installing HDFS
First deleting existing HDFS service
Deleting HDFS
HDFS Deleted
Deploying configs
Formatting and starting Primary Name Node
Starting Data Nodes
Setting NFS configs
Waiting for HDFS
HDFS Ready
2019-11-03 21:27:06,212 Starting a secondary namenode for checkpoint...
2019-11-03 21:27:06,551 Cannot disable unknown service: hdfs_secondary_namenode
2019-11-03 21:27:06,552 Failed to disable new service: hdfs_secondary_namenode
2019-11-03 21:27:07,198 HDFS secondary namenode started successfully.
Successfully Created zookeeper znodes
Successfully initialized HDFS files
Successfully saved hadoop layout proto
Successfully moved the release dir to export partition
Successfully installed orion on localhost
Successfully connected to Orion Master
Successfully enabled data protection
Successfully enabled firewall
Successfully added machines to cluster
Couldn't install application services
Successfully connected to Orion Master
Successfully enabled data protection
Successfully enabled firewall
Successfully added machines to cluster
Couldn't install application services
Successfully connected to Orion Master
Successfully enabled data protection
Successfully enabled firewall
Successfully added machines to cluster
Successfully installed application services
All nodes are now healthy
Restarted all services
Successfully pushed statsdb
Successfully refreshed alert metadata
Successfully enabled alerts
Successfully configured new ssh keys on cluster
Successfully recorded install event
Successfully deleted deployer service
2019-11-03 21:40:02,917 Cannot check for enabled status of unknown service: deploy
```

The output for a cloud installation, with GCS object storage:
```
admin@jessi-gcs-test ~]$ tscli cluster create ./6.0-145.tar.gz  --enable_cloud_storage gcs
Unpacking ./6.0-145.tar.gz to /export/release_cache/e695feeec627591dc644635c0d8ea03d
################################################################
#                                                              #
#               Welcome to ThoughtSpot installer               #
#                                                              #
################################################################
Enter a name for the cluster (alphanumeric characters only): jessi-ts-gcs-test
Enter cluster ID: 0x0000
Enter IP addresses of all hosts in the cluster (space separated): 10.116.0.66
Enter email addresses for alerts (space separated, "later" to skip): later
Enter the GCS bucket to be configured for the cluster: jessi-gcs-test-bucket
Bucket successfully validated.
2019-11-03 22:00:29,175 Pushing /usr/local/scaligent/toolchain/jolokia to localhost
2019-11-03 22:00:29,411 Rsync finished on localhost
2019-11-03 22:00:29,411 Rsync finished to all hosts
2019-11-03 22:00:29,412 Pushing /usr/local/scaligent/toolchain/jvm to localhost
2019-11-03 22:00:29,678 Rsync finished on localhost
2019-11-03 22:00:29,678 Rsync finished to all hosts
2019-11-03 22:00:29,678 Pushing /usr/local/scaligent/toolchain/hadoop to localhost
2019-11-03 22:00:29,945 Rsync finished on localhost
2019-11-03 22:00:29,945 Rsync finished to all hosts
2019-11-03 22:00:29,945 Pushing /usr/local/scaligent/toolchain/zookeeper to localhost
2019-11-03 22:00:30,211 Rsync finished on localhost
2019-11-03 22:00:30,211 Rsync finished to all hosts
################################################################
  Setup Hadoop
################################################################
Installing Zookeeper
First deleting existing Zookeeper service
Deleting Zookeeper
Zookeeper Deleted
Starting Zookeeper servers
Zookeeper Ready
Installing HDFS
First deleting existing HDFS service
Deleting HDFS
HDFS Deleted
Deploying configs
Formatting and starting Primary Name Node
Starting Data Nodes
Setting NFS configs
Waiting for HDFS
HDFS Ready
2019-11-03 22:00:47,287 Starting a secondary namenode for checkpoint...
2019-11-03 22:00:47,629 Cannot disable unknown service: hdfs_secondary_namenode
2019-11-03 22:00:47,630 Failed to disable new service: hdfs_secondary_namenode
2019-11-03 22:00:48,282 HDFS secondary namenode started successfully.
Successfully Created zookeeper znodes
Successfully initialized HDFS files
Successfully saved hadoop layout proto
Successfully moved the release dir to export partition
Successfully installed orion on localhost
Successfully connected to Orion Master
Successfully enabled data protection
Successfully enabled firewall
Successfully added machines to cluster
Couldn't install application services
Successfully connected to Orion Master
Successfully enabled data protection
Successfully enabled firewall
Successfully added machines to cluster
Couldn't install application services
Successfully connected to Orion Master
Successfully enabled data protection
Successfully enabled firewall
Successfully added machines to cluster
Successfully installed application services
All nodes are now healthy
Restarted all services
Successfully pushed statsdb
Successfully refreshed alert metadata
Successfully enabled alerts
Successfully configured new ssh keys on cluster
Successfully recorded install event
Successfully deleted deployer service
2019-11-03 22:11:54,571 Cannot check for enabled status of unknown service: deploy
```

## Related information
* [Deploying on the SMC appliance]({{ site.baseurl }}/appliance/hardware/installing-the-smc.html)
* [Configure ThoughtSpot nodes in AWS]({{ site.baseurl }}/appliance/aws/installing-aws.html)
* [Configure ThoughtSpot nodes in GCP]({{ site.baseurl }}/appliance/gcp/installing-gcp.html)
* [Configure ThoughtSpot nodes in VMware]({{ site.baseurl }}/appliance/vmware/installing-vmware.html)
* [Configure ThoughtSpot nodes in Azure]({{ site.baseurl }}/appliance/azure/installing-azure.html)
* [Deploying on the Dell Appliance]({{ site.baseurl }}/appliance/hardware/installing-dell.html)
* [Parameters of the tscli cluster create command]({{ site.baseurl }}/appliance/hardware/parameters-cluster-create.html)
