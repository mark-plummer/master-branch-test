---
title: [Refresh a materialized view]

last_updated: 09/20/2019
summary: "You can refresh a view manually, so that its data matches the data in the underlying tables."
toc: true
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

Materialized views can get out of sync with their underlying data. If the status of a view is **Stale**, you must refresh the view manually to sync it with the table.

Note that until it is refreshed, the view remains searchable.

To refresh a view manually, follow these steps:

1. To find your view, click **Data** in the top menu, and choose **Views**.

3. Click **Schema**.

4. In the **Materialization** panel, notice that the **Status** is _Stale_.

5. Next to the _Stale_ status, click **Refresh Data**.

     ![Refresh a stale view]({{ site.baseurl }}/images/refresh-materialized-views.png "Refresh a view")

## Related Information
- [Understand views]({{ site.baseurl }}/complex-search/about-query-on-query.html)
- [About materialized views]({{ site.baseurl }}/admin/loading/materialized-views.html)
