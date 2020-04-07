---
title: [RHEL Deployment Overview]
summary: "Run ThoughtSpot on a RedHat Enterprise Linux (RHEL) 7.7 image that your organization manages internally."
last_updated: 3/20/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Starting with Release 6.0.4, you have the flexibility to run ThoughtSpot on an RHEL 7.7 image that your organization manages internally. ThoughtSpot certifies RHEL 7.7 on the following platforms:
- ThoughtSpot-configured appliances, both [DELL hardware]({{ site.baseurl }}/appliance/hardware/installing-dell.html) and [SMC hardware]({{ site.baseurl }}/appliance/hardware/installing-the-smc.html)
- Cloud deployments: [Amazon Web Services (AWS) EC2]({{ site.baseurl }}/appliance/aws/configuration-options.html), [Microsoft Azure]({{ site.baseurl }}/appliance/azure/configuration-options.html), and [Google Cloud Platform (GCP)]({{ site.baseurl }}/appliance/gcp/configuration-options.html)
- [VMware]({{ site.baseurl }}/appliance/vmware/vmware-intro.html)

Follow these steps to deploy ThoughtSpot through RHEL:

| &#10063; | [Complete installation prerequisites]({{ site.baseurl }}/appliance/rhel/rhel-prerequisites.html) |
| &#10063; | [Get ThoughtSpot artifacts]({{ site.baseurl }}/appliance/rhel/rhel-ts-artifacts.html)|
| &#10063; | [Install ThoughtSpot in RHEL online clusters]({{ site.baseurl }}/appliance/rhel/rhel-install-online.html), or<br/>[Install ThoughtSpot in RHEL offline clusters]({{ site.baseurl }}/appliance/rhel/rhel-install-offline.html) |

Additionally, learn how you can:
- [Upgrade ThoughtSpot for RHEL to a new release]({{ site.baseurl }}/appliance/rhel/rhel-upgrade.html)
- [Add a new node to an existing ThoughtSpot cluster in RHEL]({{ site.baseurl }}/appliance/rhel/rhel-add-node.html)

Finally, to see what additional 3rd-party RPM packages your ThoughtSpot installation includes by default, see [Packages installed with ThoughtSpot for RHEL]({{ site.baseurl }}/appliance/rhel/rhel-packages.html)
