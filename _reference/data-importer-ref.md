---
title: [tsload flag reference]
summary: You can modify the behavior of tsload with flags.
last_updated: 11/19/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
For recurring data loads and for scripting loads, use `tsload` (the ThoughtSpot Loader). This reference section lists all the flags that can be used to modify the behavior of `tsload`.

## General tsload flags

<table style="font-size:90%; padding:4; border-collapse: collapse;">
   <colgroup>
   <col style="width:25%">
   <col style="width:30%">
   <col style="width:45%">
   </colgroup>
   <thead >
      <tr>
         <th>Flag</th>
         <th>Description</th>
         <th>Notes</th>
      </tr>
   </thead>
   <tbody>
      <tr>
      <td><code class="highlighter-rouge">--target_database &lt;database&gt;</code></td>
      <td>Specifies the pre-existing target database into which tsload should load the data.</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--target_schema &lt;schema&gt;</code></td>
      <td>Specifies the target schema.</td>
      <td>Default is “falcon_default_schema”.</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--target_table &lt;table&gt;</code></td>
      <td>Specifies the tables that you want to load into the database.</td>
      <td>The tables must exist in the database specified by <code class="highlighter-rouge">--target_database</code>.</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--empty_target</code></td>
      <td>Specifies that any data in the target table is to be removed before the new data is loaded.</td>
      <td>If supplied, any rows that exist in the table specified by <code class="highlighter-rouge">--target_database</code> and <code class="highlighter-rouge">--target table</code> will be deleted before this data load. To perform an “upsert” on the existing data, omit this flag or specify <code class="highlighter-rouge">--noempty_target</code>.</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--max_ignored_rows &lt;number&gt;</code></td>
      <td>Specifies the maximum number of rows that can be ignored if they fail to load.</td>
      <td>If the number of ignored rows exceeds this limit, the load will be aborted.</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--bad_records_file &lt;path_to_file&gt;/&lt;file_name&gt;</code></td>
      <td>Specifies the file to use for storing rows that failed to load.</td>
      <td>Input rows that do not conform to the defined schema in ThoughtSpot will be ignored and inserted into this file.</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--date_format &lt;date_formatmask&gt;</code></td>
      <td>Specifies the format string for date values.</td>
      <td>The default format is <code>yearmonthday</code> e.g. “Dec 30th, 2001” and is represented as <code>20011230</code>. Use the date format specifications supported in the <a href="http://man7.org/linux/man-pages/man3/strptime.3.html">strptime library function</a>.</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--date_time_format &lt;date_formatmask&gt; &lt;time_formatmask&gt;</code></td>
      <td>Specifies the format string for datetime values.</td>
      <td>The default is yearmonthday hour:minute:second e.g. Dec 30th, 2001 1:15:12 and is represented as 20011230 01:15:12. Use the datetime format specifications supported in the <a href="http://man7.org/linux/man-pages/man3/strptime.3.html">strptime library function</a>.</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--time_format &lt;time_formatmask&gt;</code></td>
      <td>Specifies the format string for time values.</td>
      <td>The default is hour:minute:second. Use the time format specifications supported in the <a href="http://man7.org/linux/man-pages/man3/strptime.3.html">strptime library function</a>.</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--v=[0|1|2|3</code></td>
      <td>Specifies the verbosity of log messages.</td>
      <td>Provide a value for verbosity level. By default, verbosity is set to the minimum, which is 0. This value is similar to a volume control. At higher levels your log receives more messages and that log more frequently. This is used for debugging. You should not change this value unless instructed by ThoughtSpot Support.</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--skip_second_fraction</code></td>
      <td>Skips fractional seconds when loading data.</td>
      <td>If supplied, the upserts logic may be affected, especially if the date time being loaded is a primary key, and the data has millisecond granularity. Load the data twice, first time as a string with a primary key, and again with second granularity date time. There is no support to store fractional seconds in the ThoughtSpot system.</td>
    </tr>
  </tbody>
</table>

## File loading tsload flags

The following flags are used when loading data from an input file:

<table style="font-size:90%; padding:4; border-collapse: collapse;">
   <colgroup>
      <col style="width:25%">
      <col style="width:30%">
      <col style="width:45%">
   </colgroup>
   <thead >
      <tr>
         <th>Flag</th>
         <th>Description</th>
         <th>Notes</th>
      </tr>
   </thead>
   <tbody>
      <tr>
      <td><code class="highlighter-rouge">--source_file &lt;path_to_file&gt;/&lt;file_name&gt;</code></td>
      <td>Specifies the location of the file to be loaded.</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--source_data_format [csv|delimited]</code></td>
      <td>Specifies the data file format.</td>
      <td>Optional. The default is csv.</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--field_separator "&lt;delimiter&gt;"</code></td>
      <td>Specifies the field delimiter used in the input file.</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--trailing_field_separator</code></td>
      <td>Specifies that the field separator appears after every field, including the last field per row.</td>
      <td>Example row with trailing field separator: a,b,c,The default is false.</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--null_value "&lt;null_representation&gt;"</code></td>
      <td>Specifies how null values are represented in the input file.</td>
      <td>These values will be converted to NULL upon loading.</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--date_converted_to_epoch [true|false]</code></td>
      <td>Specifies whether the “date” or “datetime” values in the input file are represented as epoch values.</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--boolean_representation [true_false | 1_0 | T_F | Y_N]</code></td>
      <td>Specifies the format in which boolean values are represented in the input file.</td>
      <td>The default is T_F. You can also use this flag to specify other values. For example, if your data used Y for true and NULL for false, you could specify:<code class="highlighter-rouge">--boolean_representation Y_NULL</code></td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--has_header_row</code></td>
      <td>Indicates that the input file contains a header row.</td>
      <td>If supplied, column names in the header row are used to match column names in the target table in ThoughtSpot. If not supplied, the first row of the file is loaded as data, the same as all subsequent rows.</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--escape_character "&lt;character&gt;"</code></td>
      <td>Specifies the escape character used in the input file.</td>
      <td>If no value is specified, the default is “(double quotes).</td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--enclosing_character "&lt;character&gt;"</code></td>
      <td>Specifies the enclosing character used in the input file.</td>
      <td>If the enclosing character is double quotes, you need to escape it, as in this example: <code class="highlighter-rouge">--enclosing_character "\""</code></td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">--use_bit_boolean_values = [true | false]</code></td>
      <td>Specifies how boolean values are represented in the input file.</td>
      <td>If supplied, the input CSV file uses a bit for boolean values, i.e. the false value is represented as 0x0 and true as 0x1. If omitted or set to false, boolean values are assumed to be T_F, unless you specify something else using the flag <code class="highlighter-rouge">--boolean_representation [true_false | 1_0 | T_F | Y_N]</code>.</td>
    </tr>
  </tbody>
</table>
