---
title: [Encryption of data in transit within a cluster]
summary: ThoughtSpot can encrypt data in transit within a cluster.
last_udpated: 11/15/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---  
## Overview

ThoughtSpot supports encryption of data in transit within a cluster (traffic flowing between multiple nodes in a cluster). Encryption in transit within the cluster is primarily needed for cloud deployments of ThoughtSpot. This is accomplished using IPSec.

IPSec operates in two modes: tunnel mode and transport mode. ThoughtSpot recommends using **transport mode** to set up IPSec for encrypting in-transit data.

Note: While IPSec provides additional security, it also reduces network bandwidth between nodes.

ThoughtSpot supports IPSec encryption using strongSwan (an open-source IPSec-based VPN solution for Linux and other UNIX based operating systems).

Summary:
1.  Use IPSec in Transport mode for host-to-host IPSec communication.
2.  Use the strongSwan package.
3.  Use AES-GCM for ESP protocol (since it provides authenticated encryption and provides better network bandwidth).

Note: IPSec is supported in ThoughtSpot software versions starting from 4.5.1.4

## Deployment

1.  **Enabling IPSec**: Run following command on any ThoughtSpot node after cluster has been configured and right built has been deployed:
`# tscli ipsec enable`.
2.  **Disabling IPSec**: Run following command on any node of the cluster:
`# tscli ipsec disable`.
3.  **Checking status of IPSec**: Run following command on any node of the cluster
`# tscli ipsec status`.
4.  IPSec configuration and settings are NOT persistent across cluster backup/restore and will have to be re-enabled.
5.  **Adding a node in an IPSec enabled cluster**: IPSec settings are automatically configured across nodes as a nodes get added to a ThoughtSpot cluster that has IPSec enabled.
6.  **Removing a node in IPSec enabled cluster**: IPSec settings are not impacted when nodes get removed from a ThoughtSpot cluster that has IPSec enabled. If any failure occurs during node removal, IPSec would need to re-enabled by using the following command:
`tscli ipsec enable`.
7.  **Manually enable/disable IPSec on a single node(if any IPSec related failure occurs on that node)**: <BR>
    Manually enable and start strongSwan: <BR>
        `sudo systemctl enable strongswan` <BR>
        `sudo systemctl start strongswan`

    Manually stop and disable strongSwan: <BR>
        `sudo systemctl stop strongswan` <BR>
        `sudo systemctl disable strongswan`

    Note: You can check  `/etc/strongswan/ipsec.conf` and `/etc/strongswan/ipsec.secrets` on each node to verify that they are consistent across all nodes.

## Firewall configuration
The following ports must be open between nodes to allow IPSec encryption:
  - UDP port 500 (for IKE)
  - UDP port 4500 (for IPSec over IDP)
  - IP Protocol 50 (ESP)
