---
title: [Select chart color palettes]
summary: You can change the color palettes that are used to create your charts.
last_updated: 3/12/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Although it is suggested that you stick with the default settings, it is possible to create your own appealing color palettes if done correctly.

To select the chart color palettes:
1. Navigate to the **Style Customization** page by selecting **Admin > Style Customization**. If the Style Customization option is not available, [Contact ThoughtSpot Support]({{ site.baseurl }}/appliance/contact.html) to enable it.

1. Navigate to the **Chart Color Palettes** section at the bottom of the **Style Customization** page.

     ![]({{ site.baseurl }}/images/style-chartcolorpalettes.png "Chart Color Palettes section")

2. Click the color you would like to change in the **primary** color palette, and use the color menu to choose your new color. You can also add a HEX color number directly.

     ![Change the primary color palette]({{ site.baseurl }}/images/stylecustomization-primary-color.png "Change the primary color palette")

    All of the colors in the primary color palette are used in a chart before any from the secondary palette are used. Therefore, the primary palette usually consists of primary colors.

3. Click the color you would like to change in the **secondary** color palette, and use the color menu to choose your new color. You can also add a HEX color number directly.

     ![Change the secondary color palette]({{ site.baseurl }}/images/stylecustomization-secondary-color.png "Change the secondary color palette")

    The colors from the secondary color palette are used after all of the colors have been exhausted from the primary palette. Therefore, the secondary palette usually consists of secondary colors.

4. Click the **Reset** button on the upper right hand side of the section if you would like to bring back the default color palettes.

## Disable color rotation
You can disable color rotation for single-color charts. If you disable color rotation, ThoughtSpot generates single-color charts in the order of your color palette, left to right. If you leave color rotation enabled, ThoughtSpot generates the color of single-color charts randomly.
