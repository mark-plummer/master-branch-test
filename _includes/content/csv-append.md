You can append data to your existing system tables through the ThoughtSpot application, even if the tables were initially loaded using `tsload`. The CSV file must have the same structure as the table it is being loaded into, including number and type of columns, in the same order as the target table.

To append data into ThoughtSpot:

1.   Log in to ThoughtSpot from a browser.
2.   Click **Data** on the top navigation bar.

     ![]({{ site.baseurl }}/images/data_icon.png "Data")

3.   Click the name of the table you would like to append data to.
4.   Click the **Load Data** button.

     ![]({{ site.baseurl }}/images/load_data_icon_2.png "Load data")

5. Upload the CSV or Excel file by doing one of these options:
    -   Click **Browse your files** and select the file.
    -   Drag and drop the file into the drop area.
6. Answer the question **Are the column names already defined in the file header?**.
7. For the question **Do you want to append to the existing data or overwrite it?**, select **Append**.
8. Answer the question **Are the fields separated by?**, and click **Next**.
9.  Click **Upload**.
10.  Click **Link to existing data** if you want to link the data you uploaded to the data in another table or worksheet. Or click **Ask a question** if you want to begin a new search.
