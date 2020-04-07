<table>
   <colgroup>
      <col style="width:5%" />
      <col style="width:75%" />
   </colgroup>
   <thead class="thead" style="text-align:left;">
      <tr>
         <th>Keyword</th>
         <th>Examples</th>
      </tr>
   </thead>
   <tbody class="tbody">
      <tr>
         <td>top <i>n</i></td>
         <td>
          <ul><li><code><b>top 10</b> sales rep revenue</code></li>
          <li><code><b>top</b> sales rep by count sales for average revenue > 10000</code></li>
          <li><code>sales rep average revenue for each region <b>top</b> </code></li> </ul>
         </td>
      </tr>
      <tr>
         <td>bottom <i>n</i></td>
         <td>
            <ul><li><code><b>bottom 25</b> customer by revenue for each sales rep</code></li>
            <li><code><b>bottom</b> revenue average</code></li>
            <li><code><b>bottom</b> revenue by state</code></li>
            <li><code>customer by revenue for each sales rep <b>bottom</b></code></li></ul>
         </td>
      </tr>
      <tr>
         <td>sort by</td>
         <td>
            <ul>
            <li><code>revenue by state <b>sort by</b> average revenue</code></li>
            <li><code>revenue by customer <b>sort by</b> region</code></li>
            </ul>
         </td>
      </tr>
   </tbody>
</table>
{% include note.html content="When using the <b>top</b> or <b>bottom</b> keywords without specifying a number (<b><i>n</i></b>), the number defaults to 10." %}
