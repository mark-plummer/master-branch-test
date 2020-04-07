---
title: [RHEL installation prerequisites]
summary: "Prepare the system and ThoughtSpot clusters for installation."
last_updated: 3/20/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
| &#10063; | [1. Set up hosts for the ThoughtSpot cluster](#set-up-hosts) |
| &#10063; | [2. Partition the hosts](#partition-hosts) |
| &#10063; | [3. Install RHEL version 7.7 on all hosts](#install-rhel) |
| &#10063; | [4. Enable the hosts to download RHEL packages](#enable-hosts) |
| &#10063; | [5. Enable an Ansible Control Server](#enable-ansible) |
| &#10063; | [6. Disable SELinux](#disable-selinux) |

{: id="set-up-hosts"}
## Set up hosts for the ThoughtSpot cluster

Set up hosts for the ThoughtSpot cluster on your chosen platform. Please refer to the relevant deployment sections in our documentation for the exact specification for the hosts: CPU, memory, and disks.

- ThoughtSpot-certified hardware appliance manufactured by  [DELL]({{ site.baseurl }}/appliance/hardware/installing-dell.html)
- ThoughtSpot-certified hardware appliance manufactured by [SMC ]({{ site.baseurl }}/appliance/hardware/installing-the-smc.html)
- [Amazon Web Services (AWS) EC2]({{ site.baseurl }}/appliance/aws/configuration-options.html)
- [Google Cloud Platform (GCP)]({{ site.baseurl }}/appliance/gcp/configuration-options.html)
- [VMware]({{ site.baseurl }}/appliance/vmware/vmware-intro.html)

{: id="partition-hosts"}
## Partition the hosts

Ensure that all ThoughtSpot hosts have the following partitions on the root drive.

Note that the size of the root drive on appliances is limited to 200GB; the partition requirements are therefore somewhat different when compared to the other environments.

<table>
<tbody>
<tr>
<th>Platform</th>
<th>Partition</th>
<th>Drive type</th>
<th>Description</th>
<th>Minimum size</th>
</tr>
<tr>
<th rowspan="2">Hosts in AWS, GCP, and VMWare&nbsp;</th>
<td>OS partition</td>
<td>SSD (root drive)</td>
<td>Root partition for OS, <code>/tmp</code></td>
<td>100GB<br />Allocate at least 50GB to <code>/tmp</code></td>
</tr>
<tr>
<td>Export partition</td>
<td>SSD (root drive)&nbsp;</td>
<td>Stores ThoughtSpot objects, hdfs logs, service logs, and so on</td>
<td>200GB</td>
</tr>
<tr>
<th rowspan="2">Hosts on ThoughtSpot-certified hardware appliances</th>
<td>OS partition</td>
<td>SSD (root drive)</td>
<td>Root partition for OS, <code>/tmp</code></td>
<td>80GB<br />Allocate at least 50GB to <code>/tmp</code></td>
</tr>
<tr>
<td>Export partition</td>
<td>SSD (root drive)&nbsp;</td>
<td>Stores ThoughtSpot objects, hdfs logs, service logs, and so on</td>
<td>100GB</td>
</tr>
</tbody>
</table>

{: id="install-rhel"}
## Install RHEL on hosts

ThoughtSpot is certified with RHEL version 7.7; we **do not** support other versions of RHEL, including 8 and 8.1.

{: id="enable-hosts"}
## Enable the hosts to download RHEL packages

Make sure that you can download RHEL packages to all hosts, either from the [official package repositories](#official-repositories), or from a [mirror repository](#mirror-repositories) owned and managed by your organization.

If the cluster is offline, and there is no mirror repository in your organization, please contact ThoughtSpot Support.

{: id="official-repositories"}
**Official package repositories**

If the hosts of your ThoughtSpot cluster can access external repositories, either directly or through a proxy, your cluster is online. You can then proceed to download [Yum](#yum-repositories), [Python](#python-repositories), and [R](#r-repositories) package repositories.

{: id="mirror-repositories"}
**Internal mirror repository**

If the hosts of your ThoughtSpot cluster have access to an internal repository that mirrors the public repositories, copy the [Yum
](#yum-repositories), [Python](#python-repositories), and [R](#r-repositories) package repositories to your hosts.

{: id="repositories"}
**Repositories**

{: id="yum-repositories"}
- **Yum repositories**: you must enable the following Yum repositories in your cluster: `epel`, `nux-desktop`, `pgdg95`, `rhel`, `rhel-optional`, `rhel-extras`.

{: id="python-repositories"}
- **Python repository**: for Python, enable the `PyPI` repository.

{: id="r-repositories"}
- **R repository**: for R, enable the `CRAN` repository.

{: id="enable-ansible"}
## Enable an Ansible Control Server

Configure an Ansible Control Server, on a separate host, to run the Ansible playbook that ThoughtSpot supplies. You must install both `rsync` and Ansible on the Ansible Control Server host.

{: id="disable-selinux"}
## Disable SELinux
We recommend that you disable SELinux if your organization permits it.
