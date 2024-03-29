---
title: [Get started with ThoughtSpot Data Connect]
last_updated: tbd
toc: false
summary: "ThoughtSpot has partnered with Informatica to bring you ThoughtSpot Data Connect, which is a self-service data integration tool that allows you to easily pull data into ThoughtSpot for analysis."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can import data to ThoughtSpot from on-premise and cloud based sources using ThoughtSpot Data Connect. The initial connection to your data sources is set up by ThoughtSpot. After the connections are set up, you can do all your data imports through the ThoughtSpot application.

{% include note.html content="Data Connect is no longer sold by ThoughtSpot. This documentation is only for existing clients who purchased Data Connect." %}

ThoughtSpot Data Connect was developed by ThoughtSpot, but it uses Informatica's REST APIs to connect to multiple end points, define import tasks and execute them. You can use ThoughtSpot Data Connect to perform extract, transform, and load operations. Data source connections may be stored, to make reconnecting seamless.

After choosing a data source, you can choose from the list of available tables to import. Then select only the columns of interest from each table. Primary key and foreign key relationships will also be imported, but only when the primary key table is imported at the same time as the foreign key table. It’s easy to apply transformations and filters to the data, too. So you only import the data you want to explore. You can schedule incremental or full recurring data loads. Everything you need to do to get your data loaded can be done within the ThoughtSpot application.

ThoughtSpot Data Connect is a premium feature, which is available at an additional cost. Please contact your ThoughtSpot representative, if you want to find out how to enable ThoughtSpot Data Connect.

## Where to go next

-   **[Before using ThoughtSpot Data Connect]({{ site.baseurl }}/data-connect/setup/before-using-data-connect.html)**  
There are a few prerequisites before using ThoughtSpot Data Connect. You must enable the connection beteween ThoughtSpot and Informatica, and enter the data connection credentials.
-   **[Set up ThoughtSpot Data Connect]({{ site.baseurl }}/data-connect/setup/settingup-etl.html)**  
The ThoughtSpot team will assist you in the initial setup and configuration of ThoughtSpot Data Connect. You must provide the credentials for logging in to the various data sources you want to connect to.
-   **[Add a new data source]({{ site.baseurl }}/data-connect/setup/adding-data-source.html)**  
Now that you've enabled ThoughtSpot Data Connect, you will be able to add a new data source. Data sources are the source systems from which you want to import data and schedule repeat data loads.
-   **[Data sources management]({{ site.baseurl }}/data-connect/setup/data-sources-management.html)**  
After you have successfully loaded your tables, you can check on the status of the load, make edits, and more.
