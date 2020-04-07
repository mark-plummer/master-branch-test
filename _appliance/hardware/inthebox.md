---
title: [Hardware appliance overview]

last_updated: tbd
summary: "What is in the box."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
The ThoughtSpot appliance hardware will be installed in a rack in your data
center. This section describes the typical physical configuration.

## Hardware provided by ThoughtSpot

When your ThoughtSpot appliance arrives, the following items will be included:

|Item Name|UOM|Qty|
|---------|---|---|
|Round Hole to Sq Hole Adapter Kit (For Slide Rail Management)|Each|1|
|Power Cord, C13 to C14, 6 feet|Each|2|
|Power Cord, C13 to NEMA 5-15, 6 feet<sup>1</sup> **This power cord is not included with the Haswell platform.** |Each|2|
|Document, Rack Rail Installation, TS-2000|Each|1|
|TS-2000 Quick Start Guide|Each|1|
|Bezel Assembly, TS-2000|Each|1|
|Slide Rail Kit|Each|1|
|Appliance (containing 1-4 nodes, depending on ordered configuration)|Each|1|
|SFP+ Connector per ordered node (data connection)|Each|1|
|5m Fiber cable per ordered node (data connection)|Each|1|
|5m Network cable per ordered node (management connection)|Each|1|

<sub>1: The supply voltage, 120 VAC, available when using a NEMA-15 power cord is an insufficient input to achieve the full power output required by the Haswell power supply. Only the C13 to C14 power cord should be used with the Haswell platform.</sub>

 ![]({{ site.baseurl }}/images/C13_14_NEMA.png "C13, C14, and NEMA 5-15 power cords")

##  Additional hardware requirements

 You must supply the following items, as they will not be included with your ThoughtSpot appliance:

* Data center with proper cooling
* 2U of rack space per appliance (post depth 26.5" - 36.4")
* AC power
  **Attention:** Refer to [Hardware details]({{ site.baseurl }}/appliance/hardware/hardware-and-deployment.html#appliance-hardware-platforms) for power input requirements.
* 10GbE infrastructure (switch) - 1x port required / node
* 100MbE infrastructure (switch) - 1x port required /node
* Network cable Cat 5e/6 (node management)<sup>1</sup>
* 10G connection: SFP+ for switch side<sup>2</sup>

 <sub>1. One 5m CAT 5e/6 network cable, per node, is provided with the appliance for management port connection. Customer supplied cable can be used if preferred.</sub>

 <sub>2. One SFP+ connector is provided, per node, for the node side data connection. One 5m fiber cable is also provided. The customer must provide switch side SFP+ that is compatible with their switch. Customer supplied DAC cables or fiber cables can be used if preferred. </sub>

## Typical physical deployment


These diagrams show a physical configuration with three blocks of four nodes each. Your appliance can have 1-4 nodes, depending on the ordered configuration.

![]({{ site.baseurl }}/images/rack_diagram2_ivy_bridge.png "Ivy Bridge and Haswell platforms physical configuration")

![]({{ site.baseurl }}/images/rack_diagram3.png "Connections between the nodes and your data center ")
