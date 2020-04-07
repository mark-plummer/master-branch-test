---
title: [BigQuery connection reference]
summary: Learn about the fields used to create a BigQuery connection using ThoughtSpot Embrace.
last_updated: 01/30/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

Here is a list of the fields of a BigQuery connection in ThoughtSpot Embrace. You need specific information to establish a seamless and secure connection.

 - **Connection name**: Mandatory. Enter a name for your BigQuery connection.
 - **Connection description**: Optional. Provide a short description about the connection.
 - **Project id**: Mandatory. Enter the project ID associated with the BigQuery database.
 - **Service account**: Mandatory. Enter the service account associated with the BigQuery database. See [set up service account](#service-account).

{: id="service-account"}
## Set up service account
You may already have a service account for GBQ with the proper permissions in place. If not, follow these steps to create a service account.
1. Navigate to [console.cloud.google.com](https://console.cloud.google.com), and sign in.
2. Click the left menu button, if the menu is not already open.
3. Hover over **IAM & admin**.
4. Click on **Service accounts**.

    ![Click on Service accounts]({{ site.baseurl }}/images/gbq-serviceaccount.png "Click on Service accounts")
5. Click **+ CREATE SERVICE ACCOUNT** from the top menu.
6. Specify a name, and add an optional description.
7. Click **Create**.

    ![Create your service account]({{ site.baseurl }}/images/gcp-createserviceaccount.png "Create your service account")
8. Specify permissions. Under **Select a role**, choose **BigQuery > BigQuery Data Viewer**.

    ![Specify permissions]({{ site.baseurl }}/images/gbq-serviceaccountpermissions.png "Specify permissions")
9. On the next screen, click **+ CREATE KEY**.
10. For **Key type**, choose **JSON**.
11. Click **Create**. The key downloads to your computer.<br>
    Copy and paste this key under **Service account** when connecting to Google BigQuery in ThoughtSpot.
