---
title: [Dematerialize a view]

last_updated: 11/2/2018
summary: "Learn how to dematerialize a view to free up space."
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

To free up space in your cluster, you can dematerialize views that were materialized but are no longer regularly used. This operation leaves the view intact, but removes the precomputed data which has been stored in memory. After dematerializing a view, you can expect searches on the view to take longer, but you will have more space available in memory.

To dematerialize a view:

1. To find your materialized view, click **Data** in the top menu, and choose **Views**.
2. Click the name of your view.
3. Click **Schema**.
6. Under **Materialization**, click **Dematerialize**.

   ![]({{ site.baseurl }}/images/materialization-dialog-on.png)

   You will see a warning message that the data in the view will be removed from memory. Click **Remove** to confirm.

7. You can see the status of the dematerialization as it progresses. Click **Update status** to refresh it.

   Remember that at this point your view is still searchable. It just isn't materialized into memory. If you want to remove the view altogether, you still need to delete the view.

## Related Information

-   [Understand views]({{ site.baseurl }}/complex-search/about-query-on-query.html)  
-   [Materialize a view]({{ site.baseurl }}/admin/loading/materialize-a-view.html)  
