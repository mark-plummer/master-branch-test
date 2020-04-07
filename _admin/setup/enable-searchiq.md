---
title: ["Enable SearchIQ"]
last_updated: 09/23/2019
summary: "Enable SearchIQ to provide natural language search for some or all of your users."
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

SearchIQ is a different search experience that understands more natural, speech-like search language than [the original ThoughtSpot search or **Search+**]({{ site.baseurl }}/end-user/search/about-starting-a-new-search.html). For example, you can search for `What was my top selling product last month?`, instead of having to type `top 1 product by sales last month`. You can also speak your search using the voice-to-text capability of your operating system.

Users can easily [teach SearchIQ their language]({{ site.baseurl }}/end-user/search/teach-searchiq.html) as they use it. Over time, SearchIQ gets smarter about how to interpret terms that don’t come directly from keywords, column names, or data values. In order to give it time to learn, the best practice recommendation is to enable SearchIQ for a small group of users initially. Over time you can roll it out to larger groups as SearchIQ learns what your users search for the most.

To enable SearchIQ on a ThoughtSpot instance:

1. Call ThoughtSpot Support and ask them to turn on SearchIQ for your ThoughtSpot instance.

2. Grant the **Can use experimental features** privilege to any group that should have access to the SearchIQ search experience.

   ![]({{ site.baseurl }}/images/searchiq_privilege.png "SearchIQ privilege")

{% include note.html content="Because the SearchIQ search experience is very different from the original ThoughtSpot search experience, you should give your new users some orientation on it, so they know what to expect." %}

## Related information

-   [About SearchIQ]({{ site.baseurl }}/end-user/search/about-searchiq.html)
-   [Use SearchIQ]({{ site.baseurl }}/end-user/search/use-searchiq.html)
-   [Teach SearchIQ your language]({{ site.baseurl }}/end-user/search/teach-searchiq.html)
