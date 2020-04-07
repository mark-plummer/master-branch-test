---
title: [ThoughtSpot Tutorials for Snowflake Partner Connect]
last_updated: 3/9/2020
toc: true
summary: "Explore these tutorials to learn how to model your data after connecting to your Snowflake database."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
When you create a connection to Snowflake in ThoughtSpot, any data modeling or table joins are inherited automatically.

If there are no table joins in your Snowflake connection, you can easily create them in ThoughtSpot.  

The following example shows how the table joins were created in the Sales table of the Retail Sales worksheet, available in your **try.thoughtspot.com** account created through Snowflake Partner Connect.

## Creating table joins

The joins in the Sales table were created by doing the following:

1. Click **Data** in the top navigation bar.

2. Click the **Tables** tab at the top of the page.

3. Click the **Sales** table.

   The Columns view of the Sales table appears.

4. Click the **Schema** tab.  

5. Click **+Add join**.

   The Add Join window appears.

6. In the Add Join window, use the drop-down menus to make the following selections:
   - For Destination Table, select **Products**.
   - For Source Columns, select **Product_Key**.
   - For Destination Columns, select **Product_Key**.  

   ![]({{ site.baseurl }}/images/snow-add-join.png "Add Join for Products")

7. Click **Next**.

8. Enter the name _Product_Key - Product_Key_, a description for your join (optional), and click **Next**.  
   ![]({{ site.baseurl }}/images/snow-add-join-name.png "Join Name Products")

   {% include note.html content="You can use any name you want. The names we've chosen for this tutorial match those in the actual schema for this dataset on try.thoughtspot.com." %}

   The first join is created. Now you will add the other joins.

9. Click **+Add join**.

10. In the Add Join window, use the drop-down menus to make the following selections:
    - For Destination Table, select **Customers**.
    - For Source Columns, select **Customer_Key**.
    - For Destination Columns, select **Customer_Key**.  

    ![]({{ site.baseurl }}/images/snow-add-join2.png "Add Join for Customers")

11. Click **Next**.

12. Enter the name _Customer_Key - Customer_Key_, a description for your join (optional), and click **Next**.  
    ![]({{ site.baseurl }}/images/snow-add-join-name2.png "Join Name Customers")

13. Click **+Add join**.

14. In the Add Join window, use the drop-down menus to make the following selections:
    - For Destination Table, select **Stores**.
    - For Source Columns, select **Store_Key**.
    - For Destination Columns, select **Store_Key**.  

    ![]({{ site.baseurl }}/images/snow-add-join3.png "Add Join for Stores")

15. Click **Next**.

16. Enter the name _Store_Key-Store_Key_, a description for your join (optional), and click **Next**.  
    ![]({{ site.baseurl }}/images/snow-add-join-name3.png "Join Name Stores")

17. Click **+Add join**.

18. In the Add Join window, use the drop-down menus to make the following selections:
    - For Destination Table, select **Dates**.
    - For Source Columns, select **Date_Key**.
    - For Destination Columns, select **Date_Key**.  

    ![]({{ site.baseurl }}/images/snow-add-join4.png "Add Join for Dates")

19. Click **Next**.

20. Enter the name _Date_Key - Date_Key_, a description for your join (optional), and click **Next**.  
    ![]({{ site.baseurl }}/images/snow-add-join-name4.png "Join Name Dates")

    Now that all four table joins are created, the schema looks like this:  
    ![]({{ site.baseurl }}/images/snow-schema.png "schema")

### Searching joined tables

You can easily search the joined tables, without having to create a worksheet.

To search the joined tables, do the following:

1. Click **Search**.

2. Click the _Retail Sales_ data source, and click **Choose sources**.

3. Select all the tables you just joined (Customers, Dates, Products, Sales, and Stores) and click **Close**.

4. In the search bar, enter **sales_dollar_amount**, **store_region**, and **monthly _Date in Dates_**.  
   ![]({{ site.baseurl }}/images/date-in-dates.png "search results")

   The search results look like this:  
   ![]({{ site.baseurl }}/images/snow-search-results.png "search results")

   {% include note.html content="When Monthly is a native keyword, it will work on any timestamp. For the purposes of this example, we're using monthly as the date, from the Dates table." %}

5. To confirm that the search is honoring the table joins, click the Query details icon ![query details icon]({{ site.baseurl }}/images/icon-information-20px.png){: .inline}, to the right of the chart.  
   ![]({{ site.baseurl }}/images/partner-connect-query-details.png "query details")

6. To confirm the search is bridging three different tables to create a result, click **Query visualizer**.  
   ![]({{ site.baseurl }}/images/partner-connect-query-visualizer.png "query visualizer")


### Best practices for data modeling

Here are some examples of how you can model your data to enhance searchability:

- Change column names
- Add synonyms for columns

In the following example, the _Sales_Dollar_Amount_ column was renamed to Sales and the synonyms of _Revenue_ and _Dollars_ were added.  
   ![]({{ site.baseurl }}/images/snow-model-best.png "search results")

These are just a couple of examples of things you can do.

For more information about data modeling, see: [Overview of data modeling settings]({{ site.baseurl }}/admin/data-modeling/data-modeling-settings.html)

## Creating a worksheet

A worksheet is a curated dataset built for ad-hoc analysis, that allows you to translate data from a database into the language of your business users.

Examples of things you can do in a worksheet include:
- Removing columns that aren't needed
- Adding data labels and synonyms
- Adding calculations, such as margin

The worksheet based on the Sales table on **try.thoughtspot.com** was created by doing the following:

1. Click **Data**.

2. Click the more options icon ![more options menu icon]({{ site.baseurl }}/images/icon-ellipses.png){: .inline}, and select **Create worksheet**.  
    ![]({{ site.baseurl }}/images/worksheet_create_icon.png)

3. Click the plus icon, next to Sources.  
   ![]({{ site.baseurl }}/images/worksheet_add_sources_link.png)

4. Check the box next to all five of the tables from the Retail dataset in your schema.  
   ![]({{ site.baseurl }}/images/partner-connect-tables-worksheet.png)

5. Make sure the default setting of **Apply joins progressively** is selected. This ensures that the search uses only the tables that are required.

6. Click **Close**.

7. In the Data view, click the name of the Customers table to reveal all of the columns in that table.

8. Double-click each column from the Customers table that you want to include in the worksheet.

   Include these columns:
   - Customer_Type
   - Customer Name
   - Customer_Gender
   - Customer Region
   - Customer State
   - Customer City
   - Customer Zip Code
   - Customer County

9. Use the same process to select columns from the other tables to include in the worksheet.

   From the Dates table, include this column:
   - Date

   From the Products table, include these columns:
   - Product_Description
   - Category_Description
   - Department_Description

   From the Sales table, include these columns:
   - Sales_Dollar_Amount
   - Cost_Dollar_Amount
   - Gross_Profit_Dollar_Amount

   From the Stores table, include these columns:
   - Store_Name
   - Store_Region
   - Store_State
   - Store_City
   - Store_Zip_Code
   - Store_County  
   ![]({{ site.baseurl }}/images/partner-connect-columns-worksheet.png)

   {% include note.html content="As a best practice, you would not select a key from a table when creating a worksheet, because you would not want to search for the key." %}

10. Click the pencil icon ![edit icon]({{ site.baseurl }}/images/icon-edit-20px.png){: .inline} next to the current name of your worksheet, enter the name **Retail Sales**, and click **Done**.  
    ![]({{ site.baseurl }}/images/partner-connect-worksheet-title.png)

11. Click the more options icon ![more options menu icon]({{ site.baseurl }}/images/icon-ellipses.png){: .inline}, and select **Save**.  
    ![]({{ site.baseurl }}/images/partner-connect-worksheet-save.png)

    Now, let's add a percent gross margin formula to the worksheet.   

12. Click **Edit Worksheet**.

13. Next to Formulas, click the plus icon ![plus icon]({{ site.baseurl }}/images/icon-add-20px.png){: .inline}.

14. In the formula window, do the following:
    1. In the top field, enter the formula title: **% Gross Margin**.
    2. In the next field, enter this formula:  
    ```
    sum ( gross_profit_dollar_amount ) / sum ( sales_dollar_amount ) * 100
    ```
    3. Click **Save**.  
    ![]({{ site.baseurl }}/images/partner-connect-worksheet-formula.png)    

15. Save the worksheet with the formula added, by clicking the more options icon ![more options menu icon]({{ site.baseurl }}/images/icon-ellipses.png){: .inline}, and selecting **Save**.

16. Click **Data**, and click the Retail Sales worksheet.

17. In the Columns view, make sure that the % Gross Margin formula has the following settings:
    - For DATA TYPE: **DOUBLE**
    - For COLUMN TYPE: **MEASURE**
    - For AGGREGATION: **AVERAGE**

18. Save the worksheet with the updated formula settings, by clicking the more options icon ![more options menu icon]({{ site.baseurl }}/images/icon-ellipses.png){: .inline}, and selecting **Save**.


### Best practices for worksheets

The best practices for data modeling also apply to worksheets.

The example here includes:

- Changed column names
- Synonyms for columns
- % Gross Margin formula  
![]({{ site.baseurl }}/images/partner-connect-worksheet-best.png)

### Adding a currency and geo map to a worksheet

To further enhance the usability of a worksheet, you can add a specific currency type to monetary values, and a geographic map to regions in your data.

Using the Retail Sales worksheet example, here's how geo maps and currency could be added:

1. Click **Data**, and click the **Retail Sales** worksheet.

2. In the Columns view, find the Sales column and click **None** in the Currency Type column.

3. In the Specify Currency Type window, select **Specify ISO Code** and, then select **USD** from the drop-down menu.  
   ![]({{ site.baseurl }}/images/partner-connect-currency.png)

4. In the Columns view, find the Store_State column, and click **None** in the Geo Config column.

5. In the Specify Geographic Configuration window, select **Specify Sub-nation region**, keep the default country of United States, and then select **State**.  
   ![]({{ site.baseurl }}/images/partner-connect-geo-config.png)

6. Click **Save Changes**.

   Now that both currency and geographic types are set, you can see those changes reflected when you search the Retail Sales worksheet.

7. Click **Search**.

8. Click **Choose sources**.

9. Deselect any tables previously selected (if needed), select only the **Retail Sales** worksheet, and click **Close**.

10. In the search bar, enter: **sales** **store state** and press tab.

    The initial search results appear, but without labels for each state.  
    ![]({{ site.baseurl }}/images/partner-connect-geo-curr-search-nolabels.png)

    The final step is to add the labels.

11. Click the Edit chart configuration icon ![gear icon]({{ site.baseurl }}/images/icon-gear-20px.png){: .inline}

12. In the Customize panel, click the **Total Sales** tile.

13. In the Edit column panel, select the **Data Labels** checkbox.

    Now in the search results, you can see labels with the state name and total sales in US dollars.  
    ![]({{ site.baseurl }}/images/partner-connect-geo-curr-search.png)

## Related information

- [ThoughtSpot in Snowflake Partner Connect]({{ site.baseurl }}/data-integrate/embrace/embrace-snowflake-partner.html)
- [Embrace overview]({{ site.baseurl }}/data-integrate/embrace/embrace-intro.html)
- [Add a Snowflake connection]({{ site.baseurl }}/data-integrate/embrace/embrace-snowflake-add.html)
- [Modify a Snowflake connection]({{ site.baseurl }}/data-integrate/embrace/embrace-snowflake-modify.html)
