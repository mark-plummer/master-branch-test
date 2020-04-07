---
title: [Prerequisites]
summary: "Complete these prerequisites to deploy ThoughtSpot on your Dell appliance."
last_updated: 3/3/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
## Installation prerequisites
Ensure that you have the following items, information, and understanding of policies before you begin installing your Dell 6420 appliance.

| &#10063; | 10gbE switch with IPv6 broadcast and multicast enabled. You need one switch for each cluster, with one port for each node on the cluster. |
| &#10063; | Data center with proper environment controls, such as cooling. |
| &#10063; | AC power |
| &#10063; | 10G connection: You need one SFP+ for each node for the switch side. Dell supplies SFP+'s for the appliance side. |
| &#10063; | 10GbE network cables, either direct attach copper (DAC) or fiber. See the [cable reference]({{ site.baseurl }}/appliance/hardware/cable-networking.html) for more information to decide between the two types. |
| &#10063; | 100Mbps or 1Gbps switch for connection to the iDRAC (Out of Band Management) port. You need one for each node in your cluster. |
| &#10063; | Cat5 network cables, for iDRAC/ management port use. You need one for each node. |
| &#10063; | Rack space of 2U or 3.5 inches for each appliance, and a power strip. |
| &#10063; | VGA Monitor and USB keyboard |
| &#10063; | Networking information: IP addresses for data & management NICs, for up to 2 DNS servers, up to 4 NTP servers and for the default gateway. Ensure that you only configure two DNS servers. ThoughtSpot does not support configuration of three DNS servers. You also need to know the timezone for your cluster. Typically, your timezone is where most of the people who will use the product are. Download and fill out the ThoughtSpot [site survey]({{ site.baseurl }}/site-survey.pdf){:target="_blank"} so that you have a quick reference. Contact your network administrator if you need help filling out the site survey. |

## Review hardware requirements
Next, [review hardware requirements.]({{ site.baseurl }}/appliance/hardware/hardware-requirements-dell.html)
