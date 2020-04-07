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
    <tr id="average">
      <td><code>average</code></td>
      <td>Returns the average of all the values of a column.</td>
      <td><code class="highlighter-rouge">average (revenue)</code></td>
    </tr>
    <tr id="average_if">
      <td><code>average_if</code></td>
      <td>Returns the average of all the columns that meet a given criteria.</td>
      <td><code class="highlighter-rouge">average_if(city = "San Francisco", revenue)</code></td>
    </tr>
    <tr id="count">
      <td><code>count</code></td>
      <td>Returns the number of rows in the table containing the column.</td>
      <td><code class="highlighter-rouge">count (product)</code></td>
    </tr>
    <tr id="count_if">
      <td><code>count_if</code></td>
      <td>Returns the number of rows in the table containing the column.</td>
      <td><code class="highlighter-rouge">count_if(region =’west’, region)</code></td>
    </tr>
    <tr id="cumulative_average">
      <td><code>cumulative_average</code></td>
      <td>Takes a measure and one or more attributes. Returns the average of the measure, accumulated by the attribute(s) in the order specified.</td>
      <td><code class="highlighter-rouge">cumulative_average (revenue, order date, state)</code></td>
    </tr>
    <tr id="cumulative_max">
      <td><code>cumulative_max</code></td>
      <td>Takes a measure and one or more attributes. Returns the maximum of the measure, accumulated by the attribute(s) in the order specified.</td>
      <td><code class="highlighter-rouge">cumulative_max (revenue, state)</code></td>
    </tr>
    <tr id="cumulative_min">
      <td><code>cumulative_min</code></td>
      <td>Takes a measure and one or more attributes. Returns the minimum of the measure, accumulated by the attribute(s) in the order specified.</td>
      <td><code class="highlighter-rouge">cumulative_min (revenue, campaign)</code></td>
    </tr>
    <tr id="cumulative_sum">
      <td><code>cumulative_sum</code></td>
      <td>Takes a measure and one or more attributes. Returns the sum of the measure, accumulated by the attribute(s) in the order specified.</td>
      <td><code class="highlighter-rouge">cumulative_sum (revenue, order date)</code></td>
    </tr>
    <tr id="group_aggregate">
      <td><code>group_aggregate</code></td>
      <td>
      Takes a measure and optional attributes and filters. Used
      to aggregate measures with different granularities and filters than the columns used in the search. Commonly used in comparison
      analysis.
      <p>This formula takes the following form:<br>
      <code>group_aggregate (&lt;aggregation(measure)&gt;, &lt;groupings&gt;, &lt;filters&gt;)</code></p>
      <p>Define lists using curly brackets, <code>{ }</code>. Optional list functions <code>query_groups</code> or
      <code>query_filters</code> specify the lists or filters used in the original search. Use <code>+</code> (plus) and <code>-</code> (minus) to add or exclude specific columns for query groups.</p>
      <p>See <a href="{{"/complex-search/aggregation-flexible.html" | prepend: site.baseurl }}">Flexible aggregation functions</a>.</p>
      </td>
      <td><code class="highlighter-rouge">group_aggregate (sum (revenue), {ship mode, date}, {} )</code><br /><br />
      <code class="highlighter-rouge">group_aggregate (sum (revenue), {ship mode , date}, {day_of_week (date) = 'friday'} )</code><br /><br />
      <code class="highlighter-rouge">group_aggregate (sum (revenue), query_groups(), query_filters() )</code><br /><br />
      <code class="highlighter-rouge">group_aggregate (sum (revenue), query_groups() + {date}, query_filters() )</code>
      </td>
    </tr>
    <tr id="group_average">
      <td><code>group_average</code></td>
      <td>Takes a measure and one or more attributes. Returns the average of the measure grouped by the attribute(s).</td>
      <td><code class="highlighter-rouge">group_average (revenue, customer region, state)</code></td>
    </tr>
    <tr id="group_count">
      <td><code>group_count</code></td>
      <td>Takes a measure and one or more attributes. Returns the count of the measure grouped by the attribute(s).</td>
      <td><code class="highlighter-rouge">group_count (revenue, customer region)</code></td>
    </tr>
    <tr id="group_max">
      <td><code>group_max</code></td>
      <td>Takes a measure and one or more attributes. Returns the maximum of the measure grouped by the attribute(s).</td>
      <td><code class="highlighter-rouge">group_max (revenue, customer region)</code></td>
    </tr>
    <tr id="group_min">
      <td><code>group_min</code></td>
      <td>Takes a measure and one or more attributes. Returns the minimum of the measure grouped by the attribute(s).</td>
      <td><code class="highlighter-rouge">group_min (revenue, customer region)</code></td>
    </tr>
    <tr id="group_stddev">
      <td><code>group_stddev</code></td>
      <td>Takes a measure and one or more attributes. Returns the standard deviation of the measure grouped by the attribute(s).</td>
      <td><code class="highlighter-rouge">group_stddev (revenue, customer region)</code></td>
    </tr>
    <tr id="group_sum">
      <td><code>group_sum</code></td>
      <td>Takes a measure and one or more attributes. Returns the sum of the measure grouped by the attribute(s).</td>
      <td><code class="highlighter-rouge">group_sum (revenue, customer region)</code></td>
    </tr>
    <tr id="group_unique_count">
      <td><code>group_unique_count</code></td>
      <td>Takes a measure and one or more attributes. Returns the unique count of the measure grouped by the attribute(s).</td>
      <td><code class="highlighter-rouge">group_unique_count (product , supplier)</code></td>
    </tr>
    <tr id="group_variance">
      <td><code>group_variance</code></td>
      <td>Takes a measure and one or more attributes. Returns the variance of the measure grouped by the attribute(s).</td>
      <td><code class="highlighter-rouge">group_variance (revenue, customer region)</code></td>
    </tr>
    <tr id="max">
      <td><code>max</code></td>
      <td>Returns the maximum value of a column.</td>
      <td><code class="highlighter-rouge">max (sales)</code></td>
    </tr>
    <tr id="max_if">
      <td><code>max_if</code></td>
      <td>Returns the maximum value among columns that meet a criteria.</td>
      <td><code class="highlighter-rouge">max_if( (revenue > 10) , customer region )</code></td>
    </tr>
    <!-- SCAL-49352
    <tr id="median">
      <td><code>median</code></td>
      <td>Returns the median value of a column.</td>
      <td><code>median (measure)</code>
      {% include note.html content="Fact table limit is 10 million (10<sup>7</sup>) rows." %}</td>
    </tr>-->
    <tr id="min">
      <td><code>min</code></td>
      <td>Returns the minimum value of a column.</td>
      <td><code class="highlighter-rouge">min (revenue)</code></td>
    </tr>
    <tr id="min-if">
      <td><code>min_if</code></td>
      <td>Returns the minimum value among columns that meet a criteria.</td>
      <td><code class="highlighter-rouge">min_if( (revenue < 10) , customer region )</code></td>
    </tr>
    <tr id="moving_average">
      <td><code>moving_average</code></td>
      <td>Takes a measure, two integers to define the window to aggregate over, and one or more attributes. The window is (current - Num1…Current + Num2) with both end points being included in the window. For example, “1,1” will have a window size of 3. To define a window that begins before Current, specify a negative number for Num2. Returns the average of the measure over the given window. The attributes are the ordering columns used to compute the moving average.</td>
      <td><code class="highlighter-rouge">moving_average (revenue, 2, 1, customer region)</code></td>
    </tr>
    <tr id="moving_max">
      <td><code>moving_max</code></td>
      <td>Takes a measure, two integers to define the window to aggregate over, and one or more attributes. The window is (current - Num1…Current + Num2) with both end points being included in the window. For example, “1,1” will have a window size of 3. To define a window that begins before Current, specify a negative number for Num2. Returns the maximum of the measure over the given window. The attributes are the ordering columns used to compute the moving maximum.</td>
      <td><code class="highlighter-rouge">moving_max (complaints, 1, 2, store name)</code></td>
    </tr>
    <tr id="moving_min">
      <td><code>moving_min</code></td>
      <td>Takes a measure, two integers to define the window to aggregate over, and one or more attributes. The window is (current - Num1…Current + Num2) with both end points being included in the window. For example, “1,1” will have a window size of 3. To define a window that begins before Current, specify a negative number for Num2. Returns the minimum of the measure over the given window. The attributes are the ordering columns used to compute the moving minimum.</td>
      <td><code class="highlighter-rouge">moving_min (defects, 3, 1, product)</code></td>
    </tr>
    <tr id="moving_sum">
      <td><code>moving_sum</code></td>
      <td>Takes a measure, two integers to define the window to aggregate over, and one or more attributes. The window is (current - Num1…Current + Num2) with both end points being included in the window. For example, “1,1” will have a window size of 3. To define a window that begins before Current, specify a negative number for Num2. Returns the sum of the measure over the given window. The attributes are the ordering columns used to compute the moving sum.</td>
      <td><code class="highlighter-rouge">moving_sum (revenue, 1, 1, order date)</code></td>
    </tr>
    <!-- SCAL-49352
    <tr id="nth_percentile"><td><code>nth_percentile</code></td><td>Returns the nth percentile of a group of measures.</td><td><code>nth_percentile (measure, n, 'asc')</code>,<br><code>nth_percentile (measure, n, 'desc')</code>
    {% include note.html content="Fact table limit is 10 million (10<sup>7</sup>) rows." %}</td></tr>-->
    <tr id="rank">
      <td><code>rank</code></td>
      <td>Returns the rank for the current row. Identical values receive an identical rank. Takes an aggregate input for the first argument. The second argument specifies the order, <code>'asc' | 'desc'</code>.</td>
      <td><code class="highlighter-rouge">rank (sum (revenue) , 'asc' )</code><br><code class="highlighter-rouge">rank (sum (revenue) , ‘desc' )</code>
      </td>
    </tr>
    <tr id="rank_percentile">
      <td><code>rank_percentile</code></td>
      <td>Returns the percentile rank for the current row. Identical values are assigned an identical percentile rank. Takes an aggregate input for the first argument. The second argument specifies the order, <code>'asc' | 'desc'</code>.</td>
      <td><code class="highlighter-rouge">rank_percentile (sum (revenue) , 'asc' )</code><br><code class="highlighter-rouge">rank_percentile (sum (revenue) , 'desc' )</code></td>
    </tr>
    <tr id="stddev">
      <td><code>stddev</code></td>
      <td>Returns the standard deviation of all values of a column.</td>
      <td><code class="highlighter-rouge">stddev (revenue)</code></td>
    </tr>
    <tr id="stddev_if">
      <td><code>stddev_if</code></td>
      <td>Returns a standard deviation values filtered to meet a specific criteria.</td>
      <td><code class="highlighter-rouge">stddev_if( (revenue > 10) , (revenue/10.0) )</code></td>
    </tr>
    <tr id="sum">
      <td><code>sum</code></td>
      <td>Returns the sum of all the values of a column.</td>
      <td><code class="highlighter-rouge">sum (revenue)</code></td>
    </tr>
    <tr id="sum_if">
      <td><code>sum_if</code></td>
      <td>Returns sum values filtered by a specific criteria.</td>
      <td><code class="highlighter-rouge">sum_if(region=’west’, revenue)</code></td>
    </tr>
    <tr id="unique_count">
      <td><code>unique count</code></td>
      <td>Returns the number of unique values of a column.</td>
      <td><code class="highlighter-rouge">unique count (customer)</code></td>
    </tr>
    <tr id="unique_count_if">
      <td><code>unique_count_if</code></td>
      <td>Returns the number of unique values of a column provided it meets a criteria.</td>
      <td><code class="highlighter-rouge">unique_count_if( (revenue > 10) , order date )</code></td>
    </tr>
    <tr id="variance">
      <td><code>variance</code></td>
      <td>Returns the variance of all the values of a column.</td>
      <td><code class="highlighter-rouge">variance (revenue)</code></td>
    </tr>
    <tr id="variance_if">
      <td><code>variance_if</code></td>
      <td>Returns the variance of all the values of a column provided it meets a criteria..</td>
      <td><code class="highlighter-rouge">variance_if( (revenue > 10) , (revenue/10.0) )</code></td>
    </tr>
  </tbody>
</table>
