---
title: [Create a formula in a worksheet]

last_updated: 3/20/2020
summary: "You can define formulas and use them to create derived columns in worksheets. "
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You create formulas by combining standard functions and operators, column names, and constant values.

Anyone who can create a worksheet can add a formula to it. Formulas are not reusable; the formula you create is associated only with the worksheet it belongs to. A complete list of available formulas and examples of each is available in the [Formula function reference]({{ site.baseurl }}/reference/formula-reference.html#).

You can create a formula in a worksheet by using the Formula Builder. When you do this, the result of the formula gets added to the worksheet as a column. Use these steps to create a formula:

1. [Create a new worksheet]({{ site.baseurl }}/admin/worksheets/about-worksheets.html), or [edit an existing one]({{ site.baseurl }}/admin/worksheets/edit-worksheet.html).
2. Click the **+** button next to **Formulas**.

     ![Create a new formula for your worksheet]({{ site.baseurl }}/images/worksheet-add-formula.png "Create a new formula for your worksheet")

3. Type your formula in the Formula Builder.

     ![Use the Formula Builder]({{ site.baseurl }}/images/worksheet-formula-profit.png "Use the Formula Builder")

    **Note:** Formula elements are color coded by type and can include the formula operators and functions (blue), the names of columns (purple), and/or constants (black).

5.  You can see a list of formula operators with examples by clicking on **Formula Assistant.**

    ![Formula Assistant]({{ site.baseurl }}/images/worksheet-formula-assistant.png "Formula Assistant")

4. If you want to change what your formula returns, use the **Advanced settings**.

   Depending on your formula, you may be able to change:

    -   Data type
    -   ATTRIBUTE or MEASURE
    -   Aggregation type

    ![Advanced settings in the Formula Builder]({{ site.baseurl }}/images/worksheet-formula-settings.png "Advanced settings in the Formula Builder")

6. Name the formula by clicking on its title and typing the new name. Click **Save**.
