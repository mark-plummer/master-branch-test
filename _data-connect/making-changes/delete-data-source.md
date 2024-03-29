---
title: [Delete a data source]

last_updated: 11/18/2019
summary: "Learn how to delete a data source without inadvertently deleting data in ThoughtSpot."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Whenever you delete a data source, you also have the option to drop or retain the table it loads into in the target system (ThoughtSpot). This is useful when you make changes to a table and create a new data source that loads into the table. So, you can safely delete any data source that references a target table that you don't want to lose.

Before you begin, if there are any recurring data load jobs for the data source you are deleting, follow the steps in [Stop a scheduled job from running](stop-scheduled-job.html). Then, do the following to delete a data source:

1. Log in to ThoughtSpot from a browser.

2. Click **Data**, on the top navigation bar.

3.  Click the **Data Sources** tab at the top of the screen.

    ![]({{ site.baseurl }}/images/data_sources_tab_created.png "Data Sources tab")

4. Find the data source you want to delete, and click its name.

5. Click **Edit**. This will bring you to the setup screens for a new data source.

   Step through all the screens by clicking **Next**, until you reach the final page.

6. Click the **Import** button.

7. Click the **here** link to review the TQL script that created the target table in ThoughtSpot.

     ![]({{ site.baseurl }}/images/data_connect_edit_schema.png "Edit schema here link")

8. Take a look at the table name and its schema.

   Decide if the table is one you want to keep in ThoughtSpot.

9. Go back to the data sources listing, click the checkbox next to the data source, and delete it.

     ![]({{ site.baseurl }}/images/data_connect_delete_source.png "Delete a data source")

10. In the Confirm delete prompt, select the checkbox if you want to delete the tables associated with the data source.
    Leave the checkbox unselected if you have decided to keep the tables.

     ![]({{ site.baseurl }}/images/retain_tables_when_deleting_data_sources.png "Delete or retain associated tables")
