---
title: [The nodes.config file]
last_updated: [1/13/2020]
summary: "Learn how to use the get.config command and the nodes.config file to install  your hardware or cloud appliance."
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
2. Fill in the areas specified in [Parameters of the nodes.config file]({{ site.baseurl }}/appliance/hardware/parameters-nodesconfig.html) with your specific network information, as shown in [Autodiscovery of one node example]({{ site.baseurl }}/appliance/hardware/nodesconfig-example#autodiscovery-of-one-node-example).
    {% include note.html content="Some of the information in the <code>nodes.config</code> file may be pre-populated from earlier steps. For example, if you specified an IP address while creating VMs, that IP address might already be present in your <code>nodes.config</code> file." %}
3. If you have  additional nodes, complete each node within the `nodes.config` file as shown in the [Autodiscovery of one node example]({{ site.baseurl }}/appliance/hardware/nodesconfig-example#autodiscovery-of-one-node-example). [Autodiscovery of one node]({{ site.baseurl }}/appliance/hardware/nodesconfig-example#node-autodiscovery) shows the `nodes.config` file before you fill in your specific information.

Do not edit any part of the nodes.config file except the sections explained in [Parameters of the nodes.config file]({{ site.baseurl }}/appliance/hardware/parameters-nodesconfig.html). If you delete quotation marks, commas, or other parts of the code, setup may fail.

 See [Parameters of the nodes.config file]({{ site.baseurl }}/appliance/hardware/parameters-nodesconfig.html) to understand the parameters in the file.

{: id="node-autodiscovery"}

### Autodiscovery of one node
```
$ tscli cluster get-config |& tee nodes.config 
{  
  "ClusterId": "",
   "ClusterName": "",
   "DataNetmask": "",
   "DataGateway": "",
   "IPMINetmask": "",
   "IPMIGateway": "",
   "Timezone": "",
   "NTPServers": ",
   "DNS": "",
   "SearchDomains": "",
   "Nodes": {
     "06:83:1f:f8:99:9e": {
       "NodeId": "06:83:1f:f8:99:9e",
       "Hostname": "",
       "DataIface": {
         "Name": "eth0",
         "IPv4": ""
       },
       "IPMI": {
         "IPv4": ""
       }
     }
   }
 }
```
{: id="example-node-autodiscovery"}

### Autodiscovery of one node example
```
$ vim nodes.config    
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

## Related information
* [Deploying on the SMC appliance]({{ site.baseurl }}/appliance/hardware/installing-the-smc.html)
* [Configure ThoughtSpot nodes in AWS]({{ site.baseurl }}/appliance/aws/installing-aws.html)
* [Configure ThoughtSpot nodes in GCP]({{ site.baseurl }}/appliance/gcp/installing-gcp.html)
* [Configure ThoughtSpot nodes in VMware]({{ site.baseurl }}/appliance/vmware/installing-vmware.html)
* [Configure ThoughtSpot nodes in Azure]({{ site.baseurl }}/appliance/azure/installing-azure.html)
* [Deploying on the Dell Appliance]({{ site.baseurl }}/appliance/hardware/installing-dell.html)
* [Parameters of the nodes.config file]({{ site.baseurl }}/appliance/hardware/parameters-nodesconfig.html)
