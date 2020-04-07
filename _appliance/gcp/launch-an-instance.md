---
title: [Set up ThoughtSpot in GCP]
summary: Set up your GCP virtual machines.
last_updated: 4/3/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

After you determine your configuration options, set up your virtual machines
(VMs). ThoughtSpot will share the ThoughtSpot base image for booting the VMs and some other aspects of system setup with you on [the GCP platform](https://console.cloud.google.com).

## About the ThoughtSpot and Google Cloud Platform

ThoughtSpot uses a custom image to populate VMs in GCP. To find the ThoughtSpot custom image, refer to step 13 under [create an instance](#create-an-instance).

Ask your ThoughtSpot contact for access to this image. We need the Google account/email ID of the individual who will be signed into your organization's GCP console. We will share ThoughtSpot's GCP project with them so they can use the contained boot disk image to create ThoughtSpot VMs.

This guide explains how to deploy ThoughtSpot on GCP, using ThoughtSpot's CentOS-based image. Starting with version 6.0.4, you can also deploy ThoughtSpot on GCP using Red Hat Enterprise Linux (RHEL), allowing you to run ThoughtSpot on an RHEL 7.7 image that your organization manages internally. To install ThoughtSpot using RHEL, refer to the [RHEL deployment guide]({{ site.baseurl }}/appliance/rhel/rhel.html).

## Overview

Before you can create a ThoughtSpot cluster, you must set up your VMs. Use the Google Compute Engine (GCP) platform to create and run VMs.

The following topics walk you through this process.

## Prerequisites

1. Ensure that your **Network Service Tier** on the [Google Cloud Console](https://console.cloud.google.com/) is set to **Premium** for the best performance of all your VMs.
2. A ThoughtSpot cluster requires 10 Gb/s bandwidth (or better) between any two nodes. You must ensure this *before* creating a new cluster.
3. Download and fill out the ThoughtSpot [site survey]({{ site.baseurl }}/site-survey.pdf){:target="_blank"} to have a quick reference for your networking information. Ask your network administrator if you need help filling out the site survey.

## Setting up your Google Cloud Storage (GCS) bucket

If you are going to deploy your cluster using the GCS-storage option, you must set up that bucket before you set up your cluster. Contact [ThoughtSpot Support]({{ site.baseurl }}/admin/misc/contact.html#) to find out if your specific cluster size will benefit from the GCS storage option. If you are not using GCS, skip this step and [create an instance](#create-an-instance).

1. Sign in to the [Google Cloud Console](https://console.cloud.google.com/).

2. Go to the **Storage** dashboard from the navigation bar on the side of your screen.

3. Click **CREATE BUCKET** on the top menu bar.

4. Enter a name for your bucket, and click **CONTINUE**.

5. For location type, select **Region**.

6. Use the Location drop-down menu to select the region where you are going to set up your instance.

7. Click **CONTINUE**.

6. For default storage class, select **Standard**.

9. Click **CONTINUE**.

7. Under **Access Control**, select **Uniform** to ensure uniform access to all objects in the storage bucket.

10. Click **CONTINUE**.

8. Do not edit the advanced settings.<br>
Leave Encryption set to **Google-managed key** and do not set a retention policy.

12. Click **CREATE**.

When you create your instance, make sure you set Storage to **Read Write** access.

## Create an instance

1. Sign in to the [Google Cloud Console](https://console.cloud.google.com/).

2. Click **Select a Project** from the top bar.

    ![Select a project]({{ site.baseurl }}/images/gcp-selectproj.png "Select a project")

3. Under **Select From**, pick your company's project.

2. Go to the Compute Engine dashboard.

    ![Go to the Compute Engine Dashboard]({{ site.baseurl }}/images/gcp-computeenginedash.png "Go to the Compute Engine Dashboard")

2. Select **VM instances** on the left panel.

3. Click the **+** icon from the top menu bar to create an instance.

3. Provide a name for the instance.

4. Select the region you are creating the instance in.

5. Select the zone you are creating your region in.

5. Under **Machine type**, select **custom**.

6. Select the number of vCPU cores you need.<br>
Refer to [ThoughtSpot GCP instance types]({{ site.baseurl }}/appliance/gcp/configuration-options.html#thoughtspot-gcp-instance-types) to determine the number of vCPU cores your cluster needs.

6. Specify your memory requirements and CPU platform.
Refer to [ThoughtSpot GCP instance types]({{ site.baseurl }}/appliance/gcp/configuration-options.html#thoughtspot-gcp-instance-types) to determine the memory your cluster needs.

    Your configuration may look something like the following, but with your specific information.

    | Setting       | Value                |
    |------------   | -------------------- |
    | Cores         | `64 vCPU`            |
    | Memory        | `416 GB`             |
    | CPU platform  | `Automatic` (or select either one of the preferred CPU platforms, `Intel Skylake` or `Intel Broadwell`, if available.)|

    ![Specify machine configuration]({{ site.baseurl }}/images/gcp-machineconfig.png "Specify machine configuration")

    ![Preferred CPU platforms]({{ site.baseurl }}/images/gcp-3-preferred-CPUs.png "Preferred CPU platforms")

5. Configure the Boot disk.

    a. Scroll down to the **Boot disk** section and click **Change**.

      ![Change boot disk]({{ site.baseurl }}/images/gcp-4-change-boot-disk.png "Change boot disk")

    b. Click **Custom Images** from the options under **Boot disk**.

    c. Select **ThoughtSpot-images** under **Show images from**.

    d. Select one of the ThoughtSpot base images. Under the name of the image, you can see when it was created. ThoughtSpot should have directly sent you an image to use. If so, use that image.

    ![Select the latest ThoughtSpot image]({{ site.baseurl }}/images/gcp-selecttsimage.png "Select the latest ThoughtSpot image")

    Refer to the chart below to find the image you should use, depending on your release number.

    | Release Number | Image Name |
    | --- | --- |
    | 6.0 | thoughtspot-image-20191029-9ff82de0a41-prod |
    | 6.0.1 | thoughtspot-image-20191029-9ff82de0a41-prod |
    | 6.0.2 | thoughtspot-image-20191029-9ff82de0a41-prod |
    | 6.0.3 | thoughtspot-image-20200307-812f10fafca-prod |
    | 6.0.4 | thoughtspot-image-20200307-812f10fafca-prod |


    {% include note.html content="ThoughtSpot updates these base images with patches and enhancements. If more than one image is available, select the latest one by looking at the dates of creation. Each image will work, but we recommend using the latest image because it typically contains the latest security and maintenance patches. Contact ThoughtSpot Support if you are unsure which image to use." %}

    e. Configure the boot disk as follows:

      | Setting         | Value                     |
      |------------     | --------------------      |
      | Image           | `ThoughtSpot`             |
      | Boot disk type  | `Standard persistent disk`|
      | Size (GB)       | `250`                     |

    f. Click **Select** to save the boot disk configuration.

6.  Back on the main configuration page, click to expand the advanced configuration options
    (**Management, security, disks, networking, sole tenancy**).

    ![Advanced configuration options]({{ site.baseurl }}/images/gcp-6-save-boot-disk-expand-mgmt.png "Advanced configuration options")

7.  Attach two 1 TB SSD drives for data storage. Refer to [SSD-only persistent storage]({{ site.baseurl }}/appliance/gcp/configuration-options.html#vms-with-persistent-disk-only-storage). If you are using GCS, attach only 1 SSD drive, with 500 GB instead of 1 TB. Refer to [GCS and SSD persistent storage]({{ site.baseurl }}/appliance/gcp/configuration-options.html#vms-with-persistent-disk-and-google-cloud-storage).

    a. Click the **Disks** tab, and click **Add new disk**.

      ![Add new disk]({{ site.baseurl }}/images/gcp-7-advanced-disk-config.png "Add new disk")

      You can select or unselect the **Deletion rule**, depending on your preferences.

    b. Configure the following settings for each disk. Refer to [ThoughtSpot GCP instance types]({{ site.baseurl }}/appliance/gcp/configuration-options.html#vms-with-persistent-disk-and-google-cloud-storage) to determine the size in GB when you have GCS. Ensure the disks have read/write access.

      | Setting      | Value                  |
      |------------  | ---------------------- |
      | Type         | `SSD persistent disk`  |
      | Source type  | `Blank disk`           |
      | Size (GB)    | `1024`                 |

      Under **Deletion rule**, select either **keep disk** or **delete disk**, depending on your preference.

      ![Configure your disk]({{ site.baseurl }}/images/gcp-8-advanced-blank-disk-config.png "Configure your disk")

8. (For use with GCS only) In the Identity and API access section, make sure Service account is set to **Compute Engine default service account**. Under Access scopes, select **Set access for each API**.

9. (For use with GCS only) After you click **Set access for each API**, scroll down to the **Storage** dropdown menu in the Identity and API access section. Set it to one of the following options:
   - To use Google Cloud Storage (GCS) as persistent storage for your instance, select **Read Write**.
   - To only use GCS to load data into ThoughtSpot, select **Read Only**.

10. Under **Networking**, customize the network settings as needed.  Use your default VPC settings, if you know them. Ask your network administrator if you do not know your default VPC settings.

    Update the network interface with your specific information or create a new one.

    ![Set your network interface]({{ site.baseurl }}/images/gcp-setnetworkinterface.png "Set your network interface")

    | **1** | Add an existing VPC network, or create a new one by clicking **VPC network** from the main menu. Ensure that this network has a **firewall rule** attached, with the minimum ports required for ThoughtSpot operation open. Refer to the [minimum port requirements](#port-requirements). See Google's [using firewalls](https://cloud.google.com/vpc/docs/using-firewalls){:target="_blank"} and [using VPCs](https://cloud.google.com/vpc/docs/using-vpc){:target="_blank"} documentation for assistance creating a firewall rule and a VPC network. |
    | **2** | Set the external IP as either ephemeral or static, depending on your preference. |
    | **3** | Ensure that **network service tier** is set to **premium**. |

11. Repeat these steps to create the necessary number of VMs for your cluster.

{: id="port-requirements"}
### Minimum required ports
Open the following ports between the User/ETL server and ThoughtSpot nodes. This ensures that the ThoughtSpot processes do not get blocked. Refer to [network policies]({{ site.baseurl }}/admin/setup/firewall-ports.html#required-ports-for-cluster-communication) for more information on what ports to open for intracluster operation, so that your clusters can communicate.

   The minimum ports needed are:

   | Port    | Protocol   | Service                       |
   | ------- | ---------- | ----------------------------  |
   | 22    | SSH          |  Secure Shell access          |
   | 443   | HTTPS        |  Secure Web access            |
   | 12345 | TCP          |  ODBC and JDBC drivers access |

## Prepare the VMs

Before you can install your ThoughtSpot cluster, an administrator must log in to
each VM through SSH as user "admin", and complete the following preparation steps:

1. Open a terminal application on your machine and ssh into one of your VMs.
```
    ssh admin@<VM-IP>
```
1. Run `sudo /usr/local/scaligent/bin/prepare_disks.sh`.
```
    $ sudo /usr/local/scaligent/bin/prepare_disks.sh
```
2. Configure the VM based on the site-survey.
4. Repeat this process for each of your VMs.

## Install cluster
To install your ThoughtSpot cluster, complete the installation process outlined in [Installing ThoughtSpot in GCP]({{ site.baseurl }}/appliance/gcp/installing-gcp.html).

## Related information

[Connecting to Google Cloud Storage buckets](https://cloud.google.com/compute/docs/disks/gcs-buckets){:target="_blank"}  
[Loading data from a GCP GCS bucket]({{ site.baseurl }}/admin/loading/use-data-importer.html#loading-data-from-a-gcp-gcs-bucket)
