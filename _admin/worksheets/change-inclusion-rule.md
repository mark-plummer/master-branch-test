---
title: ["Change the join rule or RLS setting for a worksheet"]

last_updated: tbd

summary: "As long as you have permissions to edit a worksheet, you can always go into it and set a different join or RLS rule."
toc: false
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

If you find that the charts and tables built on a worksheet contain a large
number of null values (which display as `{blank}` in the web browser), you can
fix this by changing the [internal joins](mod-ws-internal-joins.html#) for the
worksheet.

If you have the **Can administer ThoughtSpot** privilege or the **Can manage data** plus edit privilege on a worksheet, you can
edit the worksheet and change its RLS or other key settings.

## Change/configure a worksheet

Before working through this procedure, make sure you are familiar with how the
following affect data:

* [internal worksheet joins](mod-ws-internal-joins.html#)
* [worksheet join rule](progressive-joins.html#)
* [row level security (RLS)]({{ site.baseurl }}/admin/data-security/set-rls.html#)

To configure these values for a worksheet:

1. Click **Data** on the top navigation bar and then on **Worksheets**.

2. Click the name of the worksheet you want to edit from the list.

3. Click the **Edit Worksheet** button in the upper right hand side of the screen.

4. Click the **+ icon** next to **Sources**.

5. Scroll to the bottom of the page.

6. Configure the worksheet join rule and RLS setting as needed.

     ![]({{ site.baseurl }}/images/worksheet_choose_sources_from_2.5.png "The worksheet join rule and RLS setting")

7. Click **CLOSE**.

8. Click the the ellipses icon ![more options menu icon]({{ site.baseurl }}/images/icon-ellipses.png){: .inline}, and select **Save**.

    ![]({{ site.baseurl }}/images/action_save_worksheet.png "Save a worksheet")
