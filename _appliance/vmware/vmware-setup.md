---
title: [Set up ThoughtSpot in VMware]
summary: Learn how to install a ThoughtSpot cluster in a VMware environment.
last_updated: 3/3/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
This page explains how to install a ThoughtSpot cluster in a VMware VSphere Hypervisor (ESXi) 6.5 environment.

{% include note.html content="Older versions of ESXi aren't supported due to hardware/driver incompatibility issues." %}

For each hardware node, you must:

* Complete the prerequisites
* Use the ThoughtSpot Open Virtualization Format (OVF) file to create
a virtual machine (VM)
* Add hard disks to the VM

This guide explains how to deploy ThoughtSpot on VMware, using ThoughtSpot's CentOS-based image. Starting with version 6.0.4, you can also deploy ThoughtSpot on VMware using Red Hat Enterprise Linux (RHEL), allowing you to run ThoughtSpot on an RHEL 7.7 image that your organization manages internally. To install ThoughtSpot using RHEL, refer to the [RHEL deployment guide]({{ site.baseurl }}/appliance/rhel/rhel.html).

## Prerequisites

This installation process assumes you have already acquired your host machines.
You can install on a cluster with any number of nodes. A one node cluster is suitable
for a sandbox environment but is insufficient for a production environment. You need at least three nodes for high availability (HA), but there is no limit on the number of nodes.

1. Make sure you have installed the Hypervisor on each of your nodes.

   The VM template, by default, captures a 72-core configuration. If your
   physical host has more than 72 cores, you may want to edit VM to have (`n-2`)
   cores (for a physical host with n cores) to fully take advantage of computing
   power of the physical host. Extra cores help performance.

   You should aim to allocate 490 GB or more RAM.

2. Create datastores for all solid-state drive (SSD) and hard drive devices.

3. Download and fill out the ThoughtSpot [site survey]({{ site.baseurl }}/site-survey.pdf){:target="_blank"} to have a quick reference for any networking information you may need to fill out as you install ThoughtSpot. Ask your network administrator if you need help filling out the site survey.

## Use the OVF to Create a VM

1. **[Download](https://thoughtspot.egnyte.com/dl/iWvEqo76Pr/){:target="_blank"}** the `ThoughtSpot OVF` to a location on an accessible disk.

2. Log in to the ESXi web portal.

    ![]({{ site.baseurl }}/images/vmware-login.png "VMWare Login")

2. Select **Virtual Machines > Create/Register VM**.

   The system displays the dialog for selecting an OVF template.

   ![]({{ site.baseurl }}/images/vmware-ovf.png "ThoughtSpot OVF")

3. Choose the OVF template and click **Next**.

   The system prompts you to select a storage.

4. Choose the SSD as the destination and click **Next**.

   The system displays the **Deployment Options** dialog.

5. Enter the options and click **Next**.

    | Setting                    | Value                                             |
    |----------------------------|---------------------------------------------------|
    | **Network mappings**       | Select the correct network for your installation. |
    | **Disk provisioning**      | Choose Thin.                                      |
    | **Power on automatically** | Check this box.                                   |

6. Review your selection and click **Finish**.

   ![]({{ site.baseurl }}/images/vmware-complete.png "Complete")

7. Wait for the template to be loaded.

   Depending on your network speed, loading can take several minutes.

   ![]({{ site.baseurl }}/images/vmware-loading.png "OVF Loading")

8. Make sure that VM is powered off.


## Add hard disks to the VM

| Use Case      | HDFS Disk Requirements |
| --------      | ---------------------- |
| POC           | 2 x 1 TB on HDD        |
| Production    | 3 x 2 TB on HDD        |

For a proof of concept (POC), follow these steps to create two 1TB HDFS disks on
HDD storage, as shown here (2 x 1TB).

For production deployments, ThoughtSpot requires you to have three 2TB HDFS
disks on HDD (3 x 2TB). For this use case, follow these same steps to create the
additional, larger capacity disks.

1. Edit the VM you just created.

   ![]({{ site.baseurl }}/images/vmware-add-disk0.png "Select disk")

2. Select **Add hard disk > New hard disk**.

   ![]({{ site.baseurl }}/images/vmware-adddisk1.png "New hard disk")

   The new disk appears as a new row under the only existing SSD row.

3. Click the **New Hard disk** to expand the detailed configuration options.
4. For a proof of concept, set the options as follows. (For production deployments, set the size to 2TB.)

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <tr>
     <th>Setting</th>
     <th>Value</th>
    </tr>
    <tr>
     <td>size</td>
     <td>1 TB</td>
    </tr>
    <tr>
     <th>Location</th>
     <td>
     Use the <strong>Browse</strong> button to select the hard disk store.
     <br>
     <img src="{{ "/images/vmware-adddisk3.png "| prepend: site.baseurl  }}" />
     </td>
    </tr>
    <tr>
     <th>Thin provisioned</th>
     <td>Check this box.</td>
    </tr>
    </table>

    You should see something similar to the following:

   ![]({{ site.baseurl }}/images/vmware-adddisk2-1TB.png "New hard disk")

5. Save your changes.
6. Repeat steps 1-5 to create more hard disks.
7. Power on the VM
8. After the VM is online, run the following command to prepare the HDFS disks:

    ```
    $ sudo /usr/local/scaligent/bin/prepare_disks.sh
    ```

## Next steps

There is no network at this point on your VMs. As a prerequisite:

1. Verify that Network Adapter type is set to VMware vmxnet3 (Recommended).
2. Verify that all ESXi hosts in your VMware farm for ThoughtSpot have been trunked to the VLAN assigned to your ThoughtSpot VMs.
3. Verify that the console of all ThoughtSpot VMs is accessible in VMware vCenter Server.
