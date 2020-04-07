---
title: [Prerequisites]
last_updated: [3/3/2020]
summary: "Complete these prerequisites before installing your ThoughtSpot clusters on the SMC appliance."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

{: id="installation-prerequisites"}
## Installation Prerequisites

Ensure that you have the following items, information, and understanding of policies before you begin deploying ThoughtSpot on your SMC appliance.

| &#10063; | [Appliance Port Location]({{ site.baseurl }}/appliance/hardware/connect-appliance-smc.html#haswell-port-location), to locate data and IPMI ports. |
| &#10063; | Data center with proper environment controls, such as cooling.|
| &#10063; | AC power |
| &#10063; | 10GbE switch, with enabled IPv6 broadcast and multicast. You need one switch for each cluster, with one port for each node on the cluster. |
| &#10063; | 10GbE network cables, either direct attach copper (DAC) or fiber. Refer to the [cable reference]({{ site.baseurl }}/appliance/hardware/cable-networking.html) for more information to decide between the two types. |
| &#10063; | 100Mbps or 1Gbps switch for IPMI, for Out of Band Management. You need one for each node in your cluster. |
| &#10063; | Cat5 network cables, for IPMI management port use. You need one for each node. |
| &#10063; | Rack space of 2U or 3.5 inches for each appliance, and a power strip. |
| &#10063; | VGA Monitor and USB keyboard |
| &#10063; | 10G connection: You need one SFP+ for each node for the switch side, and one SFP+ for each node for the appliance side. |
| &#10063; | Networking information: IP addresses for data & management NICs, for up to 2 DNS servers, up to 4 NTP servers and for the default gateway. Ensure that you configure only two DNS servers. ThoughtSpot does not support configuration of three DNS servers. You also need to know the timezone for your cluster. Typically, your timezone is where most of the people who will use the product are. Download and fill out the ThoughtSpot [site survey]({{ site.baseurl }}/site-survey.pdf){:target="_blank"} so that you have a quick reference before beginning the install process. Ask your network administrator if you need help filling out the site survey. |
| &#10063; | [Network policies]({{ site.baseurl }}/appliance/firewall-ports.html), to determine the ports you need to have open for your cluster. |

## Review hardware requirements
Next, [review hardware requirements]({{ site.baseurl }}/appliance/hardware/hardware-requirements-smc.html).
