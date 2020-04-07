---
title: [Upload and run a SQL script]

last_updated: tbd
summary: "Importing a schema through the Web browser makes it possible to run your SQL script without needing to have a Linux login."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can run a SQL script to create your database schema through the browser, without having to log in to the shell on the ThoughtSpot instance. You can edit the script and run it directly in the browser to create the schema. You can use this capability in any of these ways:

-   [Create the SQL script ahead of time](create-schema-with-script.html#), and use the browser to run it.
-   Use the editor to type your SQL directly into the browser.
-   Use the browser SQL interface as an interactive SQL editor, for example to test an existing script or make changes to an existing schema.

1. Log in to ThoughtSpot from a browser.

2. Click **Data**, on the top navigation bar.

3. Click the ellipses icon ![more options menu icon]({{ site.baseurl }}/images/icon-ellipses.png){: .inline}, and select **Upload schema**.

     ![]({{ site.baseurl }}/images/import_schema.png "Upload schema")

4. Drag and drop your SQL file into the browser, or choose **Browse Your Files** to locate it.
5. You're now in the SQL editor. Use it to view your script and make any changes.

     ![]({{ site.baseurl }}/images/SQL_editor.png "Import schema")

6. When ready, run your script by clicking the **Execute** button.
7. If there are any errors, correct them and run the script again.
