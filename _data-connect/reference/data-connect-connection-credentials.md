---
title: [Connectors reference]
summary: Learn about the supported source connectors for Data Connect.
last_updated: 11/19/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Here is a list of all of the source connectors, and their connection credentials, that are supported in ThoughtSpot Data Connect. As you create a new connection, you need specific connection information to enter into the create connection dialog box. You can find more detailed information for each of the connection types that ThoughtSpot Data Connect supports.


## Amazon S3

- Connection name: Required. Enter a new Amazon S3 connection name.
- Access Key: Enter the access key ID used to access the Amazon account resources. This is required if you do not use AWS Identity and Access Management (IAM) authentication.
- Secret Key: Enter the secret access key used to access the Amazon account resources. This value is associated with the access key and uniquely identifies the account. You must specify this value if you specify the access key ID.
- Folder Path: Required. Enter the complete path to the Amazon S3 objects. You must include the bucket name and any folder name. For example, `<bucket name>/<my folder name>`.
- Master Symmetric Key: Provide a 256-bit AES encryption key in the Base64 format when you enable client-side encryption. You can generate a key using a third-party tool.
- Code Page: Required. Choose either MS_1252 or UTF_8 from the dropdown menu. The code page should be compatible with the Amazon S3 source.
- Region Name: Required. Make a selection from the dropdown menu, which includes US East (N. Virginia), US West (N. California), and US West (Oregon). This is where the Amazon S3 bucket is available.

## Hive (Hadoop)

- Connection name: Required. Enter a new Hadoop connection name.
- Username: Required. Enter the username of the schema of the Hadoop component.
- Password: Required. Enter the password of the schema of the Hadoop component.
- JDBC Connection URL: Enter the JDBC URL to connect to the Hadoop component.
- Driver: Enter the JDBC driver class to connect to the Hadoop component.
- Commit Interval: Enter the batch size, in rows, to load data to Hive.
- Hadoop Installation Path: Enter the installation path of the Hadoop component.
- HDFS Installation Path: Enter the HDFS installation path.
- HBase Installation Path: Enter the HBase installation path.
- Implala Installation Path: Enter the Implala installation path.
- Miscellaneous Library Path: Enter the library that communicates with Hadoop.
- Enable Logging: Choose whether to enable logging to enable the log messages.

## JDBC

- Connection name: Required. Enter a new JDBC connection name.
- JDBC Connection URL: Required. Enter the URL schema for the database. Use the corresponding schema for the following databases:
    - Microsoft SQL Server. `jdbc:sqlserver://<Host>\<Instance>:<Port>;databaseName=<Database>`
    - MySQL. `jdbc:mysql://<Host>:<Port>/<Database>`
    - Oracle. `jdbc:oracle:thin:@//<Host>:<Port>/<Service>`
    - PostgreSQL. `jdbc:postgresql://<Host>:<Port>/<Database>`
- JDBC Jar Directory: Enter the path to the JDBC driver jar file. For example, you can enter the following directory: `C: /jdbc`. When you do not specify a directory path, the Secure Agent obtains the jar file from the directory that is specified in the `CLASSPATH` system variable.
- JDBC Driver Class Name: Enter the JDBC driver class name if you are using a JDBC driver without auto class load feature. If you do not specify this property, the Secure Agent loads the driver class name from the JDBC jar file.
- Schema: Enter the schema name, which varies by database. Use the following guidelines for the schema name:
    - Microsoft SQL Server. Use the schema name to specify the correct object.
    - MySQL. The schema name is the database name.
    - Oracle. The schema name is the user name.
    - PostgreSQL. Use the schema name to specify the correct object.
        You must enter a schema name to fetch metadata if the JDBC connection URL does not provide enough context.
- Username: Required. Enter the JDBC account username.
- Password: Required. Enter the JDBC account password.

## Jira

- Connection name: Required. Enter a new JIRA connection name.
- Username: Required. Enter the JIRA account username.
- Password: Required. Enter the JIRA account password.
- URL: Required. Enter the base JIRA URL of the JIRA instance you want to connect to. For example, `https://<your_company_name>.atlassian.net/`.

## MySQL

- Connection name: Required. Enter a new MySQL connection name.
- Username: Required. Enter the MySQL account username.
- Password: Required. Enter the MySQL account password.
- Host: Required. Enter the host number. For example, `192.156.3.123`.
- Port: Required. Enter the port number. For example, `3305`.
- Database Name: Required. Enter the database name you want to connect to.
- Code Page: Required. Choose either `MS_1252` or `UTF_8` from the dropdown menu. The code page should be compatible with the MySQL source.

## ODBC

- Connection name: Required. Enter a new ODBC connection name.
- Username: Required. Enter the ODBC account username.
- Password: Required. Enter the ODBC account password.
- Data Source Name: Required. Enter the system DSN.
- Schema: Enter the schema used for the source or target.
- Code Page: Required. Choose the code page type from the dropdown menu. This is the code page of the database server.
- odbcSubtype: Choose the odbcSubtype from the dropdown menu. This categorizes the type of the connection so that pushdown optimization support can be enabled. Default is Other.

## Oracle

- Connection name: Required. Enter a new Oracle connection name.
- Username: Required. Enter the Oracle account username.
- Password: Required. Enter the Oracle account password.
- Host: Required. Enter the host number. For example, `192.156.3.123`.

  {% include note.html content="If your connection fails, check if the Single Client Access Name (SCAN) feature is enabled on the Oracle Database. Informatica drivers cannot establish connectivity with the database if this feature is enabled. SCAN is a domain name registered to at least one and up to three IP addresses, either in Domain Naming Service (DNS) or Grid Naming Service (GNS). If in DNS, configure only two servers. ThoughtSpot does not support configuration of three DNS servers. To resolve this issue, get the Virtual IP of the Oracle Database and its corresponding hostname using nslookup on IP. Use this host name in the connection properties." %}

- Port: Required. Enter the port number. For example, `3305`.
- Service Name: Required. Enter the service name. You can find the service name by connecting to the server as "system" using SID, then executing the query: `select value from v$parameter where name like '%service_name%';`.
- Schema: Required. Enter the schema you want to connect to.
- Code Page: Required. Choose either `MS_1252` or `UTF_8` from the dropdown menu. The code page should be compatible with the Oracle source.

## SalesForce

- Connection name: Required. Enter a new Salesforce connection name.
- Username: Required. Enter the Salesforce account email address.
- Password: Required. Enter the Salseforce account password.
- Security Token: Required. Enter the security token generated from the Salesforce application. If your account requires a security token and you don't have one, you can generate or reset a security token. After logging in to the Salesforce web site, click **Setup** \> **My Personal Information** \> **Reset My Security Token**.
- Service URL: Required. Enter the Salesforce service URL. You can use the following versions of the Salesforce API:
    - Version 31. Salesforce connection uses the following service URL by default: `https:// login.salesforce.com/services/Soap/u/31.0`
    - Version 33. You can enter the following service URL to use version 33 of the Salesforce API in the connection: `https://login.salesforce.com/services/Soap/u/33.0`
    - Version 34. You can enter the following service URL to use version 34 of the Salesforce API in the connection: `https://login.salesforce.com/services/Soap/u/34.0`
    - Version 35. You can enter the following service URL to use version 35 of the Salesforce API in the connection: `https://login.salesforce.com/services/Soap/u/35.0`
    - Version 36. You can enter the following service URL to use version 36 of the Salesforce API in the connection: `https://login.salesforce.com/services/Soap/u/36.0`

## SQL Server

- Connection name: Required. Enter a new SQL Server connection name.
- Server Version: Required. Make a selection from the dropdown menu, which includes SQL Server 2000, 2005, 2008, and 2012.
- Username: Required. Enter the SQL Server account username.
- Password: Required. Enter the SQL Server account password.
- Host: Required. Enter the host number. For example, `192.156.3.123`.
- Port: Required. Enter the port number. For example, `3305`.
- Instance Name: Enter the instance name.
- Database Name: Required. Enter the database name you want to connect to.
- Schema: Enter the schema you want to connect to.
- Code Page: Required. Choose either MS_1252 or UTF_8 from the dropdown menu. The code page should be compatible with the SQL Server source.

## Teradata

- Connection name: Required. Enter a new Teradata connection name.
- Username: Required. Enter the Teradata account username.
- Password: Required. Enter the Teradata account password.
- Schema: Required. Enter the schema you want to connect to.
- JDBC Connection URL: Required. Enter the JDBC connection URL that you want to connect to. For example, `jdbc:teradata://capri1.teradata.ws`.
- JDBC Jar Directory: Required. Enter the JDBC jar directory that you want to connect to. For example, `/home/admin/pr_temp/jdbc/Teradata`.

## Zendesk

- Connection name: Required. Enter a new Zendesk connection name.
- Username: Required. Enter the Zendesk account email address.
- Password: Required. Enter the Zendesk account password.
- Zendesk Sub-Domain: Required. Enter the URL of the Zendesk account. For example, `https://informaticabusinesssolutionhelp.zendesk.com/api/v2`.
