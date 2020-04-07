---
title: [Upgrading ThoughtSpot for RHEL]
last_updated: 3/20/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
To upgrade your RHEL installation of ThoughtSpot, follow these steps:

1. Back up your ThoughtSpot cluster.
2. Pull the necessary security updates.
3. Download the release tarball to each cluster (for online clusters) or to your organization’s mirror repository (for offline clusters).
4.  Run the `tscli cluster upgrade` command.
