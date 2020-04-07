<table>
<colgroup>
   <col style="width:25%" />
   <col style="width:25%" />
   <col style="width:50%" />
</colgroup>
  <thead>
    <tr>
      <th>Function</th>
      <th>Description</th>
      <th>Examples</th>
    </tr>
  </thead>
  <tbody>
    <tr id="add_days">
      <td><code>add_days</code></td>
      <td>Returns the result of adding the specified number of days to the given date.</td>
      <td><code class="highlighter-rouge">add_days (01/30/2015, 5) = 02/04/2015</code><br><code class="highlighter-rouge">add_days (invoiced, 30)</code></td>
    </tr>
    <tr id="add_minutes">
      <td><code>add_minutes</code></td>
      <td>Returns the result of adding the specified number of minutes to input date/datetime/time.</td>
      <td><code class="highlighter-rouge">add_minutes ( 01/30/2015 00:10:20 , 5 ) = 01/30/2015 00:11:20</code><br><code class="highlighter-rouge">add_minutes ( invoiced , 30 )</code></td>
    </tr>
    <tr id="add_months">
    <td><code>add_months</code></td>
    <td>Returns the result of adding the specified number of months to the given date.</td>
    <td><code class="highlighter-rouge">add_months ( 01/30/2015, 5 ) = 06/30/2015</code><br><code class="highlighter-rouge">add_months ( invoiced_date , 5 )</code></td>
    </tr>
    <tr id="add_seconds">
    <td><code>add_seconds</code></td>
    <td>Returns the result of adding the specified number of seconds to the given date.</td>
    <td><code class="highlighter-rouge">add_seconds ( 01/30/2015 00:00:00, 5 ) = 06/30/2015 00:00:05</code><br><code class="highlighter-rouge">add_seconds ( invoiced_date , 5 )</code></td>
    </tr>
    <tr id="add_weeks">
    <td><code>add_weeks</code></td>
    <td>Returns the result of adding the specified number of weeks to the given date.</td>
    <td><code class="highlighter-rouge">add_weeks ( 01/30/2015, 2 ) = 02/13/2015</code><br><code class="highlighter-rouge">add_weeks ( invoiced_date , 2 )</code></td>
    </tr>
    <tr id="add_years">
    <td><code>add_years</code></td>
    <td>Returns the result of adding the specified number of years to the given date.</td>
    <td><code class="highlighter-rouge">add_years ( 01/30/2015, 5 ) = 01/30/2020</code><br><code class="highlighter-rouge">add_years ( invoiced_date , 5 )</code></td>
    </tr>
    <tr id="date">
      <td><code>date</code></td>
      <td>Returns the date portion of a given date.</td>
      <td><code class="highlighter-rouge">date (home visit)</code></td>
    </tr>
    <tr id="day">
      <td><code>day</code></td>
      <td>Returns the number (1-31) of the day for the given date.</td>
      <td><code class="highlighter-rouge">day (01/15/2014) = 15</code><br><code class="highlighter-rouge">day (date ordered)</code></td>
    </tr>
    <tr id="day_number_of_quarter">
       <td><code>day_number_of_quarter</code></td>
       <td>
        Returns the number of the day in a quarter for a given date. Add an optional
        second parameter to specify whether a 'fiscal' or 'calendar' year is used to
        calculate the result. Default is 'calendar'. (In examples, start of fiscal year
        is set to May 01.)
       </td>
       <td>
       <code class="highlighter-rouge">day_number_of_quarter (01/30/2015) = 30</code><br>
       <code class="highlighter-rouge">day_number_of_quarter (01/30/2015, 'fiscal') = 91</code><br>
       </td>
    </tr>
    <tr id="day_number_of_week">
       <td><code>day_number_of_week</code></td>
        <td>Returns the number (1-7) of the day in a week for a given date with 1 being Monday and 7 being Sunday.</td>
       <td><code class="highlighter-rouge">day_number_of_week(01/15/2014) = 3</code><br>
       <code class="highlighter-rouge">day_number_of_week (shipped)</code><br>
       </td>
    </tr>
    <tr id="day_number_of_year">
      <td><code>day_number_of_year</code></td>
      <td>
      Returns the number (1-366) of the day in a year from a given date. Add an
      optional second parameter to specify whether a 'fiscal' or 'calendar' year is
      used to calculate the result. Default is 'calendar'. (In examples, start of
      fiscal year is set to May 01.)
      </td>
      <td><code class="highlighter-rouge">day_number_of_year (01/30/2015) = 30</code><br>
      <code class="highlighter-rouge">day_number_of_year ( 01/30/2015, 'fiscal' ) = 275</code><br>
      <code class="highlighter-rouge">day_number_of_year (invoiced)</code></td>
    </tr>
    <tr id="day_of_week">
      <td><code>day_of_week</code></td>
      <td>Returns the day of the week for the given date.</td>
      <td><code class="highlighter-rouge">day_of week (01/30/2015) = Friday</code><br><code class="highlighter-rouge">day_of_week (serviced)</code></td>
    </tr>
    <tr id="diff_days">
      <td><code>diff_days</code></td>
      <td>Subtracts the second date from the first date and returns the result in number of days, rounded down if not exact.</td>
      <td><code class="highlighter-rouge">diff_days (01/15/2014, 01/17/2014) = -2</code><br><code class="highlighter-rouge">diff_days (purchased, shipped)</code></td>
    </tr>
    <tr id="diff_time">
      <td><code>diff_time</code></td>
      <td>Subtracts the second date from the first date and returns the result in number of seconds.</td>
      <td><code class="highlighter-rouge">diff_time (01/01/2014, 01/01/2014) = -86,400</code><br><code class="highlighter-rouge">diff_time (clicked, submitted)</code></td>
    </tr>
    <tr id="hour_of_day">
      <td><code>hour_of_day</code></td>
      <td>Returns the hour of the day for the given date.</td>
      <td><code class="highlighter-rouge">hour_of_day (received)</code></td>
    </tr>
    <tr id="is_weekend">
      <td><code>is_weekend</code></td>
      <td>Returns true if the given date falls on a Saturday or Sunday.</td>
      <td><code class="highlighter-rouge">is_weekend (01/31/2015) = true</code><br><code class="highlighter-rouge">is_weekend (emailed)</code></td>
    </tr>
    <tr id="month">
      <td><code>month</code></td>
      <td>Returns the month from the given date.</td>
      <td><code class="highlighter-rouge">month (01/15/2014) = January</code><br><code class="highlighter-rouge">month (date ordered)</code></td>
    </tr>
    <tr id="month_number">
      <td><code>month_number</code></td>
      <td>
        Returns the number (1-12) of the month from a given date. Add an optional second
        parameter to specify whether a 'fiscal' or 'calendar' year is used to calculate
        the result. Default is 'calendar'. (In examples, start of fiscal year is set to
        May 01.)
      </td>
      <td><code class="highlighter-rouge">month_number (09/20/2014) = 9</code><br>
      <code class="highlighter-rouge">month_number ( 09/20/2014, 'fiscal' ) = 5</code><br>
      <code class="highlighter-rouge">month_number (purchased)</code></td>
    </tr>
    <tr id="month_number_of_quarter">
       <td><code>month_number_of_quarter</code></td>
       <td>
        Returns the month (1-3) number for the given date in a quarter. Add an optional
        second parameter to specify whether a 'fiscal' or 'calendar' year is used to
        calculate the result. Default is 'calendar'. (In examples, start of fiscal year
        is set to May 01.)
       </td>
       <td><code class="highlighter-rouge">month_number_of_quarter (02/20/2018) = 2 </code><br>
       <code class="highlighter-rouge">month_number_of_quarter (02/20/2018,'fiscal' ) = 1</code></td>
    </tr>
    <tr id="now">
      <td><code>now</code></td>
      <td>Returns the current timestamp.</td>
      <td><code class="highlighter-rouge">now ()</code></td>
    </tr>
    <tr id="quarter_number">
       <td><code>quarter_number</code></td>
       <td>
        Returns the number (1-4) of the quarter associated with the given date. Add an
        optional second parameter to specify 'fiscal' or 'calendar' dates. Default is
        'calendar'. (In examples, start of fiscal year is set to May 01.)
       </td>
       <td><code class="highlighter-rouge">quarter_number ( 04/14/2014) = 2 </code><br>
       <code class="highlighter-rouge">quarter_number ( 04/14/2014, 'fiscal' ) = 4</code><br>
       <code class="highlighter-rouge">quarter_number ( shipped )</code></td>
    </tr>
    <tr id="start_of_month">
      <td><code>start_of_month</code></td>
      <td>Returns <code>MMM yyyy</code> for the first day of the month. Your installation configuration can override this setting so that it returns a different format such as <code>MM/dd/yyyy</code>. Speak with your ThoughtSpot administrator for information on doing this.</td>
      <td><code class="highlighter-rouge">start_of_month ( 01/31/2015 ) = Jan FY 2015</code><br><code class="highlighter-rouge">start_of_month (shipped)</code></td>
    </tr>
    <tr id="start_of_quarter">
      <td><code>start_of_quarter</code></td>
      <td>
      Returns the date for the first day of the quarter for the given date. Add an
      optional second parameter to specify whether a 'fiscal' or 'calendar' year is
      used to calculate the result. Default is 'calendar'. (In examples, start of
      fiscal year is set to May 01.)
      </td>
      <td><code class="highlighter-rouge">start_of_quarter ( 04/01/2014) = Apr 2014</code><br>
      <code class="highlighter-rouge">start_of_quarter ( 04/01/2014, 'fiscal') = Feb 2014</code><br>
      <code class="highlighter-rouge">start_of_quarter (sold)</code></td>
    </tr>
    <tr id="start_of_week">
      <td><code>start_of_week</code></td>
      <td>Returns the date for the first day of the week for the given date.</td>
      <td><code class="highlighter-rouge">start_of_week ( 06/01/2015 ) = 05/30/2015 Week</code><br><code class="highlighter-rouge">start_of_week (emailed)</code></td>
    </tr>
    <tr id="start_of_year">
      <td><code>start_of_year</code></td>
      <td>
      Returns the date for the first day of the year for the given date. Add an
      optional second parameter to specify whether a 'fiscal' or 'calendar' year is
      used to calculate the result. Default is 'calendar'. (In examples, start of
      fiscal year is set to May 01.)
      </td>
      <td>
      <code class="highlighter-rouge">start_of_year (04/01/2014) returns Jan 2014</code><br>
      <code class="highlighter-rouge">start_of_year (04/01/2014, 'fiscal') returns May 2013</code><br>
      <code class="highlighter-rouge">start_of_year (joined)</code></td>
    </tr>
    <tr id="time">
      <td><code>time</code></td>
      <td>Returns the time portion of a given date.</td>
      <td><code class="highlighter-rouge">time (3/1/2002 10:32) = 10:32</code><br><code class="highlighter-rouge">time (call began)</code></td>
    </tr>
    <tr id="week_number_of_month">
       <td><code>week_number_of_month</code></td>
       <td>Returns the week number for the given date in a month.</td>
       <td><code class="highlighter-rouge">week_number_of_month(03/23/2017) = 3</code></td>
    </tr>
    <tr id="week_number_of_quarter">
       <td><code>week_number_of_quarter</code></td>
       <td>
        Returns the week number for the given date in a quarter. Add an optional second
        parameter to specify whether a 'fiscal' or 'calendar' year is used to calculate
        the result. Default is 'calendar'. (In examples, start of fiscal year is set to
        May 01.)
       </td>
       <td><code class="highlighter-rouge">week_number_of_quarter (04/03/2017) = 1</code><br>
       <code class="highlighter-rouge">week_number_of_quarter (04/03/2017, 'fiscal') = 10</code></td>
    </tr>
    <tr id="week_number_of_year">
       <td><code>week_number_of_year</code></td>
       <td>
        Returns the week number for the given date in a year. Add an optional second
        parameter to specify whether a 'fiscal' or 'calendar' year is used to calculate
        the result. Default is 'calendar'. (In examples, start of fiscal year is set to
        May 01.)
       </td>
       <td>
       <code class="highlighter-rouge">week_number_of_year (01/17/2014) = 3</code><br>
       <code class="highlighter-rouge">week_number_of_year ( 01/17/2014, 'fiscal') = 38</code>
       </td>
    </tr>
    <tr id="year">
      <td><code>year</code></td>
      <td>
      Returns the year from a given date. Add an optional second parameter to specify
      whether a 'fiscal' or 'calendar' year is used to calculate the result. Default
      is 'calendar'. (In examples, start of fiscal year is set to May 01. Per standard
      convention, the fiscal year is defined by the year-end date.)
      </td>
      <td>
      <code class="highlighter-rouge">year (01/15/2014) = 2014</code><br>
      <code class="highlighter-rouge">year (12/15/2013, 'fiscal' ) = 2014</code><br>
      <code class="highlighter-rouge">year (date ordered)</code></td>
    </tr>
  </tbody>
</table>
