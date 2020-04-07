---
title: [Install Cluster]
summary: "Install your ThoughtSpot cluster(s) on your Dell appliance."
last_updated: 3/3/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
{: id="install-cluster"}
Install the cluster using the ThoughtSpot software release bundle. Installation takes approximately one hour. Make sure you can connect to ThoughtSpot remotely. If you can, you can run the installer on your local computer.

Refer to your welcome letter from ThoughtSpot to find the link to download the release bundle. If you do not have a link to download the release bundle, open a support ticket at [ThoughtSpot Support]({{ site.baseurl }}/appliance/contact.html) to access the release bundle.

Follow the steps in this checklist to install your cluster.

| &#10063; | [Step 1: Run the installer](#install-step-1) |
| &#10063; | [Step 2: Check cluster health](#install-step-2) |
| &#10063; | [Step 3: Finalize installation](#install-step-3) |

{: id="install-step-1"}
## Step 1: Run the installer
1. Copy the downloaded release bundle to `/export/sdb1/TS_TASKS/install`:<br>
  Run `scp <release-number> admin@<hostname>:/export/sdb1/TS_TASKS/install/<file-name>`. Note the following parameters:
* `release-number` is the release number of your ThoughtSpot installation, such as `6.0`, `5.3`, `5.3.1`, and so on.
* `hostname` is your network hostname. Ask your network administrator if you do not know your hostname.
* `file-name` is the name of the tarball file on your local computer.
```
  $ scp <release-number>.tar.gz admin@<hostname>:/export/sdb1/TS_TASKS/install/<file-name>
```

    {% include note.html content="You can use another secure copy method, if you prefer a method other than the <code>scp</code> command." %}

2. Alternatively, use `tscli fileserver download-release` to download the release bundle.<br>
You must [configure the fileserver]({{ site.baseurl }}/reference/tscli-command-ref.html#tscli-fileserver) by running `tscli fileserver configure` before you can download the release.<br>
    ```
    $ tscli fileserver download-release <release-number> --user <username> --out <release-location>
    ```
Note the following parameters:
* `release-number` is the release number of your ThoughtSpot instance, such as 5.3, 5.3.1, 6.0, and so on.
* `username` is the username for the fileserver that you set up earlier, when configuring the fileserver.
* `release-location` is the location path of the release bundle on your local machine. For example, `/export/sdb1/TS_TASKS/install/6.0.tar.gz`.

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

2. Create the cluster using `tscli cluster create <release-number>`.
```
    $ tscli cluster create <release.number>.tar.gz
```
3. Edit the output using your specific cluster information. For more information on this process, refer to [Using the tscli cluster create command]({{ site.baseurl }}/appliance/hardware/cluster-create.html) and [Parameters of the `cluster create` command]({{ site.baseurl }}/appliance/hardware/parameters-cluster-create.html).

The cluster installer automatically reboots all the nodes after the install. Wait at least 15 minutes for the installation process to complete. The system is rebooting, which takes a few minutes. Log in to any node to check the current cluster status, using the command `tscli cluster status`.

{: id="install-step-2"}
## Step 2: Check cluster health
After you install the cluster, check its status using the `tscli cluster status` command.

Your output may look something like the following:
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

{: id="install-step-3"}
## Step 3: Finalize installation
After the cluster status changes to `READY`, sign in to the ThoughtSpot application on your browser.<br>
Follow these steps:
1. Start a browser from your computer.
2. Enter your secure IP information on the address line.
    ```
    https://<IP-address>
    ```
3. If you don't have a security certificate for ThoughtSpot, you must bypass the security warning to proceed:
  * Click **Advanced**
  * Click **Proceed**
4. The ThoughtSpot login page appears.
5. In the [ThoughtSpot sign-in window]({{ site.baseurl }}/appliance/hardware/install-cluster-dell.html#ts-login), enter admin credentials, and click **Sign in**.
  ThoughtSpot recommends changing the default admin password.

{: id="ts-login"}
![ThoughtSpot's sign-in window]({{ site.baseurl }}/images/ts-login-page.png "ThoughtSpot's sign-in window")
<!--{% include image.html file="ts-login-page.png" title="ThoughtSpot's sign-in window" alt="Log in to ThoughtSpot. Enter Username, Password, and click Sign in. You may select Remember me option." caption="ThoughtSpot's sign-in window" %}-->

## Lean configuration
**(For use with thin provisioning only)** If you have a [small or medium instance type]({{ site.baseurl }}/appliance/cloud.html#use-small-and-medium-instance-types-when-applicable), with less than 100GB of data, advanced lean configuration is required before loading any data into ThoughtSpot. After installing the cluster, contact [ThoughtSpot Support]({{ site.baseurl }}/appliance/contact.html) for assistance with this configuration.

{% include content/install/install-cluster-error-recovery.md %}
