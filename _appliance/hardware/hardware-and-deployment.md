---
title: [Supported hardware]

last_updated: tbd
summary: "Required and provided installation hardware."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

This section lists all required hardware that is needed to successfully install
your ThoughtSpot appliance in your data center. Some hardware will be provided
with your appliance, while the rest must be provided on-site.

The ThoughtSpot instance hardware is configured for fast data searching and
reliability. This overview details the hardware specification and installation.
The system is made up of compute nodes, which form a cluster. The 2U system
includes up to 4 nodes and can hold up to 1TB of data. This can be scaled out.

## Network connection

Before you can access ThoughtSpot, you need a network connection.

Refer to [Network Ports]({{ site.baseurl }}/admin/setup/firewall-ports.html) in
the Administrator's Guide to see which ports must remain open to outside traffic
for handling certain network requests and for inter-cluster communication. The
[Administrator's Guide]({{ site.baseurl}}/admin/intro.html) also provides
information on network security and how to test your network connectivity
between nodes.

Here are some more details on ports and node communication:

-   Port redundancy (bonding) is not supported. Only one 10G port is active per node.
-   Nodes communicate with each other through the 10G connection (data ports).
-   All nodes should be on the same VLAN – ideally connected to the same top of rack switch.
-   IPMI ports are used for management functions of the nodes.


## Appliance hardware platforms

You can deploy the ThoughtSpot Analytical Search engine on Haswell appliance
hardware platforms, with the following specifications:

|Details                    |  Haswell|
|-------                    | ------- |
|**Dimensions**             |  2 RU chassis (17.25 x 3.47 x 28.5 in.)|
|**\# of nodes**            |  Populated with 1 to 4 nodes                                      |
|**Node specifications**    |Each node is independent and consists of a server board (removable from rear), 1x 200GB SSD, 3x 2TB HDD|
|**Max power consumption**  |2000 W|
|**Required power input**   |200-240 / 11.8 - 9.8A / 50-60Hz|

{% include note.html content="ThoughtSpot deployments are no longer offered on Ivy Bridge platforms."%}

## Chassis views

These diagrams show the front and rear chassis views. The marked features are
present on all four nodes on the rear of the chassis even though they are only
pointed out on one node in the diagrams.

The chassis appear fully populated (4-nodes). Your appliance may be populated
with 1-4 nodes, depending on the ordered configuration. If less than 4-nodes
were ordered, the empty slot will be filled with a filler panel.

 ![]({{ site.baseurl }}/images/ivy_bridge_chassis_views.png "Ivy Bridge - front and rear chassis views")

 ![]({{ site.baseurl }}/images/haswell_chassis_views.png "Haswell - front and rear chassis views")
