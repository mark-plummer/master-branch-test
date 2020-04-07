---
title: [Prepare AWS VMs for ThoughtSpot]
last_updated: 12/17/2019
sidebar: mydoc_sidebar
summary: "Prepare the VMs before installing your ThoughtSpot cluster(s)."
permalink: /:collection/:path.html
---
1. SSH into a VM.
```
    $ ssh -i key.pem admin@<VM-IP>
```
1. Run `sudo /usr/local/scaligent/bin/prepare_disks.sh` to configure the VMs.

    {% include warning.html content="Make sure you migrate any data off the disks. This command formats the disks, wiping them clean." %}
    ```
    $ sudo /usr/local/scaligent/bin/prepare_disks.sh
    ```
2. Configure the VM based on your specific network information. Refer to your site-survey or ask your network administrator for that information.

3. Run `df -h` to confirm configuration.
```
    $ df -h
```
4. Repeat these steps for each of your VMs.

   When complete, your storage is mounted and ready for use with your cluster.

When the setup is complete, you can load data into ThoughtSpot for search analytics.    

{: id="network-ports"}
## Open the required network ports

 If you have not already opened the required network ports, see [Network policies]({{ site.baseurl }}/appliance/firewall-ports.html) to determine which ports to open.

## Install Cluster
Next, you must configure your nodes and install your cluster. Follow the steps in [Installing AWS]({{ site.baseurl }}/appliance/aws/installing-aws.html).

## Related information  

[EC2 Best Practices](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-best-practices.html){:target="_blank"}  
[Loading data from an AWS S3 bucket]({{site.baseurl }}/admin/loading/use-data-importer.html#loading-data-from-an-aws-s3-bucket)
