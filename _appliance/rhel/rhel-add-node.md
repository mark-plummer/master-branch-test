---
title: [Add a node to a ThoughtSpot cluster on RHEL]
summary: "You can easily configure an additional node for a ThoughtSpot cluster on RHEL."
last_updated: 3/20/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
To add a new node to a ThoughtSpot cluster deployed through RHEL, you must first make this new node ready for ThoughtSpot.

{: id="prerequisites"}
## Prerequisites

- The new node must be available.
- The new node must be of the same deployment type as the existing cluster.
- Your organization's RHEL base image must be on the new node.

{: id="configure-ansible"}
## Configure the Ansible Playbook

Follow the general steps for configuring the Ansible Playbook, either on [online clusters]({{ site.baseurl }}/appliance/rhel/rhel-install-online.html#configure-ansible), or on [offline clusters]({{ site.baseurl }}/appliance/rhel/rhel-install-offline.html#configure-ansible).

1. Save a new copy of the `hosts.yaml` file, as `new-host.yaml`.
2. In the `hosts` parameter, ***only*** specify the `IP` or `hostname` of the new node.
3. Do not change the rest of the file; the Ansible configuration must be identical to the existing cluster.

{: id="run-ansible"}
## Run the Ansible Playbook

Run the Ansible Playbook from your local machine by entering the following command:

```
ansible-playbook -i new-host.yaml ts-rhel.yaml
```

As the Ansible Playbook runs, it will perform the same tasks on the new node that it completed during the initial cluster set-up, but only for the new node. See [Run Ansible]({{ site.baseurl }}/appliance/rhel/rhel-online.html#run-ansible}). It will install all RPM [RPM packages]({{ site.baseurl }}/appliance/rhel/rhel-packages.html), configure the local user accounts for ThoughtSpot administration, install the ThoughtSpot CLI, and configure the node (create any necessary partitions, formatting the data disks, and running the `prepare disks` command).

After the Ansible Playbook finishes, your new host is ready for installing the ThoughtSpot application.

{: id="install-thoughtspot"}
## Install the ThoughtSpot application on the new node

Follow these general steps to install ThoughtSpot on the new node:

1. Download the release artifact from the ThoughtSpot file sharing system, or get it from your organization's .
2. Upload the release artifact to the node.
3. Run the `tscli cluster create` command. This script prompts you for user input.

4. Check the cluster health by running health checks and logging into the application.
Refer to the ThoughtSpot documentation for the detailed steps to install ThoughtSpot for each deployment platform:

- [Hardware appliance]({{ site.baseurl }}/appliance/hardware/inthebox.html)
- [Amazon Web Services (AWS) EC2]({{ site.baseurl }}/appliance/aws/configuration-options.html)
- [Microsoft Azure]({{ site.baseurl }}/appliance/azure/configuration-options.html)
- [Google Cloud Platform (GCP)]({{ site.baseurl }}/appliance/gcp/configuration-options.html)
- [VMware]({{ site.baseurl }}/appliance/vmware/vmware-intro.html)

Follow these general steps to install ThoughtSpot on the prepared hosts:

1. Download the release artifact from the ThoughtSpot file sharing system.

2. Upload the release artifact to the first host.

3. Run the `tscli cluster create` command. This script prompts you for user input.

4. Check the cluster health by running health checks and logging into the application.
