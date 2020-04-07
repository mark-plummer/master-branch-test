---
title: [Scheduled pinboards management]

last_updated: tbd
summary: "You can manage all scheduled pinboards on the Jobs Management page under Admin."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Users who are not admins, but have can schedule pinboard privilege, can only view pinboard schedules they've created. You can select specific jobs and choose to pause, resume, edit, or delete them. You can have up to 50 scheduled jobs on your cluster at time. Contact ThoughtSpot Support if you'd like to increase this limit.

 ![]({{ site.baseurl }}/images/jobs_management.png "View Jobs Management page")

## Bulk actions

Select the scheduled pinboards and use the **Delete**, **Resume**, and **Pause** buttons to perform these bulk actions. Deleting a pinboard will also delete any schedules linked to it.

## Job statuses

Clicking on the row of a job will open a detailed view of every generated update of that job. You can see the start and end times of the job, as well as the status. Clicking on a job will show more information about the status updates.

 ![]({{ site.baseurl }}/images/success_pinboard_schedule.png "Success status updates")

 ![]({{ site.baseurl }}/images/failed_pinboard_schedule.png "Failed status updates")

## Pinboard links

Click the scheduled pinboard name link to jump to a Edit schedule page, where you can edit the schedule configurations.

You can also click the pinboard link provided in the scheduled pinboard emails to jump to the pinboard in ThoughtSpot. In order to have the link direct you to the correct URL, you must first configure front end host and port access. Contact ThoughtSpot Support to configure these settings.
