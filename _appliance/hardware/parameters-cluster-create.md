---
title: [Parameters of the tscli cluster create command]
last_updated: [12/19/2019]
summary: "Learn the parameters of the tscli cluster create command."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

{: id="using-cluster-create"}
## Using the tscli cluster create command
To install your appliance, you must install the cluster.

1. **Copy the release tarball** In your Terminal (Apple) or using [Winscp](https://winscp.net/eng/index.php) (Windows application), copy the downloaded release tarball to /home/admin/ and run the cluster installer as shown below.<br>
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
1. **Run the `cluster create` command** Run `tscli cluster create <release-number>` in your terminal.<br>
If you are using an s3 or GCS bucket for object storage, include the flag `--enable_cloud_storage=s3` or `--enable_cloud_storage=gcs`. GCS is GCP's object storage, and s3 is AWS's object storage.
```
    $ tscli cluster create 6.0.tar.gz --enable_cloud_storage=s3
```  
```
    $ tscli cluster create 6.0.tar.gz --enable_cloud_storage=gcs
```  
2. **Fill out your specific information** Fill out the cluster name, cluster ID, email alert preferences and the IP’s of the nodes at the prompts specified in [Parameters of ThoughtSpot Installer]({{ site.baseurl }}/appliance/hardware/parameters-cluster-create.html#parameters-cluster-create) below.

Refer to [Parameters of ThoughtSpot Installer]({{ site.baseurl }}/appliance/hardware/parameters-cluster-create.html#parameters-cluster-create) for further information.
Refer to [Using the tscli cluster create command]({{ site.baseurl }}/appliance/hardware/cluster-create.html) to see the expected output of the install command, `tscli cluster create`.

Do not edit any part of the installer file except the sections specified in [Parameters of ThoughtSpot Installer]({{ site.baseurl }}/appliance/hardware/parameters-cluster-create.html#parameters-cluster-create). If you delete colons, commas, or other parts of the code, setup may fail.

{: id="parameters-cluster-create"}

### Parameters of ThoughtSpot Installer

**Cluster Name** Name your cluster based on the ThoughtSpot naming convention, in the form *company-clustertype-location-clusternumber*. For example, *ThoughtSpot-prod-Sunnyvale-12*.

**Cluster ID** Enter the ID of your cluster that [ThoughtSpot Support]({{ site.baseurl }}/appliance/contact.html) provided for you. Open a ticket with ThoughtSpot Support if you do not have an ID.

**Host IPs**	Enter the IP addresses of all cluster hosts, in the form 000.000.000.000. For example, 192.168.7.70. Use spaces instead of commas to separate multiple IP addresses.

**Email alerts**	Enter the email addresses you would like to receive alerts about this cluster, in the form company@example.com. The address prod-alerts@thoughtspot.com appears automatically and should remain, so that ThoughtSpot can be aware of the status of your cluster. Separate email addresses using a space.

## Related information
* [Deploying on the SMC appliance]({{ site.baseurl }}/appliance/hardware/installing-the-smc.html)
* [Configure ThoughtSpot nodes in AWS]({{ site.baseurl }}/appliance/aws/installing-aws.html)
* [Configure ThoughtSpot nodes in GCP]({{ site.baseurl }}/appliance/gcp/installing-gcp.html)
* [Configure ThoughtSpot nodes in VMware]({{ site.baseurl }}/appliance/vmware/installing-vmware.html)
* [Configure ThoughtSpot nodes in Azure]({{ site.baseurl }}/appliance/azure/installing-azure.html)
* [Deploying on the Dell Appliance]({{ site.baseurl }}/appliance/hardware/installing-dell.html)
* [Using the tscli cluster create command]({{ site.baseurl }}/appliance/hardware/cluster-create.html)
