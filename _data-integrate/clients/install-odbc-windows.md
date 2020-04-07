---
title: [Install the ODBC driver on Windows]

last_updated: tbd
summary: "Use this procedure to obtain the Microsoft Windows ODBC driver and install it."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

ThoughtSpot's ODBC connection relies on the <a
href="https://www.simba.com/products/SEN/doc/Client-Server_user_guide/content/clientserver/configuringsimbaclientodbc/simbaclientodbcunix.htm">SimbaEngine
X SDK</a> to connect through ODBC or JDBC to ThoughtSpot's remote data stores. The
instructions on this page explain how to configure the Simba ODBC driver on a
Windows workstation.

Make sure you have read the overview material in the [ODBC driver overview]({{
site.baseurl }}/data-integrate/clients/about-odbc.html#). This workstation is
the same machine where you plan to run your ETL activities.

## Prerequisites

These instructions include directions to use the `ssh` command. Make sure your
Windows workstation is equipped with a tool <a href="https://www.putty.org/">such as Putty</a> for making `ssh`
connections to your ThoughtSpot server.


The ODBC driver for Windows requires Visual C++ Redistributable for Visual
Studio 2013. You are prompted to install it during installation of the driver if
it isn't already installed.  

![]({{ site.baseurl }}/images/windows-odbc-cplusplus.png "C++ requirement")

To check if this Microsoft tool is already installed, search for it on your workstation.

![]({{ site.baseurl }}/images/odbc-windows-search-0.png "Search for tool")

If it isn't installed, make sure you <a href="https://www.microsoft.com/en-us/download/details.aspx?id=40784">download and install it</a> before continuing.


## Check the ThoughtSpot IP and the simba_server status

{% include content/simba-server-start.md %}

## Download the driver

On the workstation where you want to connect from, do the following:

1. Navigate to the [**Downloads**]({{ site.baseurl }}/release/downloads.html#) page.
2. Download the **ODBC Driver for Windows**.
3. Unzip the file you downloaded at a convenient location on your workstation.

   ![]({{ site.baseurl }}/images/odbc-windows-extract.png)

8. Take a moment to examine the contents of the new directory.

    There are two different Windows ODBC installers included in the file you downloaded.
     -   ThoughtSpotODBC (x86).msi for Windows 32-bit
     -   ThoughtSpotODBC (x64).msi for Windows 64-bit

## Install the driver and supporting software

The installation process installs the Simba driver and adds the ODBC
Administrator software to your workstation. You use this software to configure
the driver.

1. Launch the installer for your version of Windows.
2. Click **Next** to continue.

   ![]({{ site.baseurl }}/images/odbc_install_1.png "The ODBC Installer")

3. Accept the End User License Agreement (EULA), and click **Next**.
4. Specify the destination folder where the driver will be installed.

   ![]({{ site.baseurl }}/images/odbc_install_3.png "Enter the destination folder")

5. Enter the ThoughtSpot server details, and click **Next**.

   ![]({{ site.baseurl }}/images/odbc_install_4.png "Enter server and database for ODBC")

    - For **Server(s)**, provide a comma separated list of the IP addresses of each node on the ThoughtSpot instance.

    - For **Database**, optionally specify the database to use. If you skip this entry, you must provide the database each time you connect using ODBC.

6. Confirm that the install can begin by clicking **Install**.

7. You may see a security warning.

    ![]({{ site.baseurl }}/images/windows_ODBC_install.png "Allow the ODBC Installer to run")

8. Click **Yes** to continue.

    A confirmation message appears when the installation is complete.

    ![]({{ site.baseurl }}/images/odbc_install_6_install_completed.png "Installation was successful")

9.  Click **Finish**.


## Configure the driver and test your connection

After installation completes, use the ODBC Administrator to configure the
ODBC connection on your Windows workstation. For example, you may want to add
a default schema or change the server IP address or the default database.

It is recommended to add a default schema. If you don't specify a default
schema, you must supply it every time you use the ODBC driver.

At this point, you can test your ODBC connection to ThoughtSpot.  It is important
to recall that the username/password you use belongs to a ThoughtSpot application
user. Typically, this user is a user with data management or administrative
privileges on the application.

1. Before trying the ODBC connection, confirm a username/password that can log in to the ThoughtSpot applications.
2. Click the **Data** tab, and confirm the user's privileges.
3. Return to your workstation.
4. Locate and open the **ODBC Data Source Administrator (64-bit)** application.

   ![]({{ site.baseurl }}/images/odbc-windows-search.png "System DSN")

5. Click the **System DSN** tab.

   ![]({{ site.baseurl }}/images/odbc-system-dsn.png "System DSN")

6. Select **ThoughtSpot** and click **Configure...**

   ![]({{ site.baseurl }}/images/odbc-configure-dialog.png "Configure")

7. Click **Options...**

8. Ensure you have the following **Custom Property** values set:

    | Custom Property   | Value                                                  |
    |-------------------|--------------------------------------------------------|
    | `SCHEMA`          | `falcon_default_schema` is the default                |
    | `UID`             | The username of a user with data management privilege. |
    | `PWD`             | The password for the username you specify.             |

    You don't have to use the ThoughtSpot default schema. You can specify your own.
    We recommend that you define a default schema. Otherwise, you must supply a schema
    every time you use the ODBC driver. Moreover, without a schema (or if the
    schema is not present), the ODBC driver returns an error that states that the schema
    could not be found.

    Similarly, adding the `UID` and `PWD` properties are not required. If you
    don't add them, you are prompted to supply them each time you connect.

    When you are done, your options should look similar to the following:

    ![]({{ site.baseurl }}/images/windows-odbc-options.png "Options")

9. When you are done, click **OK** to save your new properties.
10. Click **Test Connection** to test your database connection.

    ![]({{ site.baseurl }}/images/windows-odbc-success.png "Success")

11. Click **Cancel** to close the **DSN Configuration** dialog.
12. Click **OK** to close the **Client Configuration Dialog** the dialog.
13. Click **OK** to close the **ODBC Data Source Administrator (64-bit)** application.

Now, you are ready to begin using the connection you've configured.


## Related information

* [Enable ODBC logs]({{ site.baseurl}}/data-integrate/troubleshooting/enable-ODBC-log.html).
* [Configure multiple connections on Windows]({{ site.baseurl}}/data-integrate/clients/multiple-sources-windows.html).
