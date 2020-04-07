---
title: [Customize look and feel]


last_updated: tbd
summary: "You can brand the ThoughtSpot application for your company."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can customize the look and feel of the ThoughtSpot application for your
company. Configuring these settings sets system-wide defaults for all your users.

Style customization is enabled by default. You can configure your cluster to disable this functionality.
Contact ThoughtSpot Support (https://docs.thoughtspot.com/latest/admin/misc/contact.html) about disabling this feature.

## Where to customize styles

A user with administrative rights can view and
access the customization on the **Admin** page.

![]({{ site.baseurl }}/images/custom-style.png)

Use the **Style Customization** page to access the configuration settings.

## General guidelines for customization

Your changes take effect either immediately or with browser refresh. You can
revert your changes by using the **Reset** button which displays when your
cursor moves to the right of any setting.

![]({{ site.baseurl }}/images/custom-style-reset.png)

The following table lists the style customizations you can configure.

<table>
  <tr>
    <th>Setting</th>
    <th>Description</th>
  </tr>
  <tr>
    <th>Application Logo (Default) &amp; Favicon</th>
    <td>Sets a default application and favicon logo. This should be 140 pixels square.</td>
  </tr>
  <tr>
    <th>Application Logo (Wide)</th>
    <td>This logo should be 440 x 100 pixels.</td>
  </tr>
  <tr>
    <th>Chart Visualization Fonts</th>
    <td>Set a font for chart labels. You can specify any Web Open Font Format (`WOFF`) file.</td>
  </tr>
  <tr>
    <th>Table Visualization Fonts</th>
    <td>Set a font for table labels. You can specify any Web Open Font Format (`WOFF`) file.</td>
  </tr>
  <tr>
    <th>Embedded Application Background</th>
    <td>Set the background for an embedded ThoughtSpot instance. This is only used if you are embedding ThoughtSpot in another application.</td>
  </tr>
  <tr>
    <th>Chart Color Palettes</th>
    <td>Set the default palette for all charts. To set a value, however over a color value and enter a HEX value or select one from the chart. Individual users can still customize their own chart colors. They can use the **Reset colors** option on a chart to clear their changes. </td>
  </tr>
  <tr>
    <th>Footer text</th>
    <td>Define a footer to appear with the ThoughtSpot application.</td>
  </tr>
  <tr>
    <th>Page title</th>
    <td>Sets the title for the browser tab.</td>
  </tr>
</table>

## How to specify fonts

You can set your systems default fonts by specifying either or both of the
**Chart Visualization Fonts** and **Table Visualization Fonts** values. To set
this values, your font must be defined in a Web Open Font Format (`WOFF`) file.

Changes to chart and table defaults apply only to charts and features created
_after_ you configure a value. If you change table fonts, older tables retain
their previous fonts. Some settings can be overridden on a per-object level.
Users cannot configure their own defaults.

To set a new font:

![]({{ site.baseurl }}/images/custom-style-font.png)

1. Make sure you have a WOFF file available for your font.

2. Select the label you want to change.

3. Click the **+** button.

   The system displays the **Custom Font** dialog.

4. Click the **Custom Font** field.

   The system displays the file finder.

5. Add the `WOFF` file you want.

   The file appears in the font dialog

6. Click **Save** to change the font.

## How to specify the behavior or clickable links in data

There is a system-wide setting which determines what happens when a user clicks on a link within the data. When your data includes URLs, they display as clickable links in ThoughtSpot tables. By default, clicking on a link opens the URL in a separate tab. But there is a system-wide setting that can be changed to open the links within the context in which they appear.

Changing this setting opens the links:

|Link type|Opens in|
|Link in search result table in ThoughtSpot|Same browser tab as ThoughtSpot application|
|Link in table embedded in an iFrame|Same iFrame that contains the table|
|Link in full ThoughtSpot application embedded in an iFrame|Same iFrame that contains the application|
