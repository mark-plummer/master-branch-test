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
    <tr id="to_bool">
      <td><code>to_bool</code></td>
      <td>Returns the input as a <code>boolean</code> data type (<code>true</code> or <code>false</code>).</td>
      <td><code class="highlighter-rouge">to_bool (0) = false</code><br><code class="highlighter-rouge">to_bool (married)</code></td>
    </tr>
    <tr id="to_date">
      <td><code>to_date</code></td>
      <td>Accepts a date represented as an integer or text string, and a second string parameter that can include <code>strptime</code> date formatting elements.<br>Replaces all the valid strptime date formatting elements with their string counterparts and returns the result.<br>Does not accept epoch formatted dates as input.</td>
      <td><code class="highlighter-rouge">to_date (date_sold, '%Y-%m-%d')</code></td>
    </tr>
    <tr id="to_double">
      <td><code>to_double</code></td>
      <td>Returns the input as a <code>double</code> data type.</td>
      <td><code class="highlighter-rouge">to_double ('3.14') = 3.14</code><br><code class="highlighter-rouge">to_double (revenue * .01)</code></td>
    </tr>
    <tr id="to_integer">
      <td><code>to_integer</code></td>
      <td>Returns the input as an integer.</td>
      <td><code class="highlighter-rouge">to_integer ('45') + 1 = 46</code><br><code class="highlighter-rouge">to_integer (price + tax - cost)</code></td>
    </tr>
    <tr id="to_string">
      <td><code>to_string</code></td>
      <td>Returns the input as a text string. To convert a date data type to a string data type, specify the date format you want to use.</td>
      <td><code class="highlighter-rouge">to_string (45 + 1) = '46'</code>
      <br><code class="highlighter-rouge">to_string (revenue - cost)</code>
      <br><code class="highlighter-rouge">to_string (date,('%m/%d/%y')) </code></td>
    </tr>
  </tbody>
</table>
