---
title: [Schedule materialization refresh on a view]

last_updated: 11/2/2018
summary: "Learn how to schedule materialization refresh of a view to keep it in sync with the data that makes it up."
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

To keep the data in a view up-to-date, you can schedule periodic refreshes from the underlying table(s).

To schedule materialization of a view:

1. To find your view, click **Data** in the top menu, and choose **Views**.

2. Click the name of your view.

3. Click **Schema**.

4. Under **Materialization**, click the link next to **Update Schedule**.

5. In the **Schedule Data Updates** dialog, select an option for **Repeats** (Monthly, Weekly, or Daily).

   ![]({{ site.baseurl }}/images/materialized-view-sched-weekly.png)

6. Fill in the schedule details:

   ![]({{ site.baseurl }}/images/schedule-data-updates-weekly.png)

7. Click **Schedule**.

{% include note.html content="Refresh works only if it is scheduled in the refresh window set for the cluster (default: 8:00 PM - 4:00 AM). Only the start time of the refresh window is configurable using the flag `orion.materializationConfig.refreshWindowStartTime` which can be set to values such as `12:00PM` or `01:00AM` etc. Example: To set the cluster window from 2:00 AM to 10:00 AM you can set the flag as `orion.materializationConfig.refreshWindowStartTime \"02:00AM\"`."%}

## Related Information

-   [Understand views]({{ site.baseurl }}/complex-search/about-query-on-query.html)  
-   [Save a search as a view]({{ site.baseurl }}/complex-search/create-aggregated-worksheet.html)
-   [About materialized views]({{ site.baseurl }}/admin/loading/materialized-views.html)
