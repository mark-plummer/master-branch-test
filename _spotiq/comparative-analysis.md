---
title: [Comparative Analysis]
summary: "With SpotIQ competitive analysis, you can compare two data points for complex measures."
last_updated: 11/19/2019
toc: true
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
SpotIQ competitive analysis compares data points of simple or complex measures using these aggregates:  
  * _Sum_
  * _Count_
  * _Sum over sum_, which generate a Pinboard that has 'what-if' percentage insights
  * _Average_, which generate a Pinboard that has 'what-if' percentage insights
  * Other functions which use a 'versus' analysis to show the absolute change grouped by different drill attributes

{: id="basic-comparative-analysis" }
## Basic Comparative Analysis in SpotIQ ##

To perform this analysis, follow these steps:  

1. On a column chart, hold down the command key \(Mac OS\) or control key \(Linux or Windows\).  

2. Click the two columns you plan to compare. Here, we are comparing the results for the _San Francisco_ and _Atlanta_ stores.

3. Right-click to see the drop-down menu, and select **SpotIQ Analyze**.  
   ![]({{ site.baseurl }}/images/comparative-analysis-1.png "Starting comparative analysis")

4. If you see the the SpotIQ information modal, click **Got it**.
   <!--![]({{ site.baseurl }}/images/comparative-analysis-2.png "Got it")-->

5. In the window modal, under **Columns**, select the columns for SpotIQ to compare. By default, SpotIQ picks the most relevant columns, based on what it learned from your past activity.  

   Here, we selected _Department_, _Age Group_, and _Store Region_.  

   Click **Analyze**.   

  ![]({{ site.baseurl }}/images/comparative-analysis-3.png "Analyze selected columns")

{: id="viewing-results" }
## Viewing Results ##

Notice that ThoughtSpot saves the results of SpotIQ analysis for 24 hours.

To view the results of your analysis, follow these steps:  

1. On the top navigation bar, click **SpotIQ**.  
   ![]({{ site.baseurl }}/images/click-spotiq.png "Click SpotIQ")

2. Select the **Analyses** tab.  

   Your analysis may be in progress. Wait until its **Status** changes to _Done_.

    Click _View Results_ to open the pinboard.
    ![]({{ site.baseurl }}/images/comparative-analysis-5.png "Opening the Analysis Results")

3. In the report, SpotIQ generates a Pinboard with insights that compare the two selected points, grouped by the columns you chose for analysis.  

    ![]({{ site.baseurl }}/images/comparative-analysis-6.png "Analysis Results")

4. You can now examine each visualization of the analysis for details of comparison, give feedback on its usefulness, and so on.  
  ![]({{ site.baseurl }}/images/comparative-analysis-7.png "Possible actions on SpotIQ visualizations")


   | Legend | Action | Description |
   | --- | --- | --- |
   | 1. | **Give feedback** | SpotIQ learns how to improve its feedback based on the information you provide. |
   | 2. | **Add to a pinboard** | You can add the specific visualization to an existing pinboard, or create a new pinboard and add it there. |
   | 3. | **Analysis details** | Get the name of the algorithm. |
   | 4. | **More options** | You can run another round of SpotIQ analysis, download the data as a CSV file, edit this visualization, or edit a copy of the visualization. |

{: id="advanced-comparative-analysis" }
## Advanced Comparative Analysis in SpotIQ ##

ThoughtSpot ships with a number of comparative algorithms. Using the **Advanced** option of SpotIQ, you can adjust the parameters of the analysis, or choose a different comparative algorithm for your data.  

After selecting the relevant analysis columns, click the **Advanced** tab.  

Under **Select Algorithms**, select the name of the algorithm. You may have several options available, or only a single one. In this example, the only valid option is **Change Analysis**.  

Under **Customize algorithm for comparative analysis**, adjust the options. In this example, the algorithm parameters are __Max Diff Elements__, __Max Fraction__, __Min Abs Change Ratio__, and __Min Change Ratio__.

![]({{ site.baseurl }}/images/comparative-analysis-4.png "Advanced analysis Options")

On the SpotIQ Feedback tab, you can see all SpotIQ feedback gave. Insights that you disliked are pushed to the bottom of the list.

![]({{ site.baseurl }}/images/insight-feedback.png)
