---
title: [Set entity categories for SearchIQ]
last_updated: 09/23/2019
summary: "Entity categories help describe the column content, and assist SearchIQ in interpreting natural language queries."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
<div class="alert alert-info" role="alert">
 <p><strong><i class="fa fa-info-circle"></i>  Note: SearchIQ is in Beta</strong></p>
 <ul type="square">
  <li>SearchIQ is only available in English.</li>
  <li>The feature is off by default; to enable it, contact <a href="mailto:support@thoughtspot.com?subject=SearchIQ%20Reguest&body=I%20want%20to%20try%20SearchIQ">ThoughtSpot Support</a>.</li>
  <li>You must have the <strong>Can use experimental features</strong> permission.</li>
</ul>
</div>

Entity categories specify how to categorize the data in the column, by entity type. By default, `ENTITY TYPE` is not set. Entity categories support [SearchIQ]({{ site.baseurl }}/end-user/search/about-searchiq.html#) so that when you type a natural question, ThoughtSpot better knows how to interpret it. For example, if you ask "who are the top performers?" ThoughtSpot will first choose columns set with `PERSON` from which to return answers. If you ask "when was the movie Jurassic Park released?", columns set to `TIME` will be used to answer the "when" part of the question, and so forth.

<!--  You can specify a per column entity category to help SearchIQ. -->

If you have access to tables and worksheets for data modeling purposes, you can specify entity categories for their columns. This lets you designate that column as representing a person, place, or thing. So then when a user asks "Which", "Who", or "Where", an appropriate response can more easily be found in the data.

If you're not sure how to change the data modeling settings, see the
[Overview of data modeling settings]({{ site.baseurl}}/admin/data-modeling/data-modeling-settings.html).

## About Entity Categories

These are the available Entity Categories:

| Category            | Description                                          |
| :---                | :---                                                 |
| PERSON              | Contains data that represents a person, relevant to questions about "who?" |
| PLACE               | Contains data that represents a location, relevant to questions about "where?" |
| TIME                | Contains data that represents a date or time, relevant to questions about "when?" |
| PRODUCT             | Contains data that represents a product|
| ZIP_CODE            | Contains zip code data, relevant to questions like "where?" or "what zip code?"|
| LAT_LONG            | Contains data that represents geographical positioning, relevant to questions like "where?"|
| COMPANY_ORG         | Contains data that represents a company or organization |
| NUM_TYPES           | Contains numerical data |

## Set Entity Categories

To specify entity categories:

1. Click **Data** in the top menu, and choose **Tables** or **Worksheets**.

2. Click the name of your table or worksheet.

3. On the **Columns** tab, find the COLUMN NAMES for which you want to specify entity categories, and scroll to the right to find `ENTITY CATEGORY`.

4. Use the drop-down menu to set the `ENTITY CATEGORY` to the type you want.

5. Click **SAVE CHANGES** in the upper right.


## Related information

* [SearchIQ]({{ site.baseurl}}/end-user/search/about-searchiq.html)

* [Overview of data modeling settings]({{ site.baseurl}}/admin/data-modeling/data-modeling-settings.html)
