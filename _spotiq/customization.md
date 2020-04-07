---
title: [Custom SpotIQ analysis]
summary: Learn how to customize SpotIQ analysis.
last_updated: 11/15/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Everywhere in ThoughtSpot where you can run **SpotIQ analyze**, you
can configure a customized SpotIQ analysis. The customized analysis can be
a one-time customization or can apply to all future analysis of that particular
data source.

## Finding customization controls

Every menu or location where you can run **SpotIQ analyze**, you
can customize your analysis. You access it using the lightbulb button ![more options menu icon]({{ site.baseurl }}/images/icon-lightbulb.png){: .inline} or the ellipses menu ![SpotIQ analyze icon]({{ site.baseurl }}/images/icon-ellipses.png){: .inline}.

![]({{ site.baseurl }}/images/spotiq-where-customize.png)

Regardless of where you run **SpotIQ analyze** in ThoughtSpot, the **SpotIQ** window has the same layout. The columns displayed, though, are specific to
the data from which you run **SpotIQ analyze**.

![]({{ site.baseurl }}/images/spotiq-customize-analysis-include.png)


This window has two tabs:
* **Columns**, where you can explicitly indicate which columns to include in a SpotIQ analysis. (You can select all, some, or none.)
* **Advanced**, where you can run custom analyses and incorporate R scripts into SpotIQ.

The **Advanced** tab has many options. The panel scrolls, so more algorithms are available than appear in the following image

 ![]({{ site.baseurl }}/images/spotiq-customize-algorithms.png)

The **SpotIQ** insights page has an option to open this window to
customize a single analysis.

![]({{ site.baseurl }}/images/spotiq-customize-locations.png)

The **Tell us more** window provides information on how to exclude a value from all future analysis.

![]({{ site.baseurl }}/images/spotiq-customize-improve-analysis.png)

You can set SpotIQ customization parameters in your
[SpotIQ preferences]({{ site.baseurl }}/_spotiq/spotiq-preferences.html), along with options for email notifications when analyses run.

## Eliminate null values

Null values should be eliminated from your analysis.  

<table>
  <tr>
    <th>From next analysis</th>
    <th>From future analyses</th>
  </tr>
  <tr>
    <td>
    <!-- next -->
    <p>In the Search bar, add a filter <code><i>column</i>!= Null</code> to the search bar. Or choose <b>Exclude null values from current analysis</b>, using the <b>Advanced</b> panel.</p>
    </td>
    <td>
    <!-- future -->
    Set <b>Exclude null values from my analysis</b> on your user <b>Profile</b> to exclude them from any future  SpotIQ analyses you do.
    </td>
  </tr>
</table>

## Exclude uninteresting column(s) in insight

You should always exclude columns you are not interested from your analysis.  

<table>
  <tr>
    <th>From next analysis</th>
    <th>From future analyses</th>
  </tr>
  <tr>
    <td>
    <!-- next -->
    <p>Use the <b>EXCLUDE</b> option of <b>SPOTIQ PREFERENCE</b> under the <b>DATA</b> tab to exclude any column permanently from all future analysis.</p>
    </td>
  </tr>
</table>

## Include an interesting column

You can always include columns that interest you in your analysis.  

<table>
  <tr>
    <th>From next analysis</th>
    <th>From future analyses</th>
  </tr>
  <tr>
    <td>
    <!-- next -->
    <p>Choose <b>Customize analysis</b> and select columns that you want to include.</p>
    </td>
    <td>
    <!-- future -->
    Ensure <b>Index Priority</b> is between 8-10 on the column under the <b>DATA</b> tab.
    </td>
  </tr>
</table>


## Remove known date outliers

Your data may contain known outliers. For example, you are in the middle of a quarter and only want to analyze the previous quarter. Anything from the present quarter could contain an outlier.

<table>
  <tr>
    <th>From next analysis</th>
    <th>From future analyses</th>
  </tr>
  <tr>
    <td>
    <!-- next -->
    <p>In the Search bar, add a filter <code><i>date</i>< last time period</code> to the search bar.</p>  </td>
    <td>
    <!-- future -->
    Not applicable.
    </td>
  </tr>
</table>


## Too few insights

Your SpotIQ analysis may not provide you as many insights as you think it should.

<table style="border:1px;">
  <tr>
    <th>From next analysis</th>
    <th>From future analyses</th>
  </tr>
  <tr>
    <td>
    <!-- next -->
    <p>Choose <b>Customize analysis</b>, select the <b>Advanced</b> tab, and decrease the <b>Multiplier for Outlier Detection</b> to a value closer to zero.
</p>
</td>
    <td>
    <!-- future -->
    Not applicable.
    </td>
  </tr>
</table>

## Explaining Anomaly Insights

When SpotIQ finds insights with anomaly points, you have the option to run the Explain Insight command to have SpotIQ do further analysis on the anomaly points.

![]({{ site.baseurl }}/images/spotiq-explain-insight-1.png)

To explain an insight, do the following:

1. Click the ellipses icon ![more options menu icon]({{ site.baseurl }}/images/icon-ellipses.png){: .inline} for the insight you want to explain and select **Explain insight**.

2. In the SpotIQ window, click **Analyze**.

   Analysis begins.

3. Click **SpotIQ** in the top navigation bar.

4. Click the **Analyses** tab.

5. Find the name of the insight that you analyzed and click **View Results**.

   The results of your insight analysis explaining your anomaly points appear.

![]({{ site.baseurl }}/images/spotiq-explain-insight-2.png)

{% include note.html content="**Explain insight** does not work with Trend Analysis or Cross Correlation Analysis." %}
