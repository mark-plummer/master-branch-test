The first step in loading data is to obtain or create one or more CSV files that contain the data to be loaded into ThoughtSpot.
CSV is a common format for transferring data between databases. ThoughtSpot requires this format.  

Most applications such as Microsoft Excel or Google Sheets can output CSV formatted files. If your source is an Excel spreadsheet or Google Sheet:

1. Save, export, or download the file in CSV format.
   The exact procedure you use will depend on the source application.
2. Review the file's format before uploading it to ThoughtSpot.

    Your source data may be in another database. If this is the case, your company's ETL (extract, transform, load) process will typically generate CSV files. If your source is another database:

3. Connect to the source database.
4. Extract each table you wish to import into ThoughtSpot as a CSV file.

   The column delimiter should be a `,` (comma), `|` (pipe), or tab.
