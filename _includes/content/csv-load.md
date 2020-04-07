Any user who belongs to a group that has the privilege **Has administration privileges** or **Can upload user data** can upload their own data from the browser. To load the CSV or Excel file into ThoughtSpot:

1. Log in to ThoughtSpot from a browser.

2. Click **Data**, on the top navigation bar.

3. Click the ellipses icon
![more options menu icon]({{ site.baseurl }}/images/icon-ellipses.png){: .inline},
in the upper right corner, and select **Upload Data**.

   ![]({{ site.baseurl }}/images/new_imported_data.png "Upload data")

4. Upload the CSV or Excel file by doing one of these options:
    1. Click **Browse your files** and select the file.
    2. Drag and drop the file into the drop area.

5. Answer the question **Are the column names already defined in the file header?**

6. Answer the question **Are the fields separated by?** Click **Next**.

7. Click the column header names to change them to more useful names, if you'd like. Click **Next**.

8. Review the automatically generated data types for each column, and make any changes you want.

   There are four data types: Text, Integer, Decimal, and Date.

9. Click **Import**.

    When an upload is complete, the system reports the results and offers you some further actions.

     ![]({{ site.baseurl }}/images/spotiq-upload.png "Auto analyze")

    * Click **Link to Existing Data** if you want to link the data you uploaded to the data in another table or worksheet.
    * Click **Search** if you want to begin a new search.
    * Click **Auto analyze** if you want to use the SpotIQ feature to find insights in your new data.
