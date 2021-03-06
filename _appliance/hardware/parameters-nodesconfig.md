---
title: [Parameters of the nodes.config file]
last_updated: [2/4/2020]
summary: "Learn the parameters of the nodes.config file to install  your cloud or hardware appliance."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

{: id="using-nodes.config"}
## Using the nodes.config file
As you install your appliance, you must configure the nodes.

1. Run the configuration command in your terminal.
```
    $ tscli cluster get-config |& tee nodes.config
```

2. Add network information for your nodes in the `nodes.config` file output, as demonstrated in [the nodes.config file]({{ site.baseurl }}/appliance/hardware/nodesconfig-example.html) example.<br>
Run `vim nodes.config` to edit the file.
    ```
    $ vim nodes.config
    ```
Fill in the areas specified in [Parameters of `nodes.config`]({{ site.baseurl }}/appliance/hardware/parameters-nodesconfig.html#parameters-nodes.config) with your specific network information.
    {% include note.html content="Some of the information in the <code>nodes.config</code> file may be pre-populated from earlier steps. For example, if you specified an IP address while creating VMs, that IP address might already be present in your <code>nodes.config</code> file." %}
3. If you have  additional nodes, complete this process for each node.

Do not edit any part of the nodes.config file except the sections explained in [Parameters of `nodes.config`]({{ site.baseurl }}/appliance/hardware/parameters-nodesconfig.html#parameters-nodes.config). If you delete quotation marks, commas, or other parts of the code, setup may fail.

See [Parameters of `nodes.config`]({{ site.baseurl }}/appliance/hardware/parameters-nodesconfig.html#parameters-nodes.config) to understand the parameters in the file. Different hardware and cloud installations have different parameters. Your installation may not require all the listed parameters.

{: id="parameters-nodes.config"}

### Parameters of the nodes.config file

**ClusterId** and **Cluster Name**: Leave these two parameters blank. You fill them out later, when running `tscli cluster create`.

**DataNetmask**	The IP of the data netmask, in the form 000.000.000.000. For example, 255.255.252.0.

**DataGateway**	The IP of the data gateway, in the form 000.000.000.000. For example, 192.168.4.1.  

**IPMINetmask**	The IP of the Intelligent Platform Management Interface (IPMI) netmask, in the form 000.000.000.000. For example, 255.255.252.0.  

**IPMIGateway**	The IP of the Intelligent Platform Management Interface (IPMI) gateway, in the form 000.000.000.000. For example, 192.168.4.1.   

**Timezone**	The timezone the majority of your ThoughtSpot users are in, in the form Country/City. For example, America/Los_Angeles. To find your timezone and a city you can use to identify it, use [this timezone list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).

**NTPServers**	The address of your company’s Network Time Protocol (NTP) server. If your company does not have an NTP server, you can use one of ThoughtSpot’s, as listed in [the nodes.config]({{ site.baseurl }}/appliance/hardware/nodesconfig-example.html#autodiscovery-of-one-node-example) example under NTPServers. For example, 0.centos.pool.ntp.org.  

**DNS**	The address of your company’s Domain Name Server (DNS). For example, 192.168.2.200,8.8.8.8.  

{% include warning.html content="Configure only two DNS servers. ThoughtSpot does not support configuration of three DNS servers." %}

{% include note.html content="You can only edit DNS settings with this command if you are deploying ThoughtSpot on hardware. ThoughtSpot does not support using <code>set-config</code> to edit your DNS settings for cloud deployment." %}

**SearchDomains**	The domain of your company or organization, in the form example.company.com.   

**Hostname**	The name of the host server. For example, Thoughtspot-server1.   

**IPv4**	The main IP address, associated with DataNetmask and DataGateway, in the form 000.000.000.000. For example, 192.168.7.70.  

**IPMI IPv4**	A secondary IP address, associated with the IPMINetmask and IPMIGateway, in the form 000.000.000.000. For example, 192.168.5.70.

## Related information
* [Deploying on the SMC appliance]({{ site.baseurl }}/appliance/hardware/installing-the-smc.html)
* [Configure ThoughtSpot nodes in AWS]({{ site.baseurl }}/appliance/aws/installing-aws.html)
* [Configure ThoughtSpot nodes in GCP]({{ site.baseurl }}/appliance/gcp/installing-gcp.html)
* [Configure ThoughtSpot nodes in VMware]({{ site.baseurl }}/appliance/vmware/installing-vmware.html)
* [Configure ThoughtSpot nodes in Azure]({{ site.baseurl }}/appliance/azure/installing-azure.html)
* [Deploying on the Dell Appliance]({{ site.baseurl }}/appliance/hardware/installing-dell.html)
* [The nodes.config file]({{ site.baseurl }}/appliance/hardware/nodesconfig-example.html)
