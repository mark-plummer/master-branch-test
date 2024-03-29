---
title: [Prerequisites and Architecture]
summary: "There are a few prerequisites you must complete before using ThoughtSpot Data Connect."
last_updated: 11/19/2019
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Before you can use ThoughtSpot Data Connect, you must enable the ThoughtSpot connection to Informatica, and enter the data connection credentials.

## Prerequisites

The following prerequisites and considerations apply to the data connect feature:

- Your Informatica account will be provisioned by ThoughtSpot.
- If you want to use HTTPS with your URL, you must provide a signed certificate when enabling ThoughtSpot Data Connect.
- You need outbound HTTPS (port 443 for infaagent) internet access to [https://app.informaticaondemand.com](https://app.informaticaondemand.com/) and [https://app2.informaticacloud.com/](https://app2.informaticacloud.com/).

    If outbound HTTPS internet access to [https://app.informaticaondemand.com](https://app.informaticaondemand.com/) and [https://app2.informaticacloud.com/](https://app2.informaticacloud.com/) is not possible, you can instead whitelist the Informatica Cloud IP address ranges `206.80.52.0/24`, `206.80.61.0/24`, `209.34.91.0/24`, and `209.34.80.0/24`.

- You will also need any other internet connectivity and credentials required to access any cloud data sources you want to connect to, such as Salesforce. No inbound access is required.
- After ThoughtSpot Data Connect is enabled, any user who belongs to a group with **Has administration privileges** or who **Can Manage Data** can use the feature. Before enabling the feature, in sure that these privileges are configured properly.

Refer to the [Informatica Cloud Security Architecture Overview](https://thoughtspot.egnyte.com/dl/fuxryvKclK) whitepaper to learn how each component and service is secured. You can also ask ThoughtSpot Support for a copy of the document.

## ThoughtSpot Data Connect design

ThoughtSpot Data Connect is designed to configure and connect to any on-premise or cloud data source. It quickly pulls data into ThoughtSpot through an easy to use point-and-click user interface. This diagram shows all of the required connections.

 ![]({{ site.baseurl }}/images/data_connect_design.png "High-level ThoughtSpot Data Connect design diagram")



## Related information  

[ThoughtSpot Egnyte site](https://thoughtspot.egnyte.com/dl/fuxryvKclK)
