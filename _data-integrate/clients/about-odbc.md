---
title: [Overview of the ODBC Driver]

last_updated: tbd
summary: "Use the ODBC driver to bring data in from your ETL tool or database."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
ThoughtSpot comes packaged with an ODBC (Open Database Connectivity) driver, so
that you can transfer data between ThoughtSpot and other databases. Basic
knowledge of ODBC data source administration is helpful when setting up ODBC.

Supported operating systems for the ODBC driver are:

-   Microsoft Windows 32-bit
-   Microsoft Windows 64-bit
-   Linux 32-bit
-   Linux 64-bit

## Version compatibility and connection parameters

To ensure compatibility, always use the ODBC driver with the same version number
as the ThoughtSpot instance to which you are connecting. You can make a secure
ODBC connection to the ThoughtSpot database by configuring a user and password
combination with the driver.  For detailed information about connection parameters, see the [ODBC and JDBC configuration properties]({{ site.baseurl }}/data-integrate/reference/simba-settings.html#)

## Supported Data Types

The ODBC driver supports these data types:

-   `INT`
-   `BIGINT`
-   `BOOLEAN`
-   `DOUBLE`
-   `FLOAT`
-   `DATE`
-   `TIME`
-   `TIMESTAMP`
-   `DATETIME`
-   `CHAR`
-   `VARCHAR`

## Source and target data compatibility

By default, ThoughtSpot takes a permissive approach to data type compatibility
between source and target data in ODBC. In this mode, ThoughtSpot _assumes_ that
the incoming data matches exactly with the target data types and loads the table
as is.

Alternatively, you can explicitly require that ThoughtSpot match the source data
types exactly and, if it can't find a match, it returns an error and the data
load fails. In this mode, for example, if the target ThoughtSpot data type for a
column is INT, the source data type for that column must be INT in order for the
data load to succeed.

By toggling _**strict**_ and _**permissive**_ `true` and `false` options, you
can configure settings along a scale of behavior between the permissive,
automatic approach and the strictness of the "must match" approach.

<table>
  <tr style="background-color:white;">
    <th colspan="2" rowspan="2"></th>
    <th colspan="2" style="background-color:white;">Strictness</th>
  </tr>
  <tr style="background-color:white;border-bottom:1pt solid black;">
    <td>true</td>
    <td>false</td>
  </tr>
  <tr style="background-color:white;">
    <th rowspan="2" style="valign:middle;background-color:white;"><div class="vert">Permissiveness</div></th>
    <td>true</td>
    <td>Data types are inferred and automatically converted. ThoughtSpot returns an error in cases where the data conversion is not possible. Data load fails in its entirety if any data contains mismatches. You must correct the problem in the source data and try the load again.</td>
    <td>Data types are inferred and automatically converted. No error is thrown even if source and target data types don’t match. Data load continues even when the source and target data types don’t match. This means your data load may contain data types that you do not intend or that are not helpful.  You are responsible for checking and validating the data in this case.</td>
  </tr>
  <tr>
    <td>false</td>
    <td>The source and target data types must match. If any data contains mismatches, ThoughtSpot returns an error to the client a data load fails in its entirety. You must correct the problem in the source data and try the load again.<br><br>This is the strictest configuration.</td>
    <td>No data types are inferred and conversion does not check for matches. This is the most permissive configuration.</td>
  </tr>
</table>

<p>Your customer support engineer can assist you in configuring custom ODBC
behavior. Regardless of the configuration you choose, you
must validate that the results of data loading <i>as they appear</i> in ThoughtSpot
are what you require.</p>


## Data type conversion matrix

<p>The following table describes the conversion matrix between SQL data types and
ThoughtSpot data types.</p>


| Source SQL Data Types          |BOOL |INT32 |INT64 |DOUBLE |FLOAT | CHAR |DATE | TIME |DATETIME|
|-------------------------------|-----|------|------|-------|------|------|-----|------|--------|
|`SQL_BIT`                      | Y   |  Y   |  Y   |  Y    |  Y   |  Y   | --  |  --  | -- |
|`SQL_TINYINT`                  | Y   |  Y   |  Y   |  Y    |  Y   |  Y   | --  |  --  | -- |
|`SQL_SMALLINT`                 | Y   |  Y   |  Y   |  Y    |  Y   |  Y   | --  |  --  | -- |
|`SQL_INTEGER`                  | Y   |  Y   |  Y   |  Y    |  Y   |  Y   | --  |  --  | -- |
|`SQL_BIGINT`                   | Y   |  Y   |  Y   |  Y    |  Y   |  Y   | --  |  --  | -- |
|`SQL_CHAR`                     | Y   |  Y   |  Y   |  Y    |  Y   |  Y   | Y   |  Y   |   Y    |
|`SQL_VARCHAR`                  | Y   |  Y   |  Y   |  Y    |  Y   |  Y   | Y   |  Y   |   Y    |
|`SQL_LONGVARCHAR`              | Y   |  Y   |  Y   |  Y    |  Y   |  Y   | Y   |  Y   |   Y    |
|`SQL_BINARY`                   | --  |  --  | -- | -- |  --  | Y   | --  |  --  | -- |
|`SQL_VARBINARY`                | --  |  --  | -- | -- |  --  | Y   | --  |  --  | -- |
|`SQL_LONGVARBINARY`            | --  |  --  | -- | -- |  --  | Y   | --  |  --  | -- |
|`SQL_DOUBLE`                   | Y   |  Y   |  Y   |  Y    |  Y   |  Y   | --  |  --  | -- |
|`SQL_REAL`                     | Y   |  Y   |  Y   |  Y    |  Y   |  Y   | --  |  --  | -- |
|`SQL_FLOAT`                    | Y   |  Y   |  Y   |  Y    |  Y   |  Y   | --  |  --  | -- |
|`SQL_NUMERIC`                  | Y   |  Y   |  Y   |  Y    |  Y   |  Y   | --  |  --  | -- |
|`SQL_GUID`                     | --  |  --  | -- | -- |  --  | Y   | --  |  --  | -- |
|`SQL_INTERVAL_MINUTE_TO_SECOND`| --  |  --  | -- | -- |  --  | Y   | --  |  --  | -- |
|`SQL_INTERVAL_HOUR_TO_SECOND`  | --  |  --  | -- | -- |  --  | Y   | --  |  --  | -- |
|`SQL_INTERVAL_HOUR_TO_MINUTE`  | --  |  --  | -- | -- |  --  | Y   | --  |  --  | -- |
|`SQL_INTERVAL_DAY_TO_SECOND`   | --  |  --  | -- | -- |  --  | Y   | --  |  --  | -- |
|`SQL_INTERVAL_DAY_TO_MINUTE`   | --  |  --  | -- | -- |  --  | Y   | --  |  --  | -- |
|`SQL_INTERVAL_DAY_TO_HOUR`     | --  |  --  | -- | -- |  --  | Y   | --  |  --  | -- |
|`SQL_INTERVAL_YEAR`            | --  |  Y   |  Y   | -- |  --  | Y   | --  |  --  | -- |
|`SQL_INTERVAL_MONTH`           | --  |  Y   |  Y   | -- |  --  | Y   | --  |  --  | -- |
|`SQL_INTERVAL_DAY`             | --  |  Y   |  Y   | -- |  --  | Y   | --  |  --  | -- |
|`SQL_INTERVAL_HOUR`            | --  |  Y   |  Y   | -- |  --  | Y   | --  |  --  | -- |
|`SQL_INTERVAL_MINUTE`          | --  |  Y   |  Y   | -- |  --  | Y   | --  |  --  | -- |
|`SQL_INTERVAL_SECOND`          | --  |  Y   |  Y   | -- |  --  | Y   | --  |  --  | -- |
|`SQL_TYPE_TIME`                | --  |  --  | -- | -- |  --  | Y   | --  |  Y   |   Y    |
|`SQL_TYPE_DATE`                | --  |  --  | -- | -- |  --  | Y   | Y   |  --  |  Y    |
|`SQL_TYPE_TIMESTAMP`           | --  |  --  | -- | -- |  --  | Y   | Y   |  Y   |   Y    |


If a conversion is not possible, an error is returned to the client to indicate
conversion failure. The ETL tool must add a data transformation step if the
source column data type does not exactly match the target's ThoughtSpot
column data type. The driver does not do any implicit conversions.
