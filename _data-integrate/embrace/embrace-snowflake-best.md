---
title: [Best practices for Embrace with Snowflake]
last_updated: 01/15/2020
summary: "You can connect to Snowflake using ThoughtSpot Embrace, and start searching your data. This article contains helpful pointers on data modeling."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
After connecting to Snowflake through ThoughtSpot Embrace, you may notice that some things don’t work as you expect. This article lists best practices for improving the user experience by making small changes to the Snowflake schema in Snowflake, to optimize it for ThoughtSpot.

## Change JSON to a relational schema in Snowflake

ThoughtSpot works with relational data, where data must be in the form of a table, with rows and columns. Relational data is commonly stored as comma separated values, in CSV format, or in tables in a database.

The Snowflake warehouse uses more flexible requirements for storing data, such as the `VARIANT` data type to store JSON. However, the user experience when searching directly on JSON data in ThoughtSpot is not as good as searching over relational data.

For example, if you connect to the Snowflake Free Trail sample WEATHER dataset, and search it in ThoughtSpot, the `DAILY_14_TOTAL` table features JSON data.

![JSON data in Snowflake]({{ site.baseurl }}/images/snowflake-jsondata.png "JSON data in Snowflake")

To make this data searchable in ThoughtSpot, you must first create a view in Snowflake, which effectively makes the JSON data into relational (table) data. You can then search this data in ThoughtSpot, and generate chart and table results from your searches. This process is called “schema on read”.

### Create a view in snowflake

To create a view from a Snowflake table that contains JSON, follow these steps:

1. Log in to your Snowflake instance.

2. If necessary, change your role so you can issue `CREATE VIEW` DDL statement in the target schema. See [CREATE VIEW](https://docs.snowflake.net/manuals/sql-reference/sql/create-view.html) in Snowflake.

    ![Switch roles in Snowflake]({{ site.baseurl }}/images/snowflake-switch-role.png "Switch roles in Snowflake")

3. Click **Worksheets**.

    ![Switch to Worksheets in Snowflake]({{ site.baseurl }}/images/snowflake-worksheets.png "Switch to Worksheets in Snowflake")

4. Issue the `CREATE VIEW` statement.

   See [CREATE VIEW Syntax](https://docs.snowflake.net/manuals/sql-reference/sql/create-view.html#syntax).

   The following example uses the sample `WEATHER` data from the **Snowflake Free Trial** sample data:

   ```
CREATE <strong>json_weather_data_view</strong> as
SELECT
  v:time::timestamp as observation_time,
  v:city.id::int as city_id,
  v:city.name::string as city_name,
  v:city.country::string as country,
  v:city.coord.lat::float as city_lat,
  v:city.coord.lon::float as city_lon,
  v:clouds.all::int as clouds,
  (v:main.temp::float)-273.15 as temp_avg,
  (v:main.temp_min::float)-273.15 as temp_min,
  (v:main.temp_max::float)-273.15 as temp_max,
  v:weather[0].main::string as weather,
  v:weather[0].description::string as weather_desc,
  v:weather[0].icon::string as weather_icon,
  v:wind.deg::float as wind_dir,
  v:wind.speed::float as wind_speed
FROM json_weather_data
WHERE city_id = 5128638;
   ```

5. Query the new view in Snowflake.

   The following example demonstrates how you can query the view <code><strong>json_weather_data_view</strong></code> created in the previous step:

   ```
   SELECT * FROM json_weather_data_view
WHERE date_trunc('month',observation_time) = '2018-01-01'
LIMIT 20;
   ```

6. In ThoughtSpot Embrace, add a connection to Snowflake, specifically to the view you created.

   See [Connect to Snowflake through Embrace](#connect-snowflake).


When you subsequently search in ThoughtSpot against the Snowflake view, you can easily create charts and graphs, as expected.

![Visualization on Snowflake view]({{ site.baseurl }}/images/snowflake-view-visualization.png "Visualization on Snowflake view")


## Add joins between tables

To search more than one table at the same time in ThoughtSpot, you must define joins between these tables by specifying the  columns that contain matching data across two tables. These columns represent the 'primary key' and 'foreign key' of the join.

In Snowflake, you can query the schema to get a list of its existing foreign key constraints with referenced constraints.

To determine which foreign keys already exist in your Snowflake schema, issue the following `SELECT ... AS` statement:

```
select
  fk_tco.table_schema as foreign_schema,
  fk_tco.table_name as foreign_table,
  fk_tco.constraint_name as foreign_constraint,
  '>-' as rel,
  pk_tco.table_schema as referenced_schema,
  pk_tco.table_name as referenced_table,
  pk_tco.constraint_name as referenced_constraint
from
  information_schema.referential_constraints rco
join
  information_schema.table_constraints fk_tco
  on fk_tco.constraint_name = rco.constraint_name
  and fk_tco.constraint_schema = rco.constraint_schema
join
  information_schema.table_constraints pk_tco
  on pk_tco.constraint_name = rco.unique_constraint_name
  and pk_tco.constraint_schema = rco.unique_constraint_schema
order by
  fk_tco.table_schema,
  fk_tco.table_name;

```

The system returns the results of this query as a table that represents all foreign keys in the database, ordered by schema name and by name of the foreign table. The table has the following columns:

<dl>
<dt>foreign_schema</dt>
<dd>The name of the foreign schema</dd>
<dt>foreign_table</dt>
<dd>The name of the foreign table</dd>
<dt>foreign_constraint</dt>
<dd>The name of the foreign key constraint</dd>
<dt>rel</dt>
<dd>The relationship symbol that indicates the direction of the join</dd>
<dt>referenced_schema</dt>
<dd>The name of the referenced schema</dd>
<dt>referenced_schema</dt>
<dd>The name of the referenced schema</dd>
<dt>referenced_schema</dt>
<dd>The name of the referenced schema</dd>
</dl>

To search multi-table Snowflake data in ThoughtSpot, you must explicitly create joins.

There are two ways to do this:

1. ThoughtSpot recommends that you add the necessary foreign key constraints by creating a join in Snowflake. We demonstrate how you can do in [Create joins in Snowflake]({{ site.baseurl }}/data-integrate/embrace/embrace-snowflake-best.html#join-snowflake).

   For in-depth information from Snowflake, see [CREATE or ALTER TABLE … CONSTRAINT](https://docs.snowflake.net/manuals/sql-reference/sql/create-table-constraint.html).

2. Alternatively, if you don't have the necessary permissions, you can create these relationships in ThoughtSpot.

   See [Join a table or view to another data source]({{ site.baseurl }}/admin/data-modeling/create-new-relationship.html) and [Constraints]({{ site.baseurl }}/admin/loading/constraints.html).

{: id="join-snowflake"}
### Create joins in Snowflake

To add a foreign key constraint in Snowflake, you must issue the following `ALTER TABLE` statement:

<pre>
ALTER TABLE &lt;table_name&gt; ADD { outoflineUniquePK | outoflineFK }
</pre>

<dl>
  <dlentry>
    <dt>outoflineUniquePK</dt>
    <dd>The primary key in the relationship, with the following definition:<br>
    <pre>outoflineUniquePK ::=
  [ CONSTRAINT &lt;constraint_name&gt;> ]
  { UNIQUE | PRIMARY KEY } ( &lt;col_name&gt;> [ , &lt;col_name&gt; , ... ] )
  [ [ NOT ] ENFORCED ]
  [ [ NOT ] DEFERRABLE ]
  [ INITIALLY { DEFERRED | IMMEDIATE } ]
  [ ENABLE | DISABLE ]
  [ VALIDATE | NOVALIDATE ]
  [ RELY | NORELY ]</pre>
    </dd>  
  </dlentry>
  <dlentry>
    <dt>outoflineFK</dt>
    <dd>The foreign key in the relationship, with the following definition:<br>
      <pre>outoflineFK :=
    [ CONSTRAINT &lt;constraint_name&gt; ]
    FOREIGN KEY ( &lt;col_namev [ , &lt;col_name&gt; , ... ] )
    REFERENCES &lt;ref_table_name&gt; [ ( &lt;ref_col_name&gt; [ , &lt;ref_col_name&gt; , ... ] ) ]
    [ MATCH { FULL | SIMPLE | PARTIAL } ]
    [ ON [ UPDATE { CASCADE | SET NULL | SET DEFAULT | RESTRICT | NO ACTION } ]
         [ DELETE { CASCADE | SET NULL | SET DEFAULT | RESTRICT | NO ACTION } ] ]
    [ [ NOT ] ENFORCED ]
    [ [ NOT ] DEFERRABLE ]
    [ INITIALLY { DEFERRED | IMMEDIATE } ]
    [ ENABLE | DISABLE ]
    [ VALIDATE | NOVALIDATE ]
    [ RELY | NORELY ]</pre>
    </dd>  
  </dlentry>
</dl>

{: id="add-fk-snowflake"}
**Example 1: adding a foreign key in Snowflake**

For example, you can add a foreign key to Retail Sales schema in Snowflake by running the following `ALTER TABLE` statement. Also, contrast it with [Example 2](#add-fk-thoughtspot):

```
ALTER TABLE "HO_RETAIL"."PUBLIC"."HO_Retail_Sales_Fact"
  ADD FOREIGN KEY ("Date_Key" )
  REFERENCES "HO_RETAIL"."PUBLIC"."HO_Date_Dimension"
  MATCH FULL
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;
```

{: id="add-fk-thoughtspot"}
**Example 2: adding a foreign key in ThoughtSpot**

To add the foreign key in ThoughtSpot (an alternative to the process outlined in [Example 1](#add-fk-snowflake)), you can issue the following TQL `ALTER TABLE` statement:

<pre>
TQL&gt; ALTER TABLE "HO_Retail_Sales_Fact"
   ADD CONSTRAINT FOREIGN KEY ("Date_Key")
   REFERENCES "HO_Date_Dimension" ("Date_Key");
</pre>

{: id="connect-snowflake"}
## Connect to Snowflake through Embrace

Follow the general steps in [Add a Snowflake connection]({{ site.baseurl }}/data-integrate/embrace/embrace-snowflake-add.html).

In the following screen, the **Account name** is the first part of the URL that you use to access Snowflake.

![Snowflake connection details]({{ site.baseurl }}/images/snowflake-connectiondetails.png "Snowflake connection details")

If you cannot find your **Full account name** in Snowflake, see the following examples for determining your account based on the account name, cloud platform, and region. Assume that the **account name** is `xy12345`.

<table>
<tbody>
<tr>
<th>Cloud plafrom</th>
<th>Region</th>
<th>Full account name</th>
</tr>
<tr>
<th rowspan="8">AWS</th>
<td>US East (N. Virginia)</td>
<td>xy12345.us-east-1</td>
</tr>
<tr>
<td>US East (Ohio)</td>
<td>xy12345.us-east-2.aws</td>
</tr>
<tr>
<td>US West (Oregon)</td>
<td>xy12345</td>
</tr>
<tr>
<td>Canada (Central)</td>
<td>xy12345.ca-central-1.aws</td>
</tr>
<tr>
<td>EU (Ireland)</td>
<td>xy12345.eu-west-1</td>
</tr>
<tr>
<td>EU (Frankfurt)</td>
<td>xy12345.eu-central-1</td>
</tr>
<tr>
<td>Asia Pacific (Singapore)</td>
<td>xy12345.ap-southeast-1</td>
</tr>
<tr>
<td>Asia Pacific (Sydney)</td>
<td>xy12345.ap-sowtheast-2</td>
</tr>
<tr>
<th>GCP - <em>Preview</em></th>
<td>us-central1 (Iowa)</td>
<td>xy12345.us-central1.gcp</td>
</tr>
<tr>
<th rowspan="6">Azure</th>
<td>East US 2</td>
<td>xy12345.east-us-2.azure</td>
</tr>
<tr>
<td>US Gov Virginia</td>
<td>xy12345.us-gov-virginia.azure</td>
</tr>
<tr>
<td>Canada Central</td>
<td>xy12345.canada-central.azure</td>
</tr>
<tr>
<td>West Europe</td>
<td>xy12345.west-europe.azure</td>
</tr>
<tr>
<td>Australia East</td>
<td>xy12345.australia-east.azure</td>
</tr>
<tr>
<td>Southeast Asia</td>
<td>xy12345.southeast-asia.azure</td>
</tr>
</tbody>
</table>
