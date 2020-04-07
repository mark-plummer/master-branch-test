---
title: [Cluster replacement]
last_updated: tbd
summary: "Cluster replacement can be achieved using a mirrored system architecture. This allows you to recover an entire system very quickly without data loss."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You have the option of architecting your system for fast recovery from a disaster in which you lose an entire ThoughtSpot instance. This involves running two ThoughtSpot appliances in a mirrored configuration. This configuration is used in mission critical systems or for business processes in which ThoughtSpot data has been operationalized.

The two ThoughtSpot instances are called:

-   Primary: The production ThoughtSpot instance.
-   Mirror: A standby instance that can be placed into service in the event that the primary fails.

In this configuration, the primary initiates periodic full backups of itself. It pushes the backups to a shared NAS (network attached storage). The mirror instance pulls the backups from the shared NAS at defined intervals. It uses each new backup to restore itself to match the production cluster.

 ![]({{ site.baseurl }}/images/Disaster_recovery.png "A ThoughtSpot disaster recovery configuration")

-   **[Mount a NAS file system]({{ site.baseurl }}/admin/setup/NAS-mount.html)**  
Some operations, like backup/restore and data loading, require you to either read or write large files. You can mount a NAS (network attached storage) file system for these operations.
-   **[Set up a disaster recovery configuration]({{ site.baseurl }}/disaster-recovery/set-up-DR-config.html)**  Use this procedure to set up a disaster recovery configuration with a primary
and a mirror instance. If the primary cluster fails, the mirror cluster can take
over its operations after a small manual intervention. The manual procedure
makes the mirror instance into the primary.
