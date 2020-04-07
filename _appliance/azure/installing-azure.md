---
title: [Configure ThoughtSpot nodes in Azure]
last_updated: [2/27/2020]
summary: "Prepare to install your ThoughtSpot cluster by configuring nodes."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Before you can install a ThoughtSpot cluster in Azure, you must configure your nodes.

{: id="installation-prerequisites"}
## Installation Prerequisites
Ensure the successful creation of the virtual machines (VMs) before you install the ThoughtSpot cluster in Azure.

1. **Review configuration options** Refer to [Azure configuration options]({{ site.baseurl }}/appliance/azure/configuration-options.html) for detailed instance specs.
2. **Create the instance** Refer to [Set up Azure for ThoughtSpot]({{ site.baseurl }}/appliance/azure/launch-an-instance.html) to create and launch your instance.
3. **Review required ports** Refer to [Network Policies]({{ site.baseurl }}/appliance/firewall-ports.html) to view the required ports for successful operation of ThoughtSpot.

{: id="configure-nodes"}
## Configure Nodes
After creating the instance, you must configure the nodes. Follow the steps in this checklist.

| &#10063; | [Step 1: Log in to your cluster](#node-step-1) |
| &#10063; | [Step 2: Get a template for network configuration](#node-step-2) |
| &#10063; | [Step 3: Prepare node configuration](#node-step-3) |
| &#10063; | [Step 4: Configure the nodes](#node-step-4) |
| &#10063; | [Step 5: Confirm node configuration](#node-step-5) |

{: id="node-step-1"}
### Step 1: Log in to your cluster
Use Terminal on a Mac or a terminal emulator on Windows to log in to your cluster. Log in using the ssh private key provided by ThoughtSpot.<br>
If you do not have a private key, contact [ThoughtSpot Support]({{ site.baseurl }}/appliance/contact.html) by email or through the support portal.

To log in to your cluster, run `ssh -i <private-key> admin@<public-vm-ip>`.
```
    $ ssh -i <private_key> admin@<public-vm-ip>
```

{: id="node-step-2"}
### Step 2: Get a template for network configuration
Run the `tscli cluster get-config` command to get a template for network configuration for the new cluster. Redirect it to the file `nodes.config`.<br>
You can find more information on this process in the [`nodes.config` file reference]({{ site.baseurl }}/appliance/hardware/nodesconfig-example.html).

    $ tscli cluster get-config |& tee nodes.config

{: id="node-step-3"}
### Step 3: Prepare node configuration
1. Add your specific network information for the nodes in the `nodes.config` file, as demonstrated in the [autodiscovery of one node example]({{ site.baseurl }}/appliance/hardware/nodesconfig-example.html#autodiscovery-of-one-node-example). Run `vim nodes.config` to edit the file.
    ```
    $ vim nodes.config
    ```
    {% include note.html content="Some of the information in the <code>nodes.config</code> file may be pre-populated from earlier steps. For example, if you specified an IP address while creating VMs, that IP address might already be present in your <code>nodes.config</code> file." %}
2. Fill in the areas specified in [Parameters of the nodes.config file]({{ site.baseurl }}/appliance/hardware/parameters-nodesconfig.html) with your specific network information.<br>
If you have additional nodes, complete each node within the nodes.config file in the same way.

Do not edit any part of the `nodes.config` file except the sections described in [Parameters of the nodes.config file]({{ site.baseurl }}/appliance/hardware/parameters-nodesconfig.html). If you delete quotation marks, commas, or other parts of the code, it may cause setup to fail.

{: id="node-step-4"}
### Step 4: Configure the nodes
Configure the nodes in the `nodes.config` file using the `set-config` command.
1. Disable the `firewalld` service by running `sudo systemctl stop firewalld` in your terminal.
  The `firewalld` service is a Linux firewall that must be off for ThoughtSpot installation. After the cluster installer reboots the nodes, `firewalld` automatically turns back on.
```
    $ sudo systemctl stop firewalld
```
2. To make sure you temporarily disabled `firewalld`, run `sudo systemctl status firewalld`. Your output should specify that `firewalld` is inactive. It may look something like the following:
```
    $ sudo systemctl status firewalld
      ● firewalld.service - firewalld - dynamic firewall daemon
        Loaded: loaded (/usr/lib/systemd/system/firewalld.service; disabled; vendor preset: enabled)
        Active: inactive (dead)
```

2. Run the configuration command: `$ cat nodes.config | tscli cluster set-config`.<br>
If the command returns an error, refer to [set-config error recovery](#set-config-error-recovery).<br>
    After you run the node configuration command, your output appears similar to the following:

    ```
    $ cat nodes.config | tscli cluster set-config

    Connecting to local node-scout
    Setting up hostnames for all nodes
    Setting up networking interfaces on all nodes
    Setting up hosts file on all nodes
    Setting up NTP Servers
    Setting up Timezone
    Done setting up ThoughtSpot
  ```

{: id="node-step-5"}
### Step 5: Confirm node configuration
Use the `get-config` command to confirm node configuration.<br>
Your output may look similar to the following:
```
$ tscli cluster get-config

{
  "ClusterId": "",
  "ClusterName": "",
  "DataNetmask": "255.255.252.0",
  "DataGateway": "192.168.4.1",
  "IPMINetmask": "255.255.252.0",
  "IPMIGateway": "192.168.4.1",
  "Timezone": "America/Los_Angeles",
  "NTPServers": "0.centos.pool.ntp.org,1.centos.pool.ntp.org,2.centos.pool.ntp.org,3.centos.pool.ntp.org",
  "DNS": "192.168.2.200,8.8.8.8",
  "SearchDomains": "example.company.com",
  "Nodes": {
	"ac:1f:6b:8a:77:f6": {
  	"NodeId": "ac:1f:6b:8a:77:f6",
  	"Hostname": "Thoughtspot-server1",
  	"DataIface": {
    	"Name": "eth2",
    	"IPv4": "192.168.7.70"
  	},
  	"IPMI": {
    	"IPv4": "192.168.5.70"
  	}
	}
  }
}
```

## Install ThoughtSpot software
Next, [install your ThoughtSpot clusters]({{ site.baseurl }}/appliance/azure/azure-cluster-install.html).

{% include content/install/install-cluster-error-recovery.md %}

## Related information
Use these references for successful installation and administration of ThoughtSpot.

* [The nodes.config file]({{ site.baseurl }}/appliance/hardware/nodesconfig-example)
* [Parameters of the nodes.config file]({{ site.baseurl }}/appliance/hardware/parameters-nodesconfig.html)
* [Using the tscli cluster create command]({{ site.baseurl }}/appliance/hardware/cluster-create.html)
* [Parameters of the cluster create command]({{ site.baseurl }}/appliance/hardware/parameters-cluster-create.html)
* [Contact Support]({{ site.baseurl }}/appliance/contact.html)
