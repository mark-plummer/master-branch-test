---
title: [Configure ThoughtSpot nodes in VMware]
last_updated: 3/3/2020
summary: "Prepare to install your ThoughtSpot cluster by configuring nodes."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

Before you can install a ThoughtSpot cluster in VMware, you must configure your nodes.

{: id="installation-prerequisites"}
## Installation Prerequisites
Ensure the successful creation of the virtual machines (VMs) before you install the ThoughtSpot cluster in VMware.

1. **Download the OVF** Download the [Open Virtualization Format](https://thoughtspot.egnyte.com/dl/iWvEqo76Pr/) (OVF) file.
1. **Review configuration overview** Refer to [VMware configuration overview]({{ site.baseurl }}/appliance/vmware/vmware-intro.html) for detailed instance specs.
2. **Create the instance** Refer to [Set up VMware for ThoughtSpot]({{ site.baseurl }}/appliance/vmware/vmware-setup.html) to create and launch your instance.
3. **Review required ports** Refer to [Network Policies]({{ site.baseurl }}/appliance/firewall-ports.html) to view the required ports for successful operation of ThoughtSpot.

{: id="configure-nodes"}
## Configure Nodes
After creating the instance, you must configure the nodes. Follow the steps in this checklist.

| &#10063; | [Step 1: Log in to your cluster](#node-step-1) |
| &#10063; | [Step 2: Get a template for network configuration](#node-step-2) |
| &#10063; | [Step 3: Prepare node configuration](#node-step-3) |
| &#10063; | [Step 4: Configure the nodes](#node-step-4) |
| &#10063; | [Step 5: Confirm node configuration](#node-step-5) |

{% include content/install/configure-nodes-steps1through5.md %}

## Install ThoughtSpot software
Next, [install your ThoughtSpot clusters]({{ site.baseurl }}/appliance/vmware/vmware-cluster-install.html).

{% include content/install/install-cluster-error-recovery.md %}

## Related information
Use these references for successful installation and administration of ThoughtSpot.

* [the nodes.config file]({{ site.baseurl }}/appliance/hardware/nodesconfig-example)
* [Parameters of the nodes.config file]({{ site.baseurl }}/appliance/hardware/parameters-nodesconfig.html)
* [Using the tscli cluster create command]({{ site.baseurl }}/appliance/hardware/cluster-create.html)
* [Parameters of the `cluster create` command]({{ site.baseurl }}/appliance/hardware/parameters-cluster-create.html)
* [ThoughtSpot Documentation](https://docs.thoughtspot.com)
* [Contact Support]({{ site.baseurl }}/appliance/contact.html)
