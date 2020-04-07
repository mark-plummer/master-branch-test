---
title: [Show data labels]
last_updated: 2/25/2020
summary: "You can show and configure data labels for a chart."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can show data labels for [every measure](#labels-all) in your chart, or configure labels [separately for each measure](#labels-one).

{: id="labels-all"}
## Configure all data labels

1. While viewing your search or answer as a chart, click the **chart configuration** icon ![]({{ site.baseurl }}/images/icon-gear-10px.png){: .inline} on the top right.

2. Select **Settings** on the bottom right.

     ![Click settings]({{ site.baseurl }}/images/chartconfig-zoom-settings.png "Click settings")

3. Check the **all labels** box.

    ![Check the all labels box]({{ site.baseurl }}/images/chartconfig-labels-all.png "Check the all labels box")

    To further configure the labels, by showing unrounded numbers for example, [configure labels individually](#labels-one).

{: id="labels-one"}
## Configure labels for one measure

1. While viewing your search or answer as a chart, click the **chart configuration** icon ![]({{ site.baseurl }}/images/icon-gear-10px.png){: .inline} on the top right.

2. Click on the measure you want to add labels to.

    ![Select a measure]({{ site.baseurl }}/images/chartconfig-reordervalues.png "Select a measure")

3. Check the **data labels** box.<br>
    Note that only the **total sales** data has labels.

    ![Check the data labels box]({{ site.baseurl }}/images/chartconfig-datalabels.png "Check the data labels box")

4. You can specify a **category**, like *number*, *percentage*, or *currency*. Otherwise, ThoughtSpot automatically picks the best category for your data.

    ![Specify a label category]({{ site.baseurl }}/images/chartconfig-labelcategory.png "Specify a label category")

5. When you specify a category, you can also specify **units**. Select *none* to see your data down to two decimal points, for example, or select *millions* to see labels rounded to the millions.

    You can also specify the number of decimal places.

    ![Decimal specifications]({{ site.baseurl }}/images/chartconfig-decimals.png "Decimal specifications")
