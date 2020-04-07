---
title: [GCP configuration options]
summary: "ThoughtSpot can be deployed using several different GCP instance types."
last_updated: 1/9/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
ThoughtSpot can be deployed in your GCP environment by deploying compute (VM) instances in your VPC as well as an underlying persistent storage infrastructure. Currently two configuration modes are supported by ThoughtSpot:
- Mode 1: Compute VMs + SSD Persistent Disk storage-only
- Mode 2: Compute VMs + SSD Persistent Disk and Google Cloud Storage (GCS).

For more information about Persistent Storage, see [Zonal Persistent SSD disks](https://cloud.google.com/compute/docs/disks/#pdspecs){:target="_blank"} in Google's Cloud documentation.

For more information about Google Cloud Storage, see [Cloud Storage Buckets](https://cloud.google.com/compute/docs/disks/#gcsbuckets){:target="_blank"} in Google's Cloud documentation.

All GCP VMs (nodes) in a ThoughtSpot cluster must be in the same zone
(and, therefore, also in the same region). ThoughtSpot does not support deploying VMs (nodes) of the same cluster across different zones. For more information, see [Regions and Zones](https://cloud.google.com/compute/docs/regions-zones/){:target="_blank"} in Google's Cloud documentation.

## ThoughtSpot GCP instance types

### VMs with Persistent Disk-only storage

![]({{ site.baseurl }}/images/persistent-storage-ssd.svg "GCP SSD-only Persistent Storage")

| Per VM user data capacity | Instance type | CPU/RAM | Recommended per-VM <br>Zonal Persistent SSD Disk volume | Required root volume capacity |
| --- | --- | --- |--- | --- |
| 208 GB | n1-highmem-64 | 64/416 | 2x 1 TB | 200 GB for each node |
| 312 GB | n1-highmem-96 | 96/624 | 2x 1.5 TB | 200 GB for each node |
| 100 GB | n1-highmem-32 | 32/208 | 2X 400 GB | 200 GB for each node |
| 20 GB | n1-highmem-16 | 16/122 | 2X 400 GB | 200 GB for each node |
| 180 GB | n1-standard-96 | 96/330 | 2X 1 TB | 200 GB for each node |

### VMs with Persistent Disk and Google Cloud storage

![]({{ site.baseurl }}/images/persistent-storage-ssd-gcs.svg "GCP SSD and GCS Persistent Storage")

| Per VM user data capacity | Instance type | CPU/RAM | Recommended per-VM <br>Zonal Persistent SSD Disk volume | Required root volume capacity |
| --- | --- | --- |--- | --- |
| 208 GB | n1-highmem-64 | 64/416 | 1X 500 GB | 200 GB for each node |
| 312 GB | n1-highmem-96 | 96/624 | 1X 500 GB | 200 GB for each node |
| 100 GB | n1-highmem-32 | 32/208 | 1X 500 GB | 200 GB for each node |
| 20 GB | n1-highmem-16 | 16/122 | 1X 500 GB | 200 GB for each node |
| 180 GB | n1-standard-96 | 96/330 | 1X 500 GB | 200 GB for each node |    
