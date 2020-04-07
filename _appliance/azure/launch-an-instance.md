---
title: [Set up ThoughtSpot in Azure]
last_updated: 4/3/2020
summary: "After you determine your configuration options, you must set up your virtual
machines using a ThoughtSpot image for Azure."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

## About the ThoughtSpot image

To provision ThoughtSpot in the Azure portal, access the ThoughtSpot Virtual Machine in the Azure Marketplace.

The ThoughtSpot Virtual Machine comes provisioned with the custom ThoughtSpot
image to make hosting simple. A virtual machine is a preconfigured template that
provides the information required to launch an instance of ThoughtSpot. It includes a root disk for the instance, which contains an operating system, application server, and other necessary software.

The ThoughtSpot Virtual Machine has the ThoughtSpot software installed and
configured, on a CentOS-based image. Check with your ThoughtSpot contact to
learn about the latest version of the ThoughtSpot Virtual Machine.

Due to security restrictions, the ThoughtSpot Virtual Machine does not have default passwords for the administrator users. When you are ready to obtain the password, contact
[ThoughtSpot Support]({{ site.baseurl }}/appliance/contact.html).

This guide explains how to deploy ThoughtSpot on Microsoft Azure, using ThoughtSpot's CentOS-based image. Starting with version 6.0.4, you can also deploy ThoughtSpot on Azure using Red Hat Enterprise Linux (RHEL), allowing you to run ThoughtSpot on an RHEL 7.7 image that your organization manages internally. To install ThoughtSpot using RHEL, refer to the [RHEL deployment guide]({{ site.baseurl }}/appliance/rhel/rhel.html).

## Set up ThoughtSpot in Azure

Follow these steps to provision and set up the VMs and launch ThoughtSpot.

### Prerequisites

Complete these steps before launching your ThoughtSpot Virtual Machine:

1. Obtain an Azure login account.
2. Set up usage payment details with Microsoft Azure.
3. Find your company's [Resource Group](https://portal.azure.com/#blade/HubsExtension/BrowseResourceGroups). (optional--you can also create one while creating your virtual machines.)
4. Download and fill out the ThoughtSpot [site survey]({{ site.baseurl }}/site-survey.pdf){:target="_blank"} to have a quick reference for any networking information you may need to fill out. Ask your network administrator if you need help filling out the site survey.

{: id="create-instance"}
### Create an instance

Create your virtual machines based on the [ThoughtSpot Virtual Machine](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/thoughtspot-inc.thoughtspotvirtualmachine).

1. Log in to the Azure portal.

    In a browser, go to [https://portal.azure.com/#home](https://portal.azure.com/#home), and log in to your Azure account.

2. On the Azure portal homepage, hover over **Virtual machines**, and click **Create**.

    ![Create a virtual machine]({{ site.baseurl }}/images/azure-createvm.png "Create a virtual machine")
    <!--{% include image.html file="azure-createvm.png" title="Create a virtual machine" alt="Hover over Virtual machines and click create." caption="Create a virtual machine" %}-->

3. Specify information under **Basics**.<br>

    ![Specify information under Basics]({{ site.baseurl }}/images/azure-basicsettings.png "Specify information under Basics")
    <!--{% include image.html file="azure-basicsettings.png" title="Specify information under Basics" alt="In the Basics menu, specify your subscription type, resource group, VM name, region, image, size, authentication, and port rules." caption="Specify information under Basics" %}-->

    | **1** | Choose a subscription type from the dropdown menu. |
    | **2** | If your company already has a resource group, *select existing*. If not, *create new*. |
    | **3** | Specify a name for your virtual machine. |
    | **4** | Specify the region in which you are creating the VM. |
    | **5** | Click **Browse all public and private images**, and search for the ThoughtSpot image. Click on it. |
    | **6** | Refer to [Azure configuration options]({{ site.baseurl }}/appliance/azure/configuration-options.html) to choose a size for your VM that works for your cluster needs. |
    | **7** | Select **SSH public key** and specify a username. |
    | **8** | Enter your SSH public key. [Contact ThoughtSpot support]({{ site.baseurl }}/appliance/contact.html) to obtain a public key, if you do not have one. Note that this SSH public key is different from the SSH private key you use later, to ssh into your VM from the command line. |
    | **9** | Choose **allow selected ports**. |
    | **10** | Open the necessary Inbound and Outbound ports to ensure that the ThoughtSpot processes do not get blocked. See the [minimum port requirements](#port-requirements). |

2. Specify information under **Disks**.

    ![Specify disk information]({{ site.baseurl }}/images/azure-disks.png "Specify disk information")
    <!--{% include image.html file="azure-disks.png" title="Specify disk information" alt="In the Disks menu, choose a disk type, add data disks, and select managed disks" caption="Specify disk information" %}-->

    | **1** | Choose a disk type from the dropdown menu. ThoughtSpot recommends the Premium SSD disks. |
    | **2** | Click **Create and attach a new disk**. Add two data disks. Refer to [Azure configuration options]({{ site.baseurl }}/appliance/azure/configuration-options.html#thoughtspot-azure-instance-types.html) to see what size they should be. |
    | **3** | Under **Advanced**, click **yes** to **use managed disks**. |

    {% include tip.html content=" The new Standard SSD disk types are only available for particular regions. Make sure this disk type is supported in the region you chose for your VM before selecting it." %}

   See [Standard SSD Disks for Virtual Machine workloads](https://azure.microsoft.com/en-us/blog/preview-standard-ssd-disks-for-azure-virtual-machine-workloads/) for more on SSD disks. ThoughtSpot recommends the Premium SSD disks.

4. Specify information under **Networking**.

    ![Specify networking information]({{ site.baseurl }}/images/azure-networking.png "Specify networking information")
    <!--{% include image.html file="azure-networking.png" title="Specify networking information" alt="Specify your virtual network, and set inbound and outbound ports, if you haven't already" caption="Specify networking information" %}-->

    | **1** | Find your company's virtual network and select it, or **create new**. |
    | **2** | Find your company's public IP, or **create new**. |
    | **3** | Select **Advanced** for *NIC network security group*. |
    | **4** | After you select **Advanced**, the **Configure network security group** option appears. Find your company's security group, or **create new**. When creating your security group, ensure that the required ports are open. Refer to the [minimum port requirements](#port-requirements). |

5. Under **Management**, configure your monitoring and management preferences. If you have no preferences, you can leave them at their default settings.

6. Under **Advanced**, configure your advanced settings preferences. If you have no preferences, you can leave them at their default settings.

7. Under **Tags**, tag your virtual machine with a human-readable string to help you identify it.

8. Click **Review + create** in the bottom left corner of your screen.

9. Review your changes, and click **create**. Azure does the final validation check.

{: id="port-requirements"}
### Minimum required ports
Open the following ports between the User/ETL server and ThoughtSpot nodes. This ensures that the ThoughtSpot processes do not get blocked.

   The minimum ports needed are:

   | Port    | Protocol   | Service                       |
   | ------- | ---------- | ----------------------------  |
   | 22    | SSH          |  Secure Shell access          |
   | 443   | HTTPS        |  Secure Web access            |
   | 12345 | TCP          |  ODBC and JDBC drivers access |

   {% include note.html content="Nodes purchased from Azure must be reachable to each other so that they can communicate and form a distributed environment. ThoughtSpot requires that these ports be accessible between nodes within a cluster.  Use your discretion about whether to restrict public access or not for all nodes and all ports." %}

   Refer to [network policies]({{ site.baseurl }}/appliance/firewall-ports.html) for more information.

### Prepare for starting up ThoughtSpot

_Prerequisite_: To log in to the VM, you need the private key that is available in the image. You can obtain this from your ThoughtSpot contact.

1. Obtain the VM’s public and private IP addresses.

   - To see the public IP, click the VM name link. This will show the public IP of the VM.
   - To see the private IP, select **more services** from the Microsoft Azure homepage. Select **Networking** from the list on the left side of the screen.

2. In a terminal application, connect to the VM through SSH. When prompted, enter the private key provided for the admin user.

   - You must file a support ticket to obtain this private key; it is necessary for the first login.
   - This key is different from the credentials, or the public keys supplied in earlier steps, which do not work in this context.
```
   $ ssh admin@<VM-IP>
```   

3. Update the password for both the `admin` and the `thoughtspot` users.<br>
  The command prompts you to type in a new password, and then to confirm the password.

   ```
   $ sudo passwd admin
   Changing password for user admin
   $ sudo passwd thoughtspot
   Changing password for user thoughtspot
   ```
   {% include warning.html content="If you do not change the password, you cannot log back into your Azure VMs. Your private key does not work after initial installation." %}

4. Update the file `/etc/hosts` with all the node IP addresses for the other VMs
that will be part of the ThoughtSpot cluster.

### Verify storage disks

Verify the existence of your data disks, created in Step 4 of [create an instance](#create-instance), by issuing `lsblk` in your terminal application:

   ```
   $ lsblk
   ```

   Your result may look something like the following:

   ```
   NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
   fd0       2:0    1    4K  0 disk
   sda       8:0    0  200G  0 disk
   ├─sda1    8:1    0    1G  0 part /mntboot
   ├─sda2    8:2    0   20G  0 part /
   ├─sda3    8:3    0   20G  0 part /update
   └─sda4    8:4    0  159G  0 part /export
   sdb       8:16   0    1T  0 disk
   └─sb1     8:17   0    1T  0 part /mnt/resource
   sdc       8:32   0    1T  0 disk
   sdd       8:48   0    1T  0 disk
   sr0      11:0    1  628K  0 rom
   ```

7. Unmount the temporary disk by issuing the following command:

   ```
   $ sudo umount /mnt/resource
   ```

   {% include warning.html content="The <code>/mnt/resource</code> disk, which is mounted on the <code>/dev/sdb</code> disk, is temporary. Any data on it will be wiped if the VM is shut down. You must unmount the <code>/mnt/resource</code> disk." %}

8. Prepare the disks /dev/sdc and /dev/sdd for ThoughtSpot by issuing the following command:

    {% include warning.html content="Do not use the disk <code>/dev/sdb</code>. Any data on it will be wiped if the VM is shut down." %}

    ```
    $ sudo /usr/local/scaligent/bin/prepare_disks.sh /dev/sdc /dev/sdd
    ```

9. Check the disks' status by issuing the following command:

   ```
   $ df -h
   ```

10. Repeat the steps in this section for each node in your cluster.

### Create network support settings

{% include tip.html content="All changes in this section must be re-applied each
time after a cluster is created or updated. If these changes are not present, a
reboot of the VMs will not have network access. So when updating these files,
keep a backup to copy after any subsequent cluster creation or update." %}

1. SSH into one of your VMs.
```
    ssh admin@<VM-IP>
```
1. Update the VM's hostname:

   ```
   $ sudo hostnamectl set-hostname <HOSTNAME>
   ```

   If you are using a static name, you can issue:

   ```
   sudo hostnamectl set-hostname <HOSTNAME> --static
   ```

2. Update `/etc/sysconfig/network-scripts/ifcfg-eth0` with the IP and hostname:

   ```
   $ sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0

   DEVICE=eth0 ONBOOT=yes BOOTPROTO=dhcp HWADDR=<Add eth0 MAC> TYPE=Ethernet USERCTL=no PEERDNS=yes IPV6INIT=no
   ```

3. Modify permissions for `/etc/sysconfig/network-scripts/ifcfg-eth0`. This command allows the root user to retain read/write permissions, and grants read-only permissions to other users.
    ```
    $ sudo chmod 644 /etc/sysconfig/network-scripts/ifcfg-eth0
    ```
4. Repeat this process (steps 1 through 4) for each node.
