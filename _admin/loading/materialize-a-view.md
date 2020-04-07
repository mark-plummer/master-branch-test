---
title: [Materialize a view]

last_updated: 11/2/2018
summary: "Learn how to materialize a view to improve its performance."
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

To improve the performance of a view, you can materialize it. This operation computes the data for the view and stores it in memory, just like a table. You can expect a 3-6 times performance improvement on a materialized view over a view that is not materialized. However, materialized views take up space in memory, so weigh the tradeoffs and benefits of materializing a view ahead of time.

{% include note.html content="Row Level Security does not apply to materialized views. All users will see the same data when using the materialized view as a data source." %}

To materialize a view:

1. To find your view, click **Data** in the top menu, and choose **Views**.

2. Click the name of your view.

3. Click **Schema**.

4. If needed, [add joins]({{ site.baseurl }}/admin/data-modeling/create-new-relationship.html).

5. Under **Materialization**, click **Materialize**.

   ![]({{ site.baseurl }}/images/materialization_dialog_off.png)

6. Fill in the details for [primary key]({{ site.baseurl }}/admin/loading/constraints.html), [sharding key, and number of shards]({{ site.baseurl }}/admin/loading/sharding.html).

   ![]({{ site.baseurl }}/images/materialize-details.png)

   {% include note.html content="If you do not fill in the sharding details, the view will be replicated on every node of your cluster. If you're not sure what to fill in, ask your ThoughtSpot administrator, or follow the links in this step to learn more about sharding." %}

7. Click **Materialize**.

8. In the **Schedule data updates** dialog, select an option for **Repeats** (Monthly, Weekly, or Daily).

   ![]({{ site.baseurl }}/images/materialized-view-sched-weekly.png)

   If you don't want to set a schedule now, choose **Setup later** and skip to Step 11.

9. Fill in the schedule details:

   ![]({{ site.baseurl }}/images/schedule-data-updates-weekly.png)

10. Click **Update**.

11. You can see the status of the materialization as it progresses. Click **Update status** to refresh it.

    ![]({{ site.baseurl }}/images/materialization-update-status.png)

12. When it says **Materialized** your materialized view is ready for search.

    ![]({{ site.baseurl }}/images/materialization-dialog-on.png)

    If after some time, the status has not changed to **Materialized**, check the [list of statuses]({{ site.baseurl }}/admin/loading/materialized-views.html#materialization-status) and corresponding actions to take.

## Related Information

-   [Understand views]({{ site.baseurl }}/complex-search/about-query-on-query.html)  
-   [Save a search as a view]({{ site.baseurl }}/complex-search/create-aggregated-worksheet.html)
-   [About materialized views]({{ site.baseurl }}/admin/loading/materialized-views.html)
-   [Constraints]({{ site.baseurl }}/admin/loading/constraints.html)
-   [Sharding]({{ site.baseurl }}/admin/loading/sharding.html)
