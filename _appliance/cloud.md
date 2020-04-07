---
title: [Cloud overview]
summary: "You can deploy ThoughtSpot on several cloud providers."
last_updated: 1/9/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
ThoughtSpot can currently be deployed in the following cloud provider environments:

- [Amazon Web Services (AWS) EC2]({{ site.baseurl }}/appliance/aws/configuration-options.html)
- [Microsoft Azure]({{ site.baseurl }}/appliance/azure/configuration-options.html)
- [Google Cloud Platform (GCP)]({{ site.baseurl }}/appliance/gcp/configuration-options.html)

The ThoughtSpot cloud deployment consists of cloud compute (VM) instances and an underlying persistent storage layer. The number of instances required for a cloud deployment is based on the size of the data that needs to be analyzed in ThoughtSpot. The instances act as a distributed cluster of nodes to serve query responses.

| | AWS | Azure | GCP |
| --- | --- | --- | --- |
| <b>Compute<b> | Virtual machines deployed in your<br>AWS VPC | Virtual machines in your<br>Azure VNET | Virtual machines in your<br>GCP VPC |
| <b>Persistent <br>storage<b> | Deployment options:<br>1. Elastic Block Storage<br>2. S3 + Elastic Block Storage | Premium SSD Managed Disks | Zonal SSD persistent disk |

![]({{ site.baseurl }}/images/cloud-vm-storage.svg "ThoughtSpot cloud deployment")

To determine the number of instances and the persistent storage requirements to provision your cluster, please refer to the available instance types for your cloud service provider in the next section.

## ThoughtSpot cloud instance types

Refer to the following guidelines for how to set up ThoughtSpot on each cloud service:

- [AWS instance types]({{ site.baseurl }}/appliance/aws/configuration-options.html#thoughtspot-aws-instance-types)
- [Azure instance types]({{ site.baseurl }}/appliance/azure/configuration-options.html#thoughtspot-azure-instance-types)
- [GCP instance types]({{ site.baseurl }}/appliance/gcp/configuration-options.html#thoughtspot-gcp-instance-types)

## Reducing your cloud infrastructure costs

ThoughtSpot recommends following these guidelines to help reduce the cost of your cloud deployment.

### Use small and medium instance types when applicable

ThoughtSpot has various instance types to suit your needs. For ThoughtSpot customers who are deploying their instance with lower data sizes (<=100 GB), ThoughtSpot supports “small” (20 GB data) and “medium” (100 GB data) instance types, as provided at the links above, to help reduce the costs of cloud infrastructure. These are instances with lower CPU/RAM sizes (16/32 vCPU and 128 GB/256 RAM). Advanced lean configuration is required before any data can be loaded onto these instances.

Please contact ThoughtSpot support for assistance with this configuration.

### Shut down and restart your cluster

If you do not need your ThoughtSpot cluster to be up and running 24/7, you can shut down your cluster and restart it during normal usage hours to save on the infrastructure costs of running ThoughtSpot instances in cloud provider environments.

To shut down and restart your cluster, do the following in the tscli:

1. Ensure there are no issues with the cluster by running: `$ tscli cluster check`

   The above command should return no failure messages.

2. Stop the cluster by running: `$ tscli cluster stop`

   Wait until you see the message: “Done stopping cluster”

3. Go to your cloud provider's console and shut down all of the ThoughtSpot VMs in your cluster.

4. When you are ready to use ThoughtSpot again, start up your node VMs.

5. Restart your cluster by running:
	`$ tscli cluster start`

   You should see the message: ”Started pre-existing cluster”

   Depending on the size of your cluster, you may need to wait several minutes before the system is up and running. Make sure you budget for this startup time to ensure that the system is fully operational before you expect people to use it.

6. Ensure that your cluster is ready for use by running:
	`$ tscli cluster status`

	The following messages are displayed to indicate your cluster is up and running: <br> 	
  `...`
  `Cluster: RUNNING` <br>
  `Database: READY` <br>
  `Search Engine: READY`

## Automating your cloud deployment

You can automate your deployment, using the free tools in the [ThoughtSpot Cloud Deployment GitHub repository](https://github.com/thoughtspot/community-tools/tree/master/ThoughtSpot_Cloud_deployments){:target="_blank"}.

For more information about automating your cloud deployment, read [Deploying ThoughtSpot in the Cloud Using Terraform and Ansible](https://www.thoughtspot.com/thoughtspot-blog/deploying-thoughtspot-cloud-using-terraform-and-ansible){:target="_blank"}.  
