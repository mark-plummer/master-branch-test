---
title: [Use the JDBC Driver]

last_updated: tbd
summary: "How to configure the JDBC driver. "
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

ThoughtSpot's ODBC connection relies on the <a
href="https://www.simba.com/products/SEN/doc/Client-Server_user_guide/content/clientserver/configuringsimbaclientodbc/simbaclientodbcunix.htm">SimbaEngine
X SDK</a> to connect through ODBC or JDBC to ThoughtSpot's remote data stores. The
instructions on this page explain how to configure the JDBC driver.

The ThoughtSpot JDBC driver is supplied by a `.jar` file you install on a
workstation. This workstation is the same machine where you plan to run your ETL
activities.

## JDBC configuration parameters

| Information | Description |
|-------------|-------------|
|Driver name | `com.simba.client.core.jdbc4.SCJDBC4Driver` |
|Server IP address | The ThoughtSpot appliance URL or IP address.|
|Simba port | The simba port, which is `12345` by default.|
|Database name | This is not the machine login username. The ThoughtSpot Database name to connect to.|
|username | The name of a ThoughtSpot user with administrator permissions.|
|password | The password of a ThoughtSpot application user. This is not the machine or SSH userpassword. |

For more JDBC configuration options, see also:

* [JDBC properties reference]({{ site.baseurl }}/data-integrate/reference/simba-settings.html#properties-reference) in this ThoughtSpot documentation

*  [SimbaClient for JDBC Configuration Properties reference ](https://www.simba.com/products/SEN/doc/Client-Server_user_guide/content/clientserver/configuringsimbaclientjdbc/simbaclient_jdbcconfigurationoptions.htm)

## Check the ThoughtSpot IP and the simba_server status

{% include content/simba-server-start.md %}


## Install the driver

The JDBC driver is a `.jar` packaged application. To use the package, you download it, install it

1. Log in to the local machine where you want to install the JDBC driver.
2. Click [**Here**]({{ site.baseurl }}/release/downloads.html) to download the JDBC driver.
3. Click **JDBC Driver** to download the file `thoughtspot_jdbc<version>.jar`.
4. Move the driver to the desired directory on your local machine.
5. Add the downloaded JDBC driver to your Java class path on the local machine.

## Write your application

Using JDBC with ThoughtSpot is the same as using any other JDBC driver with any
other database. You must provide the connection information, create a
connection, execute statements, and close the connection.

Specify each of the nodes in the cluster in the connection string, as shown.
This enables high availability for JDBC connections. To find out the nodes in
the cluster, you can run the command `tscli node ls` from the Linux shell on the
ThoughtSpot instance.

The format for the connection is:

```
jdbc:simba://<node1>:12345,<node2>:12345,<node3>:12345[,…];
           LoginTimeout=<seconds>;DATABASE=<db>;SCHEMA=<schema>
```

For example:

```
jdbc:simba://192.168.2.248:12345,192.168.2.249:12345,192.168.2.247:12345;
           LoginTimeout=5;DATABASE=test;SCHEMA=falcon_default_schema
```

As shown, the `DATABASE` and `SCHEMA` parameters need to be in all caps. For the `simba` JDBC driver to work with Spark, the `DATABASE` and `SCHEMA` must be specified in the URL. They cannot be specified as a name/value pair as a map or property. For example:

```
val tssqldf1 = sparkSession.read.format("jdbc").options(Map("url" ->
"jdbc:simba://10.84.78.181:12345;DATABASE=movieratings;SCHEMA=falcon_default_schema", "driver" ->
"com.simba.client.core.jdbc4.SCJDBC4Driver", "dbtable" -> "Movies", "user" ->
"tsadmin", "password" -> "admin")).load()
```


This `InsertData.java` example shows how to use ThoughtSpot with JDBC. This is an example of a reference JDBC application:

```
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertData {

  // JDBC class to use.
  private static final String DB_DRIVER = "com.simba.client.core.jdbc4.SCJDBC4Driver";
  // jdbc_example should be an existing database.

  private static final String DB_CONNECTION = "jdbc:simba://192.168.2.129:12345;
     192.168.2.249:12345,192.168.2.247:12345;
     LoginTimeout=5;DATABASE=jdbc_example;SCHEMA=falcon_default_schema";

  private static final String TABLE_NAME = "jdbc_example";
  private static final String DB_USER = "<username>";
  private static final String DB_PASSWORD = "<password>";

  // Assuming everything in local directory use:
  //   javac InsertData.java
  //   java -cp .:thoughtspot_jdbc4.jar InsertData
  public static void main(String[] argv) {

    try {
      insertRecordsIntoTable();
    }
    catch (SQLException e) {
      System.out.println(e.getMessage());
    }
  }

  /**
   * Insert some records using batch updates.
   *  Assumes a table exists:  CREATE TABLE "jdbc_example" ( "text" varchar(10) );
   */
  private static void insertRecordsIntoTable() throws SQLException {

    System.out.println("Inserting records.");
    Connection dbConnection = getDBConnection();
    PreparedStatement preparedStatement = null;
    String insertTableSQL = "INSERT INTO falcon_default_schema.jdbc_example (text) VALUES (?)";

    try {
      preparedStatement = dbConnection.prepareStatement(insertTableSQL);

      // Create multiple statements and add to a batch update.
      for (int cnt = 1; cnt <= 10; cnt++) {
        preparedStatement.setString(1, "some string " + cnt);
        preparedStatement.addBatch();
        System.out.println("Record " + cnt + " was added to the batch!");
      }
      preparedStatement.executeBatch();  // For large numbers of records, recommend doing sets of executeBatch commands.
      System.out.println("Records committed");

    }
    catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    finally {

      if (preparedStatement != null) {
        preparedStatement.close();
      }
      if (dbConnection != null) {
        dbConnection.close();
      }
    }
  }

  /** Create a connection to the database. */
  private static Connection getDBConnection() {
    Connection dbConnection = null;
    try {
      Class.forName(DB_DRIVER);
    }
    catch (ClassNotFoundException e) {
      System.out.println(e.getMessage());
    }
    try {
      dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER,DB_PASSWORD);
      return dbConnection;
    }
    catch (SQLException sqle) {
      System.out.println(sqle.getMessage());
    }

    return dbConnection;
  }

}

```

## Related Information

* [Enable JDBC logs]({{ site.baseurl }}/data-integrate/troubleshooting/JDBC-logging.html)
* [Connection configuration]({{ site.baseurl }}/data-integrate/reference/simba-settings.html#)
* [Supported SQL commands]({{ site.baseurl }}/data-integrate/reference/odbc-commands.html)
