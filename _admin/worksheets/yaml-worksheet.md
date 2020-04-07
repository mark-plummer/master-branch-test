---
title: [Worksheet YAML specification]
last_updated: 11/04/2019
summary: "ThoughtSpot worksheet specification may be exported as a YAML file, modified, and imported into the same or different cluster. "
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

To work with Scriptable Worksheets in ThoughtSpot, you can download Worksheets to a flat file in `yaml` format, modify it, and subsequently upload this file either to the same cluster, or to a different cluster. To learn how to export, change, and update Worksheets, see [Migrate or restore Worksheets]({{ site.baseurl }}/admin/worksheets/worksheet-export.html).

{: id="syntax"}
##  Syntax of the Worksheet YAML file

The YAML file for Scriptable Worksheets has a specific syntax.

See the [Parameters](#parameters) section for details about the keywords used in this example.

<pre>
<a href="#worksheet">worksheet</a>:
  <a href="#name">name</a>: &lt;<em>worksheet_name</em>&gt;
  <a href="#description">description</a>: |-
    This is a multi-line description of the worksheet
    Description line 2
  <a href="#tables">tables</a>:
  - <a href="#name">name</a>: &lt;<em>table_name_1</em>&gt;
  - [<a href="#alias">alias</a>] : &lt;<em>table_alias</em>&gt;
  - [<a href="#fqn">fqn</a>] : &lt;<em>GUID_of_table_name</em>&gt;
  - <a href="#name">name</a>: &lt;<em>table_name_2</em>&gt;
  - <a href="#name">name</a>: &lt;<em>table_name_3</em>&gt;
  joins:
  - <a href="#name">name</a>: &lt;<em>join_name_1</em>&gt;
    <a href="#source">source</a>: &lt;<em>source_table_name</em>&gt;
    <a href="#destination">destination</a>: &lt;<em>destination_table_name</em>&gt;
    <a href="#type">type</a>: [RIGHT_OUTER | LEFT_OUTER | INNER | OUTER]
    <a href="#is_one_to_one">is_one_to_one</a>: [ false | true ]
  - <em>...</em>
  <a href="#table_paths">table_paths</a>:
  - <a href="#id">id</a>: &lt;<em>table_path_name_1</em>&gt;
    <a href="#table">table</a>: &lt;<em>table_name_1</em>&gt;
    <a href="#join_path">join_path</a>:
    - <a href="#join">join</a>join:
      - &lt;<em>join_name_1</em>&gt;
  - <a href="#id">id</a>: &lt;<em>table_path_name_2</em>&gt;
    <a href="#table">table</a>: &lt;<em>table_name_2</em>&gt;
    <a href="#join_path">join_path</a>:
    - {}
  - <a href="#id">id</a>: &lt;<em>table_path_name_3</em>&gt;
    <a href="#table">table</a>: &lt;<em>table_name_3</em>&gt;
    <a href="#join_path">join_path</a>:
    - <a href="#join">join</a>:
      - &lt;<em>join_name_1</em>&gt;
    - <a href="#join">join</a>:
      - &lt;<em>join_name_2</em>&gt;
      - &lt;<em>join_name_3</em>&gt;
    - <a href="#join">join</a>:
      - &lt;<em>join_name_4</em>&gt;
      - &lt;<em>join_name_5</em>&gt;
      - &lt;<em>join_name_6</em>&gt;
  <a href="#formulas">formulas</a>:
  - <a href="#name">name</a>: &lt;<em>formula_name_1</em>&gt;
    <a href="#expr">expr</a>: &lt;<em>formula_definition_1</em>&gt;
    [id]: &lt;<em>unique_identifier</em>&gt;
  - <a href="#name">name</a>: &lt;<em>formula_name_2</em>&gt;
    <a href="#expr">expr</a>: &lt;<em>formula_definition_2</em>&gt;
  - <a href="#name">name</a>: &lt;<em>formula_name_3</em>&gt;
    <a href="#expr">expr</a>: &lt;<em>formula_definition_3</em>&gt;
  <a href="#worksheet_columns">worksheet_columns</a>:
  - <a href="#name">name</a>: &lt;<em>column_name_1</em>&gt;
    <a href="#description">description</a>: &lt;<em>column_description</em>&gt;
    <a href="#formula_id">formula_id</a>: &lt;<em>formula_name_1</em>&gt;
    <a href="#properties">properties</a>:
      <a href="#column_type">column_type</a>: [ MEASURE | ATTRIBUTE ]
      <a href="#aggregation">aggregation</a>: [ SUM | COUNT | AVERAGE | MAX | MIN |
                     COUNT_DISTINCT | NONE | STD_DEVIATION | VARIANCE]
      <a href="#index_type">index_type</a>: [ DONT_INDEX | DEFAULT | PREFIX_ONLY |
                    PREFIX_AND_SUBSTRING | PREFIX_AND_WORD_SUBSTRING ]
      <a href="#is_hidden">is_hidden</a>: [ true | false ]
 	    <a href="#index_priority">index_priority</a> : &lt;<em>index_priority</em>&gt;
      <a href="#synonyms">synonyms</a> :
             &lt;<em>synonym_1</em>&gt;
             &lt;<em>synonym_2</em>&gt;
      <a href="#is_attribution_dimension">is_attribution_dimension</a> : [true | false]
      <a href="#is_additive">is_additive</a> : [ true | false ]
      <a href="#calendar">calendar</a> : [ default | calendar_name ]
      <a href="#format_pattern">format_pattern</a> : &lt;<em>format_pattern_string</em>&gt;
      <a href="#currency_type">currency_type</a> :
        is_browser : true
          OR
        column : &lt;<em>column_name</em>&gt;
          OR
        iso_code : &lt;<em>valid_ISO_code</em>&gt;
    <a href="#cgeo_config">geo_config</a> :
        latitude : true
          OR
        longitude : true
          OR
        country : true
          OR
        region_name:
        - country : &lt;<em>name_supported_country</em>&gt;
        - region_name : &lt;<em>region_name_in_UI</em>&gt;
    <a href="#name">name</a>: &lt;<em>column_name_2</em>&gt;
    <a href="#description">description</a>: &lt;<em>column_description</em>&gt;
    <a href="#formula_id">formula_id</a>: &lt;<em>formula_name_2</em>&gt;
    ...  
  <a href="#properties">properties</a>:
    <a href="#is_bypass_rls">is_bypass_rls</a>: [ true | false ]
    <a href="#ijoin_progressive">join_progressive</a>: [ true | false ]
</pre>

{: id="parameters"}
## Parameters of Worksheet YAML file
<dl>

  <dlentry id="aggregation">
    <dt>aggregation</dt>
    <dd>The default aggregation of the worksheet column<br>
      Aggregation options depend on the data type.<br>
      Possible values: <code>SUM</code>, <code>COUNT</code>, <code>AVERAGE</code>, <code>MAX</code>, <code>MIN</code>, <code>COUNT_DISTINCT</code>, <code>NONE</code>, <code>STD_DEVIATION</code>, and <code>VARIANCE</code><br>
      Default: <code>SUM</code><br>
    </dd>
  </dlentry>

  <dlentry id="alias">
  <dt>alias</dt>
  <dd>An alternate name for the table</dd>
  </dlentry>

  <dlentry id="calendar">
    <dt>calendar</dt>
    <dd>Specifies the calendar used by a date column<br>
    Can be the Gregorian calendar (<code>default</code>), a fiscal calendar, or any custom calendar.<br>
    See <a href="../setup/set-custom-calendar.html">Set up a custom calendar</a></dd>
  </dlentry>

  <dlentry id="column_type">
    <dt>column_type</dt>
    <dd>The type of data the column represents<br>
    Possible values: <code>MEASURE</code> or <code>ATTRIBUTE</code><br>
    Default: <code>MEASURE</code></dd>
  </dlentry>

  <dlentry id="currency_type">
    <dt>currency_type</dt>
    <dd>The source of currency type<br>
    One of:<br>
    <ul>
      <li><code>is_browser : true</code> infer the currency data from the locale of your browser</li>
      <li><code>column : &lt;<em>column_name</em>&gt;</code> extracts the currency information from a specified column</li>
      <li><code>iso_code : &lt;<em>valid_ISO_code</em>&gt;</code> applies currency based on the ISO code; see <a href="https://www.iso.org/iso-4217-currency-codes.html">ISO 4217 Currency Codes</a></li>
    </ul>
    See <a href="../data-modeling/set-format-pattern-numbers.html#set-currency-type">Set currency type</a></dd>
  </dlentry>

  <dlentry id="description">
    <dt>description</dt>
    <dd>The text that describes an object: a <code>worksheet</code>, a <code>worksheet_column</code>, and so on.</dd>
  </dlentry>

  <dlentry id="destination">
    <dt>destination</dt>
    <dd>Name of destination table or view of the join</dd>
  </dlentry>

  <dlentry id="expr">
    <dt>expr</dt>
    <dd>The definition of the formula</dd>
  </dlentry>

  <dlentry id="format_pattern">
    <dt>format_pattern</dt>
    <dd>The format pattern string that controls the display of a number, date, or currency column<br>
    See <a href="../data-modeling/set-format-pattern-numbers.html">Set number, date, and currency formats</a></dd>
  </dlentry>

  <dlentry id="formula_id">
    <dt>formula_id</dt>
    <dd>The <code>id</code> of the formula that defines the worksheet column</dd>
  </dlentry>

  <dlentry id="formulas">
    <dt>formulas</dt>
    <dd>The list of formulas in the worksheet<br>
    Each formula is identified by <code>name</code>, the <code>expr</code> (expression), and an optional <code>id</code> attribute.</dd>
  </dlentry>

  <dlentry id="fqn">
  <dt>fqn</dt>
  <dd>A GUID for the table name</dd>
  </dlentry>

  <dlentry id="geo_config">
    <dt>geo_config</dt>
    <dd>Specifies the geographic information of a column<br>
    One of:<br>
    <ul>
      <li><code>latitue : true</code> for columns that specify the latitude</li>
      <li><code>longitude : true</code> for columns that specify the longitude</li>
      <li><code>country : true</code> for columns that specify the country</li>
      <li><code>region_name</code> for specifying a region in a country<br>
          Uses two paired parameters:<br>
           - <code>country: &lt;<em>country_name</em>&gt;</code><br>
           - <code>region_name: &lt;<em>region_name_in_UI</em>&gt;</code>, which can be State, Postal Code, District, and so on.</li>
    </ul>  
    See <a href="../data-modeling/model-geo-data.html">Add a geographical data setting</a></dd>
  </dlentry>

  <dlentry id="id">
    <dt>id</dt>
    <dd>Specifies the id of an object, such as <code>table_paths</code>, <code>formula</code>.</dd>
  </dlentry>

  <dlentry id="index_priority">
    <dt>index_priority</dt>
    <dd>A value (1-10) that determines where to rank a column’s name and values in the search suggestions<br>
    ThoughtSpot prioritizes columns with higher values.<br>
    See <a href="../data-modeling/change-index.html#change-a-columns-suggestion-priority">Change a column’s suggestion priority</a>.</dd>
  </dlentry>

  <dlentry id="index_type">
    <dt>index_type</dt>
    <dd>The indexing option of the worksheet column<br>
    Possible values: <code>DONT_INDEX</code>, <code>DEFAULT</code> (see <a href="../data-modeling/change-index.html#understand-the-default-indexing-behavior">Understand the default indexing behavior</a>), <code>PREFIX_ONLY</code>, <code>PREFIX_AND_SUBSTRING</code>, and <code>PREFIX_AND_WORD_SUBSTRING</code><br>
    Default: <code>DEFAULT</code><br>
    See <a href="../data-modeling/change-index.html#index-type">Index Type Values</a></dd>
  </dlentry>

  <dlentry id="is_additive">
    <dt>is_additive</dt>
    <dd>Controls extended aggregate options for attribute columns<br>
      For attribute columns that have a numeric data type (<code>FLOAT</code>, <code>DOUBLE</code>, or <code>INTEGER</code>) or a date data type (<code>DATE</code>, <code>DATETIME</code>, <code>TIMESTAMP</code>, or <code>TIME</code>)<br>
      Possible values: <code>true</code> or <code>false</code><br>
      Default: <code>true</code><br>
      See <a href="../data-modeling/change-aggreg-additive.html#making-an-attribute-column-additive">Making an ATTRIBUTE column ADDITIVE</a></dd>
  </dlentry>

  <dlentry id="is_attribution_dimension">
    <dt>is_attribution_dimension</dt>
    <dd>Controls is the column is an attribution dimension<br>
      Used in managing chasm traps.<br>
      Possible values: <code>true</code> by default, <code>false</code> to designate a column as not producing meaningful attributions across a chasm trap<br>
      Default: <code>true</code><br>
      See <a href="../data-modeling/attributable-dimension.html">Change the attribution dimension</a></dd>
  </dlentry>

  <dlentry id="is_bypass_rls">
    <dt>is_bypass_rls</dt>
    <dd>Specifies if the worksheet supports bypass of Row-level security (RLS)<br>
      Possible values: <code>true</code> or <code>false</code><br>
      Default: <code>false</code><br>
      See <a href="../data-security/row-level-security.html#privileges-that-allow-users-to-set-or-be-exempt-from-rls">Privileges that allow users to set, or be exempt from, RLS</a></dd>
  </dlentry>

  <dlentry id="is_hidden">
    <dt>is_hidden</dt>
    <dd>The visibility of the column<br>
    Possible values: <code>true</code> to hide the column, <code>false</code> not to hide the column<br>
    Default: <code>false</code><br>
    See <a href="../data-modeling/change-visibility-synonym.html#hide-a-column">Hide a column</a></dd>
  </dlentry>

  <dlentry id="is_one_to_one">
    <dt>is_one_to_one</dt>
    <dd>Specifies the cardinality of the join<br>
    Possible values: <code>true</code>, <code>false</code><br>
    Default: <code>false</code></dd>
  </dlentry>

  <dlentry id="join">
    <dt>join</dt>
    <dd>Specific join, used in defining higher-level objects, such as table paths<br>
    Defined as <code>name</code> within <code>joins</code> definition
    </dd>
  </dlentry>

  <dlentry id="join_path">
    <dt>join_path</dt>
    <dd>Specification of a composite join as a list of distinct <code>join</code> attributes<br>
    These <code>join</code> attributes list relevant joins, previously defined in the <code>joins</code>, by name.<br>
    Default: <code>{}</code>
    </dd>
  </dlentry>

  <dlentry id="join_progressive">
    <dt>join_progressive</dt>
    <dd>Specifies when to apply joins on a worksheet<br>
    Possible values: <code>true</code> when joins are applied only for tables whose columns are included in the search, and <code>false</code> for all possible joins<br>
    Default: <code>true</code><br>
    See <a href="../worksheets/progressive-joins.html">How the worksheet join rule works</a></dd>
  </dlentry>

  <dlentry id="joins">
    <dt>joins</dt>
    <dd>List of joins between tables and views, used by the worksheet<br>
    Each join is identified by <code>name</code>, and the additional attributes of <code>source</code>, <code>destination</code>, <code>type</code>, and <code>is_one_to_one.</code>
    </dd>
  </dlentry>

  <dlentry id="name">
    <dt>name</dt>
    <dd>The name of an object. Applies to <code>worksheet</code>, <code>table</code>,<code>join</code>, <code>formula</code>, and so on.</dd>
  </dlentry>

  <dlentry id="properties">
    <dt>properties</dt>
    <dd>The list of properties of the worksheet column<br>
    Each column can have the following properties, depending on its definition: <code>column_type</code>, <code>aggregation</code>, <code>index_type</code>, <code>is_hidden</code>, <code>index_priority</code>, <code>synonyms</code>, <code>is_attribution_dimension</code>, <code>is_additive</code>, <code>calendar</code>, <code>format_pattern</code>, <code>currency_type</code>, and <code>geo_config</code>.</dd>
  </dlentry>

  <dlentry id="source">
    <dt>source</dt>
    <dd>Name of source table or view of the join</dd>
  </dlentry>

  <dlentry id="synonyms">
    <dt>synonyms</dt>
    <dd>Alternate names for the column, used in search<br>
    See <a href="../data-modeling/change-visibility-synonym.html#create-synonyms-for-a-column">Create synonyms for a column</a></dd>
  </dlentry>

  <dlentry id="table">
    <dt>table</dt>
    <dd>Specific table, used in defining higher-level objects, such as table paths<br>
    Defined as <code>name</code> within <code>tables</code> definition
    </dd>
  </dlentry>

  <dlentry id="table_paths">
    <dt>table_paths</dt>
    <dd>The list of table paths<br>
    Each table path is identified by the <code>id</code>, and additional attributes of <code>table</code> and <code>join_path</code>.</dd>
  </dlentry>

  <dlentry id="tables">
    <dt>tables</dt>
    <dd>List of tables used by the worksheet<br>Each table is identified by <code>name</code>.</dd>
  </dlentry>

  <dlentry id="type">
    <dt>type</dt>
    <dd>Join type<br>
    Possible values: <code>LEFT_OUTER</code> for left outer join, <code>RIGHT_OUTER</code> for right outer join, <code>INNER</code> for inner join, <code>OUTER</code> for full outer join<br>
    Default: <code>RIGHT_OUTER</code>
    </dd>
  </dlentry>

  <dlentry id="worksheet">
    <dt>worksheet</dt>
    <dd>Top-level container for all object definitions within the worksheet</dd>
  </dlentry>

  <dlentry id="worksheet_columns">
    <dt>worksheet_columns</dt>
    <dd>The list of columns in the worksheet<br>
    Each worksheet is identified by <code>name</code>, <code>description</code>, <code>formula_id</code>, and <code>properties</code>.</dd>
  </dlentry>

</dl>

{: id="limitations"}
## Limitations of working with Worksheet YAML files

There are certain limitations to the changes you can apply be editing a Worksheet through YAML.

* Formulas and columns can either have a new name, or a new expression. You cannot change both, unless migrating or updating the worksheet two times.

* It is not possible to reverse the join direction in the YAML script.

* It is not possible to include Worksheet filters in the YAML script.

## Related Information
- [Migrate or restore Worksheets]({{ site.baseurl }}/admin/worksheets/worksheet-export.html)
