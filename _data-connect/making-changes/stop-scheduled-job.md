---
title: [Stop a scheduled job from running]

last_updated: tbd
summary: "You may want to stop a scheduled job from running for a time, or even permanently."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Use this procedure to pause or stop a job. There are a few conditions when it may be useful to stop or pause a scheduled job:

-   The source system will be offline for maintenance.
-   You are migrating the data to a new source system, and don't want to delete the original job.
-   There is a problem with the job, and you don't want it to run while you are figuring out how to solve it.
-   ThoughtSpot will be offline for scheduled maintenance or an upgrade.
-   You want to delete the data source on which the scheduled job runs.

To stop a scheduled job from running:

1. Log in to ThoughtSpot from a browser.
2. Click **DATA**, on the top navigation bar.

     ![]({{ site.baseurl }}/images/data_icon.png "Data")

3.  Click the **Data Sources** tab at the top of the screen.

    ![]({{ site.baseurl }}/images/data_sources_tab_created.png "Data Sources tab")

4. Click the data source for the scheduled job you want to pause.
5. Click **Schedule** to edit the schedule.
6. Stop the job by selecting **Disable schedule**.

     ![]({{ site.baseurl }}/images/disable_schedule.png "Stop a recurring data load")

7. Click **OK**.
