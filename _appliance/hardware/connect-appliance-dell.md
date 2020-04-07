---
title: [Connect the Appliance]
summary: "Connect your Dell appliance before you can deploy ThoughtSpot."
last_updated: 3/3/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
After you rack and stack the appliance, it is time to configure it. Follow the steps in this checklist.

| &#10063; | [Step 1: Connect switches to 10GbE ports](#appliance-step-1) |
| &#10063; | [Step 2: Connect iDRAC ports](#appliance-step-2) |
| &#10063; | [Step 3: Connect a keyboard and monitor](#appliance-step-3) |
| &#10063; | [Step 4: Turn on nodes](#appliance-step-4) |

{: id="appliance-step-1"}
## Step 1: Connect switches to 10GbE ports
Connect the 10GbE port of each node, as illustrated in [Dell Port Location](#appliance-port-location), to the 10GbE switches on your own rack, using either fiber or DAC cables.

 Refer to the [Cable reference]({{ site.baseurl }}/appliance/hardware/cable-networking.html) for information on the cable types:
 * [Fiber Cables]({{ site.baseurl }}/appliance/hardware/cable-networking.html#fiber-cables)
 * [DAC Cables]({{ site.baseurl }}/appliance/hardware/cable-networking.html#dac-cables)

 {% include note.html content="Ask your hardware vendor for more details about what they supply and what you need to buy." %}

{: id="appliance-port-location"}

The ports are on the back of the Dell appliance.

![Dell port location]({{ site.baseurl }}/images/dell-port-location.png "Dell port location")
<!--{% include image.html file="dell-port-location.png" title="Dell port location" alt="The iDRAC management port, the 10GbE Data port, and the Display port are on the back of the appliance. The Display port requires a dongle that Dell provides." caption="Dell port location" %}-->

* Connect to switches **only** the appliances (4 nodes each) that you plan to use in your cluster.
* You must power off, or disconnect from the switch, any other nodes or appliances.<br>
    This prevents accidental configuration of incorrect nodes.
* Connect all the nodes that you plan to use in your cluster to a 10G switch.<br>

  {% include note.html content="You need at least three nodes for high availability (HA). Each appliance can have up to four nodes." %}


{: id="appliance-step-2"}
## Step 2: Connect iDRAC ports
Connect the iDRAC management ports of each node to the management switch.<br>
See [Dell Port Location](#appliance-port-location).

{: id="appliance-step-3"}
## Step 3: Connect a keyboard and monitor
Connect a keyboard and monitor to the appliance. You need these to initially configure the appliance, and you can disconnect them later. Use the adapter Dell provides. Plug it into the Display Port shown in [Dell Port Location](#appliance-port-location), and plug the monitor in on the other side of the adapter.

![Dell-provided display to VGA adapter]({{ site.baseurl }}/images/dell-monitor-adapter.png "Dell-provided display to VGA adapter")
<!--{% include image.html file="dell-monitor-adapter.png" title="Dell-provided display to VGA adapter" alt="Plug the monitor and keyboard into the display port using the adapter." caption="Dell-provided display to VGA adapter" %}-->

{: id="appliance-step-4"}
## Step 4: Turn on nodes
Turn on power for the nodes by pressing the power button for each one; see [Dell Power Buttons](#appliance-power-button).

{: id="appliance-power-button"}
![Dell power buttons]({{ site.baseurl }}/images/dell-power-button.png "Dell power buttons")
<!--{% include image.html file="dell-power-button.png" title="Dell power buttons" alt="The power buttons for the nodes are on the front of the appliance. There is one power button for each node." caption="Dell power buttons" %}-->

There is one power button for each node. The image above shows two of the four power buttons.

## Configure the management settings
Next, [configure the management settings.]({{ site.baseurl }}/appliance/hardware/configure-management-dell.html)
