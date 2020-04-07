---
title: [About materialized views]

last_updated: 10/31/2018
summary: "You can materialize a view to improve its performance."
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

## Introduction to materialized views

Views can become slow as your data volume and the number of views stacked on top of one another grow. This happens because when doing a search, each view is computed on the fly. To improve the performance of a view, you can materialize it. Materializing pre-computes the view and stores it in memory, just like a table. You can expect a materialized view to be three to six times faster than a view that is not materialized, on average.

To materialize a view, you must have the [**Can administer ThoughtSpot** privilege]({{ site.baseurl }}/admin/users-groups/about-users-groups.html).

{% include note.html content="The number of materialized views you can create is limited to 50, because materialized views take up space in memory." %}

{% include note.html content="Row Level Security does not apply to materialized views. All users will see the same data when using the materialized view as a data source." %}

These are the operations you can do on a view:
-   [Materialize a view]({{ site.baseurl }}/admin/loading/materialize-a-view.html) to improve performance,
-   [Dematerialize a view]({{ site.baseurl }}/admin/loading/dematerialize-a-view.html) to save space, or
-   [Refresh a view]({{ site.baseurl }}/admin/loading/refresh-view.html) to synchronize its data with the latest data load to the underlying tables.
-   Check the status of a view.

After materializing, a view can have one of three statuses. You can see the status of a view by selecting **Data**, clicking on **Views**, and finding your view in the list. The status is shown next to the name of your view.

## Materialization status
[](#materialization-status)

These are the statuses a view can have:

|Status|Description|Action|
|------|-----------|--------|
|Queued|View is waiting to be materialized.|Click **Update status**.|
|In Progress|View is being materialized.|Click **Update status**. Wait for materialization to finish.|
|Materialized|View has been materialized into memory.|You can now search the materialized view.|
|Stale|View has become out of sync with the data in the tables that make it up, usually due to an incremental data load. |Refresh the view by clicking **Refresh Data***.|
|Unknown|View status could not be determined.|Click **Update status**.|
|Error|An error occurred.|Refresh the view by clicking **Refresh Data***. Optionally run a report.|

\* You will only have the option to refresh data if you have the [**Can administrator ThoughtSpot** privilege]({{ site.baseurl }}/admin/users-groups/about-users-groups.html) privilege.

## Freshness of data

Your view can become stale, if it isn't refreshed when the data in the tables used to create it is updated. There are two ways to refresh the data:

* [Manually refresh data in a view]({{ site.baseurl }}/admin/loading/refresh-view.html)
* [Refresh the view on a schedule]({{ site.baseurl }}/admin/loading/schedule-materialization.html)

Here are some conditions that could lead to a view becoming stale:

* Changes to the view definition
* Changes to the fields used in the view
* Changes to the join relationships used in the view
* Change to formulas in the view
* Change the datatypes in the underlying tables

## Related Information

-   [Understand views]({{ site.baseurl }}/complex-search/about-query-on-query.html)  
-   [Save a search as a view]({{ site.baseurl }}/complex-search/create-aggregated-worksheet.html)
-   [Materialize a view]({{ site.baseurl }}/admin/loading/materialize-a-view.html)  
