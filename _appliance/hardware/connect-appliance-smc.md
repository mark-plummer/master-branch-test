---
title: [Connect the SMC appliance]
last_updated: [1/31/2020]
summary: "Connect the SMC appliance before you can deploy ThoughtSpot."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
After you rack and stack the appliance, it is time to configure it. If necessary, review the [Hardware Appliance Overview]({{ site.baseurl }}/appliance/hardware/inthebox.html). Follow the steps in this checklist.

| &#10063; | [Step 1: Connect switches to 10GbE ports](#appliance-step-1) |
| &#10063; | [Step 2: Connect IPMI ports](#appliance-step-2) |
| &#10063; | [Step 3: Turn on nodes](#appliance-step-3) |
| &#10063; | [Step 4: Log in](#appliance-step-4) |

{: id="appliance-step-1"}
## Step 1: Connect switches to 10GbE ports
Connect the 10GbE port of each node, as illustrated in [Haswell port location]({{ site.baseurl }}/appliance/hardware/connect-appliance-smc.html#haswell-port-location) and [Skylake port location]({{ site.baseurl }}/appliance/hardware/connect-appliance-smc.html#skylake-port-location), to the 10GbE switches on your own rack, using either fiber or DAC cables.

 Refer to the [Cable reference]({{ site.baseurl }}/appliance/hardware/cable-networking.html) for information on the cable types:
 * [Fiber Cables]({{ site.baseurl }}/appliance/hardware/cable-networking.html#fiber-cables)
 * [DAC Cables]({{ site.baseurl }}/appliance/hardware/cable-networking.html#dac-cables)

 {% include note.html content="Ask your hardware vendor for more details about what they supply and what you need to buy." %}

Depending on which version of the SMC appliance you have, Haswell or Skylake, your 10GbE ports are in a different spot on the back of the appliance. Here is a picture of the back of each appliance.

{: id="haswell-port-location"}
![Haswell port location]({{ site.baseurl }}/images/smc-haswell-location-ports-new.png "Haswell port location")
<!--{% include image.html file="smc-haswell-location-ports-new.png" title="Haswell port location" alt="The data and management ports are on the back of the SMC Haswell appliance." caption="Haswell port location" %}-->

{: id="skylake-port-location"}
![Skylake port location]({{ site.baseurl }}/images/smc-appliance-skylake-location-ports.png "Skylake port location")
<!--{% include image.html file="smc-appliance-skylake-location-ports.png" title="Skylake port location" alt="The data and management ports are on the back of the SMC Skylake appliance." caption="Skylake port location" %}-->

* Connect to switches **only** the appliances (4 nodes each) that you plan to use in the cluster.  
* You must power off, or disconnect from the switch, all other appliances or nodes.<br>
This prevents accidental configuration of incorrect nodes.  
* Connect all the nodes that you plan to use in your cluster to a 10G switch.   

{: id="appliance-step-2"}
## Step 2: Connect IPMI ports
Connect the IPMI port of each node to the management switch.<br>
See [Haswell port location]({{ site.baseurl }}/appliance/hardware/connect-appliance-smc.html#haswell-port-location) and [Skylake port location]({{ site.baseurl }}/appliance/hardware/connect-appliance-smc.html#skylake-port-location).

{: id="appliance-step-3"}
## Step 3: Turn on nodes
Turn on the power to the nodes by pressing the power button; see [Appliance Power Button]({{ site.baseurl }}/appliance/hardware/connect-appliance-smc.html#smc-appliance-power-button).

There is one power button for each node. The images below show two of the four power buttons.

{: id="smc-appliance-power-button"}
| Haswell Appliance | &#32; &#32; &#32; | Skylake Appliance |
| ---- | ---- | ---- |
| ![The power button is at the front of the Haswell appliance.]({{ site.baseurl }}/images/smc-haswell-power-button-new.png "The power button on the front of the Haswell SMC appliance")| &#32; | ![The power button is at the front of the Skylake appliance]({{ site.baseurl }}/images/smc-appliance-skylake-power-button.png "The power button on the front of the Skylake SMC appliance") |

Check the health of the NIC by inspecting your appliance's LEDs. There should be a steady green light for the 100MB/s or 1Gb/s management NIC connection, a steady amber or orange light for the 10G/s connection, and a blinking LED on both NICs to indicate live traffic.<br>

After the LEDs are the correct colors, verify that the connection is valid and the nodes are on by pinging the gateway:<br>
Enter `ping <default-gateway-IP>`.<br>
Ask your network administrator for your default gateway IP if you have not already listed it in your ThoughtSpot [site survey]({{ site.baseurl }}/site-survey.pdf){:target="_blank"}.
```  
    $ ping <default-gateway-IP>
```    

{: id="appliance-step-4"}
## Step 4: Log in
1. Connect a keyboard and the mouse to each node on the appliance.
2. You should see a login prompt on the screen. If you don't see one or the screen isn't responsive, press the key combination **control--alt--F2** or **alt--F2** on your keyboard to bring up the login prompt.
2. Log in using the admin user credentials for the console. If you do not know the admin credentials, ask your network administrator.

## Configure nodes
Next, [configure nodes.]({{ site.baseurl }}/appliance/hardware/configure-nodes-smc.html)
