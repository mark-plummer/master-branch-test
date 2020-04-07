---
title: [Set up AWS resources for ThoughtSpot]
last_updated: 4/3/2020
sidebar: mydoc_sidebar
summary: "After you determine your configuration options, you must set up your virtual machines (VMs) in AWS using a ThoughtSpot Amazon Machine Image (AMI)."
permalink: /:collection/:path.html
---
{: id="aws-overview"}
## Overview of ThoughtSpot setup in AWS
Follow these steps to set up your ThoughtSpot VMs in AWS.

| &#10063; | [1. Get access to ThoughtSpot's AMI](#ami). |
| &#10063; | [2. Choose a VM instance configuration recommended by ThoughtSpot.](#ec2-setup) |
| &#10063; | [3. Set up your Amazon S3 bucket (optional).](#s3-bucket-setup) |
| &#10063; | [4. Set up your ThoughtSpot cluster in AWS.](#aws-ts-setup-cluster) |
| &#10063; | [5. Configure security groups.](#security-groups) |
| &#10063; | [6. Open the required network ports for communication for the nodes in your cluster and end users.](#security-groups) |
| &#10063; | [7. Prepare the VMs.](#prepare-vms) |

{: id="prerequisites"}
## About the ThoughtSpot AMI

An Amazon Machine image (AMI) is a preconfigured template that provides the information required to launch an instance. You must specify an AMI when you launch an instance in AWS.

To make deployment easy, the ThoughtSpot AMI includes a custom ThoughtSpot image, with the following components:

-   A template for the root volume for the instance, such as an operating system, an appliance server, and applications.
-   Launch permissions that control which AWS accounts can use the AMI to launch instances.
-   A block device mapping that specifies the volumes to attach to the instance when it launches.

The ThoughtSpot AMI has specific applications on a CentOS-based image. The AMI includes the EBS volumes necessary to install ThoughtSpot in AWS. When you launch an EC2 instance from this image, it automatically sizes and provisions the EBS volumes. The base AMI includes 200 GB (xvda), 2X400 GB (xvdb), and SSD (gp2). It contains the maximum number of disks to handle a fully loaded VM.

This guide explains how to deploy ThoughtSpot on AWS, using ThoughtSpot's CentOS-based image. Starting with version 6.0.4, you can also deploy ThoughtSpot on AWS using Red Hat Enterprise Linux (RHEL), allowing you to run ThoughtSpot on an RHEL 7.7 image that your organization manages internally. To install ThoughtSpot using RHEL, refer to the [RHEL deployment guide]({{ site.baseurl }}/appliance/rhel/rhel.html).

{: id="prerequisites"}
## Prerequisites

To install and launch ThoughtSpot, you must have the following:

| &#10063; | Familiarity with Linux administration, and a general understanding of cloud deployment models. |
| &#10063; | The necessary AWS Identity and Access Management (IAM) users and roles assigned to you to access and deploy the various AWS resources and services as defined in the Required AWS components section that follows. |
| &#10063; | Networking information: Download and fill out the ThoughtSpot [site survey]({{ site.baseurl }}/site-survey.pdf) to have a quick reference point. Ask your network administrator if you need help filling out the site survey. |

  For more information about IAM, see: [What Is IAM?](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html){:target="_blank"} in Amazon's AWS documentation.

{: id="aws-required"}
### Required AWS components

| &#10063; | An AWS Virtual Private Cloud (VPC). An AWS VPC is a virtual network specifically for your AWS account. It exists in all availability zones in your region, but you can specify a local zone for even lower latency. For more details, see [VPCs and Subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html){:target="_blank"} in Amazon's AWS documentation. |
| &#10063; | A ThoughtSpot AMI. For details, see [Choose VM instances](#ami). |
| &#10063;| AWS security groups. For required open ports, see [Network Policies]({{ site.baseurl }}/appliance/firewall-ports.html). |
| &#10063; | AWS VM instances. For instance type recommendations, see [ThoughtSpot AWS instance types]({{ site.baseurl }}/appliance/aws/configuration-options.html#ts-aws-instance-types). |
| &#10063;| EBS volumes for data storage. |
| &#10063; | (Optional) If deploying with S3 persistent storage, you need one S3 bucket for each ThoughtSpot cluster. |  

{: id="ami"}
## Get access to ThoughtSpot AMI

1. Sign in to your [AWS account](https://console.aws.amazon.com/console/home){:target="_blank"}.
2. Copy the correct ThoughtSpot public AMI to your AWS region. Refer to the chart below to find the AMI you should use, depending on your release number.

    | Release Number | AMI Name | AMI ID | Region |
    | --- | --- | --- | --- |
    | 6.1 | thoughtspot-image-20200304-8b8c7b0e56a-prod | ami-0558406087e3b80d7 | N. California |    


    {% include note.html content="The AMI is based in the N. California region. You may have to temporarily switch to the N. California region on the AWS website to access it. Then you can return to your own region." %}

{: id="ec2-setup"}
## Choose VM instances
3. Choose the appropriate EC2 instance type: See [ThoughtSpot AWS instance types]({{ site.baseurl }}/appliance/aws/configuration-options.html#ts-aws-instance-types) for help choosing the correct instance type for your cluster.
4. Networking requirements: 10 GbE network bandwidth is needed between the VMs. Ensure that you have this bandwidth.
5. Ensure that all your VMs are on the same Amazon Virtual Private Cloud (VPC) and subnetwork. This is necessary because VMs that are part of a cluster need to be accessible by each other.  Additional external access may be required to bring data in/out of the VMs to your network. Add all nodes in the same placement group.
6. Determine the number of EC2 instances you need: Based on the datasets, this number will vary. Refer to [ThoughtSpot AWS instance types]({{ site.baseurl }}/appliance/aws/configuration-options.html#ts-aws-instance-types) for recommended nodes for a given data size.

{% include note.html content="Staging larger datasets (> 50 GB per VM), may require provisioning additional attached EBS volumes that are SSD (gp2)." %}

{: id="s3-bucket-setup"}
## Setting up your Amazon S3 bucket (recommended)

If you are going to deploy your cluster using the S3-storage option, you must set up that bucket before you set up your cluster. Contact [ThoughtSpot Support]({{ site.baseurl }}/admin/misc/contact.html#) to find out if your specific cluster size can benefit from the S3 storage option.

Follow these steps to set up an S3 bucket in AWS.

1. On the AWS website, navigate to the S3 service dashboard by clicking **Services**, then **S3**.

2. Make sure the selected region in the top-right corner of the dashboard is the same region in which you plan to set up your cluster.

3. Click **Create bucket**.

4. In the **Name and region** page, enter a name for your bucket.

5. Select your region.

6. Click **Next**.

5. On the **Properties** page, click **Next**.

6. On the Configure options page, ensure that **Block *all* public access** is selected.

7. Click **Next**.

7. On the Set permissions page, click **Create bucket**.

{: id="encrypt"}
## Encrypting your data at rest

ThoughtSpot makes use of EBS for the data volumes to store persistent data (in the EBS deployment model) and the boot volume (in the EBS and S3 deployment models). ThoughtSpot recommends that you encrypt your data volumes prior to setting up your ThoughtSpot cluster.
If you are using the S3 persistent storage model, you can encrypt the S3 buckets using SSE-S3 or AWS KMS.

For more information on encryption supported with AWS:
- For EBS, see [Amazon EBS Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html){:target="_blank"} in Amazon's AWS documentation.  
- For S3, see [Amazon S3 Default Encryption for S3 Buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html){:target="_blank"} in Amazon's AWS documentation.

{: id="aws-ts-setup-cluster"}
## Setting up your ThoughtSpot cluster

To set up a ThoughtSpot cluster in AWS, follow these steps:

1. On the AWS website, navigate to the EC2 service dashboard by clicking **Services**, then **EC2**.

     ![]({{ site.baseurl }}/images/navigate_to_ec2_dashboard.png "Navigate to the EC2 Dashboard")

2. Make sure your selected region is correct in the top-right corner of the dashboard.
   If not, select your region. Let ThoughtSpot support know if you change your region.

3. Start the process of launching a VM by clicking **Launch Instance**.

     ![]({{ site.baseurl }}/images/launch_instance.png "Launch an instance")

4. In the **My AMIs** tab under **1. Choose AMI**, search **ThoughtSpot** to find the ThoughtSpot AMI.

5. Click **Select**. Ensure that you select the ThoughtSpot AMI listed [above](#ami), which you entered earlier in this process.

    ![Select the ThoughtSpot AMI]({{ site.baseurl }}/images/aws-choose-ami.png "Select the ThoughtSpot AMI")

5. On the **Choose an Instance Type** page, select a ThoughtSpot-supported instance type.
   (See [ThoughtSpot AWS instance types]({{ site.baseurl }}/appliance/aws/configuration-options.html#ts-aws-instance-types).)

6. Click **Next: Configure Instance Details**.

7. Configure the instances by choosing the number of EC2 instances you need.
   The instances must be on the same VPC and subnetwork. ThoughtSpot sets up the instances to be in the same ThoughtSpot cluster.  

   **S3 storage setting**: If you are going to use the S3 storage option, ThoughtSpot recommends that you restrict access to a specific S3 bucket. Create a new IAM role that provides read/write access to the specific bucket, and select it. For details on that, click **Create new IAM role**.

8. Click **Next: Add Storage**.
   Add the required storage based on your instance type (either EBS volumes or S3), and the amount of data you are deploying. For specific storage requirements, refer to [ThoughtSpot AWS instance types]({{ site.baseurl }}/appliance/aws/configuration-options.html#ts-aws-instance-types).

   ![Add storage volumes]({{ site.baseurl }}/images/aws-add-storage.png "Add storage volumes")

   | **1** | Click **Add new volume**. |
   | **2** | Specify the type of storage, either EBS or S3. |
   | **3** | Specify the size of the volume. |
   | **4** | Ensure that you leave **Delete on termination** unchecked, to prevent potential loss of data if the VM is accidentally terminated.|

9. When you are done modifying the storage size, click **Next: Add Tags**.

10. Set a name for tagging your instances. This tag allows you to identify your instance more easily.

{: id="security-groups"}
## Configure security groups

11. Click **Next: Configure Security Group**.

11. Select an existing security group to attach new security groups to so that it meets the security requirements for ThoughtSpot.

    {{site.data.alerts.tip}} <b>Security setting for ThoughtSpot</b><ul><li>The VMs need intragroup security, i.e. every VM in a cluster must be accessible from one another. For easier configuration, ThoughtSpot recommends that you enable full access between VMs in a cluster.</li> <li>Additionally, more ports must be opened on the VM to provide data staging capabilities to your network. Check ThoughtSpot's Network policies documentation to determine the minimum required ports you must open for your ThoughtSpot appliance.</li></ul>
    {{site.data.alerts.end}}

    Refer to [network policies]({{ site.baseurl }}/appliance/firewall-ports.html).

12.  Click **Review and Launch**.

13. After you have reviewed your instance launch details, click **Launch**.

13.  Choose a key pair.
      A key pair consists of a public and private key used to encrypt and decrypt login information. If you don’t have a key pair, you must create one. Without a key pair, you cannot SSH into the AWS instance later on.

14.  Click **Launch Instances**. Wait a few minutes for it to fully start up. After it starts, it appears on the EC2 console.

{: id="prepare-vms"}
## Prepare the VMs
Before installing a ThoughtSpot cluster, an administrator must [prepare the VMs.]({{ site.baseurl }}/appliance/aws/aws-prepare-vms.html)
