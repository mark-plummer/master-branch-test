---
title: [Delete a data source]

last_updated: tbd
summary: "How to prepare for and delete a data source using the ThoughtSpot application."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

There are two separate ways to delete a data source, through the browser or [through TQL](check-dependencies-tql.html#) describes the dependency checking that occurs when deleting or changing a table using TQL. When you want to delete a data source, you first need to handle any dependent objects that have been built on top of it. You can easily see these dependencies, and choose how to handle them before deleting the data source.


## Check data source dependencies

You can see all of the dependencies for any data source (worksheet or table) on the **Data** page.

To view dependent objects for a data source:

1. Click **Data** on the top navigation bar.

2. Click the name of the data source whose dependencies you want to view.

3. Click **Dependents**.

    You will see a list of the names of the dependent objects (worksheets and pinboards), and the columns they use from that data source. You can use this information to determine the impact of changing the structure of the data source or to see how widely it is used.

     ![]({{ site.baseurl }}/images/dependents.png "List of dependent objects")

4. Click a dependent object to modify or delete it.

    If you want to remove the dependency by modifying the dependent object, you must remove all search terms or columns that refer back to the data source you are trying to delete.

5. When all dependencies have been removed, you will be able to go back and delete the data source.

## Delete a data source

You can delete data sources from the browser, as long as they were not created
by an administrator through `tsload`.

You can delete data sources from the browser if they were created in the
browser. These types of data sources include:

-   Data imported from the browser.
-   Worksheets.

ThoughtSpot checks for dependencies whenever you try to delete a table or worksheet.

1. Click **Data** on the top navigation bar.

2. Check the box next to the name of the data source you want to delete.

3. Click the delete icon.

     ![]({{ site.baseurl }}/images/delete_data_worksheet.png "Delete a data source")

4. If you attempt to delete a data source with dependent objects, the operation will be blocked.

   You will see a list of dependent objects with links.

     ![]({{ site.baseurl }}/images/dependency_warning_with_links.png "Warning message when trying to delete an object with
                                dependencies")

5. Click a dependent object to modify or delete it.

    If you want to remove the dependency by modifying the dependent object, you must remove all search terms or columns that refer back to the data source you are trying to delete.

6. When all dependencies have been removed, you will be able to go back and delete the data source.
