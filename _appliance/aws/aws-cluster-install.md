---
title: [Install ThoughtSpot clusters in AWS]
last_updated: [2/26/2020]
summary: "Learn how to install ThoughtSpot clusters in AWS."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

## Prerequisites
Before you can install your ThoughtSpot clusters in AWS, complete these prerequisites.
1. **Review configuration options** Refer to [AWS configuration options]({{ site.baseurl }}/appliance/aws/configuration-options.html) for detailed instance specs.
2. **Create the instance** Refer to [Set up AWS for ThoughtSpot]({{ site.baseurl }}/appliance/aws/launch-an-instance.html) to create and launch your instance.
3. **Review required ports** Refer to [Network Policies]({{ site.baseurl }}/appliance/firewall-ports.html) to view the required ports for successful operation of ThoughtSpot.
4. **Configure nodes** Refer to [Configure ThoughtSpot nodes in AWS]({{ site.baseurl }}/appliance/aws/installing-aws.html) to configure your nodes.

{: id="cluster-install"}
## Install ThoughtSpot Software
Install the cluster using the ThoughtSpot software release bundle. The estimated installation time is one hour. Follow the steps in this checklist.

| &#10063; | [Step 1: Run the installer](#cluster-step-1) |
| &#10063; | [Step 2: Check cluster health](#cluster-step-2) |
| &#10063; | [Step 3: Finalize installation](#cluster-step-3) |

Refer to your welcome letter from ThoughtSpot to find the link to download the release bundle. If you do not have a link, open a support ticket at [ThoughtSpot Support](https://support.thoughtspot.com) to request access to the release bundle.

{: id="cluster-step-1"}
### Step 1: Run the installer
1. Copy the downloaded release bundle to `/export/xvdb1/TS_TASKS/install` using the following command:
```
    $ scp -i key.pem <release-number>.tar.gz admin@<hostname>:/export/xvdb1/TS_TASKS/install/<file-name>
```
Note the following parameters:
* `release-number` is the release number of your ThoughtSpot instance, such as 5.3, 6.0, and so on.
* `hostname` is your specific hostname.
* `file-name` is the name of the tarball file on your local computer.

    {% include note.html content="You can use another secure copy method, if you prefer a method other than the <code>scp</code> command." %}

2. Alternatively, use `tscli fileserver download-release` to download the release bundle.<br>
You must [configure the fileserver]({{ site.baseurl }}/reference/tscli-command-ref.html#tscli-fileserver) by running `tscli fileserver configure` before you can download the release.<br>
    ```
    $ tscli fileserver download-release <release-number> --user <username> --out <release-location>
    ```
Note the following parameters:
* `release-number` is the release number of your ThoughtSpot instance, such as 5.3, 5.3.1, 6.0, and so on.
* `username` is the username for the fileserver that you set up earlier, when configuring the fileserver.
* `release-location` is the location path of the release bundle on your local machine. For example, `/export/xvdb1/TS_TASKS/install/6.0.tar.gz`.

3. Verify the checksum to ensure you have the correct release.<br>
Run `md5sum -c <release-number>.tar.gz.MD5checksum`.
    ```
    $ md5sum -c <release-number>.tar.gz.MD5checksum
    ```

    Your output says `ok` if you have the correct release.

1. Launch a [screen](https://linux.die.net/man/1/screen) session. Use screen to ensure that your installation does not stop if you lose network connectivity.
    ```
    $ screen -S DEPLOYMENT
    ```

2. Create the cluster.<br>
Run `tscli cluster create` to create the cluster.<br>
If you are using an s3 bucket for object storage, include the flag `--enable_cloud_storage=s3a`.
```
    $ tscli cluster create <release-number>.tar.gz --enable_cloud_storage=s3a
```

3. Edit the output with your specific cluster information.<br>
For more information on this process, refer to [Using the tscli cluster create command]({{ site.baseurl }}/appliance/hardware/cluster-create.html) and [Parameters of the `cluster create` command]({{ site.baseurl }}/appliance/hardware/parameters-cluster-create.html).

  The cluster installer automatically reboots all the nodes after a successful install. The `firewalld` service automatically turns on. At this time, the system is rebooting, which may take approximately 15 minutes.<br>
  Log in to any node to check the current cluster status:
  ```
    $ tscli cluster status
  ```

{: id="cluster-step-2"}
### Step 2: Check cluster health
After the cluster installs, check its status using the `tscli cluster status` command.

Your output may look similar to the following:
```
$ tscli cluster status
Cluster: RUNNING
Cluster name    : thoughtspot
Cluster id      : 1234X11111
Number of nodes : 3
Release         : 6.0
Last update     = Wed Oct 16 02:24:18 2019
Heterogeneous Cluster : False
Storage Type    : HDFS

Database: READY
Number of tables in READY state: 2185
Number of tables in OFFLINE state: 0
Number of tables in INPROGRESS state: 0
Number of tables in STALE state: 0
Number of tables in ERROR state: 0

Search Engine: READY
Has pending tables. Pending time = 1601679ms
Number of tables in KNOWN_TABLES state: 1934
Number of tables in READY state: 1928
Number of tables in WILL_REMOVE state: 0
Number of tables in BUILDING_AND_NOT_SERVING state: 0
Number of tables in BUILDING_AND_SERVING state: 128
Number of tables in WILL_NOT_INDEX state: 0
```
Ensure that the cluster is `RUNNING` and that the Database and Search Engine are `READY`.

```
$ tscli cluster check
Connecting to hosts...
[Wed Jan  8 23:15:47 2020] START Diagnosing ssh
[Wed Jan  8 23:15:47 2020] SUCCESS
################################################################################
[Wed Jan  8 23:15:47 2020] START Diagnosing connection
[Wed Jan  8 23:15:47 2020] SUCCESS
################################################################################
[Wed Jan  8 23:15:47 2020] START Diagnosing zookeeper
[Wed Jan  8 23:15:47 2020] SUCCESS
################################################################################
[Wed Jan  8 23:15:47 2020] START Diagnosing sage
[Wed Jan  8 23:15:48 2020] SUCCESS
################################################################################
[Wed Jan  8 23:15:48 2020] START Diagnosing timezone
[Wed Jan  8 23:15:48 2020] SUCCESS
################################################################################
[Wed Jan  8 23:15:48 2020] START Diagnosing disk
[Wed Jan  8 23:15:48 2020] SUCCESS
################################################################################
[Wed Jan  8 23:15:48 2020] START Diagnosing cassandra
[Wed Jan  8 23:15:48 2020] SUCCESS
################################################################################
[Wed Jan  8 23:15:48 2020] START Diagnosing hdfs
[Wed Jan  8 23:16:02 2020] SUCCESS
################################################################################
[Wed Jan  8 23:16:02 2020] START Diagnosing orion-oreo
[Wed Jan  8 23:16:02 2020] SUCCESS
################################################################################
[Wed Jan  8 23:16:02 2020] START Diagnosing memcheck
[Wed Jan  8 23:16:02 2020] SUCCESS
################################################################################
[Wed Jan  8 23:16:02 2020] START Diagnosing ntp
[Wed Jan  8 23:16:08 2020] SUCCESS
################################################################################
[Wed Jan  8 23:16:08 2020] START Diagnosing trace_vault
[Wed Jan  8 23:16:09 2020] SUCCESS
################################################################################
[Wed Jan  8 23:16:09 2020] START Diagnosing postgres
[Wed Jan  8 23:16:11 2020] SUCCESS
################################################################################
[Wed Jan  8 23:16:11 2020] START Diagnosing disk-health
[Wed Jan  8 23:16:11 2020] SUCCESS
################################################################################
[Wed Jan  8 23:16:11 2020] START Diagnosing falcon
[Wed Jan  8 23:16:12 2020] SUCCESS
################################################################################
[Wed Jan  8 23:16:12 2020] START Diagnosing orion-cgroups
[Wed Jan  8 23:16:12 2020] SUCCESS
################################################################################
[Wed Jan  8 23:16:12 2020] START Diagnosing callosum
/usr/lib/python2.7/site-packages/urllib3/connectionpool.py:852: InsecureRequestWarning: Unverified HTTPS request is being made. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#ssl-warnings
  InsecureRequestWarning)
[Wed Jan  8 23:16:12 2020] SUCCESS
################################################################################
```
Your output may look something like the above. Ensure that all diagnostics show `SUCCESS`.

{% include warning.html content="If <code>tscli cluster check</code> returns an error, it may suggest you run <code>tscli storage gc</code> to resolve the issue. If you run <code>tscli storage gc</code>, note that it restarts your cluster." %}

{: id="cluster-step-3"}
### Step 3: Finalize installation

After the cluster status changes to `READY`, sign in to ThoughtSpot on your browser.
Follow these steps:

1. Start a browser from your computer.
2. Enter your secure IP information on the address line.
    ```
    https://<VM-IP>
    ```
3. If you don't have a security certificate for ThoughtSpot, you must bypass the security warning:
  * Click **Advanced**
  * Click **Proceed**
4. The ThoughtSpot sign-in page appears.
5. In the [ThoughtSpot sign-in window](#ts-login), enter admin credentials, and click **Sign in**.
  ThoughtSpot recommends changing the default admin password.

{: id="ts-login"}
![ThoughtSpot's sign-in window]({{ site.baseurl }}/images/ts-login-page.png "ThoughtSpot's sign-in window")
<!--{% include image.html file="ts-login-page.png" title="ThoughtSpot's sign-in window" alt="Sign in to ThoughtSpot. Enter Username, Password, and click Sign in. You may select the Remember me option." caption="ThoughtSpot's sign-in window" %}-->

## Lean configuration
**(For use with thin provisioning only)** If you have a [small or medium instance type]({{ site.baseurl }}/appliance/cloud.html#use-small-and-medium-instance-types-when-applicable), with less than 100GB of data, advanced lean configuration is required before loading any data into ThoughtSpot. After installing the cluster, contact [ThoughtSpot Support]({{ site.baseurl }}/appliance/contact.html) for assistance with this configuration.

## Related information
Use these references for successful installation and administration of ThoughtSpot:

* [The nodes.config file]({{ site.baseurl }}/appliance/hardware/nodesconfig-example)
* [Parameters of the nodes.config file]({{ site.baseurl }}/appliance/hardware/parameters-nodesconfig.html)
* [Using the tscli cluster create command]({{ site.baseurl }}/appliance/hardware/cluster-create.html)
* [Parameters of the cluster create command]({{ site.baseurl }}/appliance/hardware/parameters-cluster-create.html)
* [Contact Support]({{ site.baseurl }}/appliance/contact.html)
