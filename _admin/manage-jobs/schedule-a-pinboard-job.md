---
title: [Schedule a pinboard job]

last_updated: tbd
summary: "You can schedule a pinboard job for any pinboard by using the Add a schedule prompt page."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can add multiple schedules with different configurations for a single
pinboard. However, each job is limited to one pinboard schedule. To add
a schedule, you must either be an administrator or have the schedule pinboard privilege, and
at least edit-only and view-only access to the pinboard.

To schedule a pinboard:

1. Sign in to ThoughtSpot from a browser.
2. Click **Pinboards**, on the top navigation bar.

     ![]({{ site.baseurl }}/images/click-pinboards.png "Pinboards")

3. Select the pinboard you want to create a schedule for.
4. Click the ellipses icon ![more options menu icon]({{ site.baseurl }}/images/icon-ellipses.png){: .inline} and select **Manage schedules** to view all of the schedules set for the pinboard.

     ![]({{ site.baseurl }}/images/view_schedules.png "View pinboard schedules")

5. Click **+ Schedule** to add a new schedule.

    ![]({{ site.baseurl }}/images/new_pinboard_schedule.png "Add a new pinboard schedule")

     On the **Add a Schedule** page, you create a new schedule for your pinboard.

    ![]({{ site.baseurl }}/images/scheduled_pinboards_1.png "Set the pinboard schedule")

6. Set the values for your schedule.

    <table>
     <tr>
       <th>Field</th>
       <th>Description</th>
     </tr>
     <tr>
       <th>Repeats</th>
       <td>You can rebuild a pinboard every <i>n</i> minutes, hourly, daily, weekly, or monthly. For some of these, you can also choose specific times of the day or days of the week. Make sure to note the <strong>Server time zone</strong> which is the timezone which will be used.</td>
     </tr>
     <tr>
       <th>Name</th>
       <td>Provide a short name for this schedule, <code>Monthly Report Source</code> is an example of a good name.</td>
     </tr>
     <tr>
       <th>Description</th>
       <td>Enter a description to remind yourself and to inform others. For example, if this is an important schedule for a meeting or a report, you should mention that.</td>
     </tr>
     <tr>
       <th>Type</th>
       <td>CSV files provide all data for tables, with one attachment per table. Use CSV files to perform further analysis offline. PDF files show all visualizations in the pinboard. Each chart takes up a whole page in the file, while only the first 100 rows of a table are included. Use PDF files to skim the data.</td>
     </tr>
     <tr>
     <th>Gating condition</th>
     <td><p>Write a statement that returns a single boolean value (true or false). For example, <code>sum (revenue) > 100</code> is a valid condition but <code>is_weekend (commit_date)</code> is not. You can use any valid formula in your statement. Other than checking your formula syntax, ThoughtSpot does not validate your formula returns a single boolean.</p>
     <p>At the scheduled time, ThoughtSpot checks the gating condition, and, if the condition returns true, processes the pinboard. For a list of valid formulas, see the <a href="{{"/reference/formula-reference.html" | prepend: site.baseurl }}">Formula function reference</a>.</p></td>
     </tr>
     <tr>
       <th>Recipients</th>
       <td><p>You are limited to 1000 recipients per job. You can add <b>Users or groups</b> to enter ThoughtSpot users or groups. Use <b>Emails</b> to add recipients that are not ThoughtSpot users. Any users your ThoughtSpot admin must have set your whitelist domains. Contact ThoughtSpot Support to set your whitelist domains.</p>
       <p>If you experience problems with sending email, your cluster may not have SMTP enabled. Contact your system administrator to resolve this issue.</p>
       </td>
     </tr>
   </table>

7. Click **Schedule** to save your schedule configuration.
