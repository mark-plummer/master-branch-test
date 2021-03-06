A CSV file contains a delimiter that marks the separation between fields in the data. The delimiter is usually comma, but it can be any character.
The file also contains fields optionally enclosed with double quotes. Use these guidelines when creating the CSV file:

-   If the CSV contains column headers, they must match the column names in the database exactly.
-   Often a `|` (pipe) or tab is used as the delimiter, because it may be less likely to occur within the data values.
-   When a field contains a double quote, it must be escaped with the character specified in the escape character argument in `tsload`.
-   When a field contains the delimiter, the field must be enclosed in double quotes.

ThoughtSpot supports a wide range of date and timestamp formats (See https://docs.thoughtspot.com/6.0/reference/date-formats-for-loading.html#) in the CSV file. Blank values in user uploaded CSV files are interpreted as NULL values. These include the values (case insensitive):

-   `NULL`
-   `\N`
-   `NA`
-   `N/A`
-   [space]

If you are appending data to an existing schema or table, columns in the CSV file must be in the same order as defined in the target table.
