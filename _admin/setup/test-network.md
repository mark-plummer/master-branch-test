---
title: [Test network connectivity between nodes]


last_updated: tbd
summary: "Verify your network is properly configured for the application."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
This procedure tests the network connectivity between all ThoughtSpot nodes, and to the LAN. If you can perform these steps successfully, the network settings on ThoughtSpot are correct.

1. Log in to the Linux shell using SSH.
2. Ping each of the other nodes in the cluster.
3. Ping another machine that exists outside of the cluster, for example, a machine that you will use to stage data to be loaded.

If you cannot perform these tests successfully, there is a problem with the network setup. If the tests fail, check [Network connectivity issues]({{ site.baseurl }}/admin/troubleshooting/check-connectivity.html#).
