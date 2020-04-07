---
title: [Install ThoughtSpot clusters in GCP]
last_updated: [2/27/2020]
summary: "Learn how to install ThoughtSpot clusters in GCP."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

## Prerequisites
Before you can install your ThoughtSpot clusters in GCP, complete these prerequisites.
1. **Review configuration options** Refer to [GCP configuration options]({{ site.baseurl }}/appliance/gcp/configuration-options.html) for detailed instance specs.
2. **Create the instance** Refer to [Set up ThoughtSpot in GCP]({{ site.baseurl }}/appliance/gcp/launch-an-instance.html) to create and launch your instance.
3. **Review required ports** Refer to [Network Policies]({{ site.baseurl }}/appliance/firewall-ports.html) to view the required ports for successful operation of ThoughtSpot.
4. **Configure nodes** Refer to [Configure ThoughtSpot nodes in GCP]({{ site.baseurl }}/appliance/gcp/installing-gcp.html) to configure your nodes.

{: id="cluster-install"}
## Install ThoughtSpot Software
Install the cluster using the ThoughtSpot software release bundle. The estimated installation time is one hour. Follow the steps in this checklist.

| &#10063; | [Step 1: Run the installer](#cluster-step-1) |
| &#10063; | [Step 2: Check cluster health](#cluster-step-2) |
| &#10063; | [Step 3: Finalize installation](#cluster-step-3) |

Refer to your welcome letter from ThoughtSpot to find the link to download the release bundle. If you do not have a link, open a support ticket at [ThoughtSpot Support](https://support.thoughtspot.com) to request access to the release bundle.

{: id="cluster-step-1"}
### Step 1: Run the installer
1. Copy the downloaded release bundle to `/export/sdc1/TS_TASKS/install` using the following command:
```
    $ scp <release-number>.tar.gz admin@<hostname>:/export/sdc1/TS_TASKS/install/<file-name>
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
* `release-location` is the location path of the release bundle on your local machine. For example, `/export/sdc1/TS_TASKS/install/6.0.tar.gz`.

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
If you are using a gcs bucket for object storage, include the flag `--enable_cloud_storage=gcs`.
```
    $ tscli cluster create <release-number>.tar.gz --enable_cloud_storage=gcs
```

{% include content/install/cluster-steps1through3.md %}

## Lean configuration
**(For use with thin provisioning only)** If you have a [small or medium instance type]({{ site.baseurl }}/appliance/cloud.html#use-small-and-medium-instance-types-when-applicable), with less than 100GB of data, advanced lean configuration is required before loading any data into ThoughtSpot. After installing the cluster, contact [ThoughtSpot Support]({{ site.baseurl }}/appliance/contact.html) for assistance with this configuration.

## Related information
Use these references for successful installation and administration of ThoughtSpot:

* [The nodes.config file]({{ site.baseurl }}/appliance/hardware/nodesconfig-example)
* [Parameters of the nodes.config file]({{ site.baseurl }}/appliance/hardware/parameters-nodesconfig.html)
* [Using the tscli cluster create command]({{ site.baseurl }}/appliance/hardware/cluster-create.html)
* [Parameters of the cluster create command]({{ site.baseurl }}/appliance/hardware/parameters-cluster-create.html)
* [Contact Support]({{ site.baseurl }}/appliance/contact.html)
