---
title: [About disaster recovery]
summary: "ThoughtSpot's disaster recovery prevents data loss if there is a hardware or software failure."
last_updated: 11/19/2019
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Disaster recovery is the ability to recover from a hardware or software failure or a catastrophic event. ThoughtSpot protects you from data loss in the event of a hardware or software failure or a catastrophic event.

ThoughtSpot takes snapshots of itself automatically at periodic intervals. These can be pulled out as backups at intervals or manually as needed. See the ThoughtSpot Administrator Guide for details on backups, snapshots and restore operations.

The information here addresses disaster recovery specifically. These are some potential types of failure, listed in increasing order of severity:

-   **[Disk failure]({{ site.baseurl }}/disaster-recovery/disk-failure.html)**  
ThoughtSpot uses replication of stored data. When a disk goes bad, ThoughtSpot continues to operate.
-   **[Node failure]({{ site.baseurl }}/disaster-recovery/node-failure.html)**  
ThoughtSpot uses replication of stored data. When a disk goes bad, ThoughtSpot continues to operate.
-   **[Cluster replacement]({{ site.baseurl }}/disaster-recovery/cluster-replacement.html)**  
Cluster replacement can be achieved using a mirrored system architecture. This allows you to recover an entire system very quickly without data loss.

ThoughtSpot supports recovery from disk or node failure within each appliance. You can also architect your system to support loss of an entire appliance, which is the highest level of disaster recovery.
