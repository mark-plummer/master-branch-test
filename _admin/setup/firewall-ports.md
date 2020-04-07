---
title: [Network policies]



last_updated: tbd
summary: "Lists the required ports, protocols and policies for an installation."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
For regular operations and debugging, there are some ports you you must keep open to network traffic from end users. Another list of ports must be open for intracluster traffic, and for inbound and outbound access to the cluster. ICMP v4 is used for checking the health of the cluster.

## Required ports for operations and debugging

{% include content/operations-ports.md %}

## Required ports for cluster communication

{% include content/ports-network.md %}
