<table>
<colgroup>
   <col style="width:5%" />
   <col style="width:45%" />
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
    <tr id="concat">
      <td><code>concat</code></td>
      <td>Returns two or more values as a concatenated text string. Use single quotes around each literal string, not double quotes.
</td>
      <td><code class="highlighter-rouge">concat ( 'hay' , 'stack' ) = 'haystack'</code><br><code class="highlighter-rouge">concat (title, ' ', first_name , ' ', last_name)</code></td>
    </tr>
    <tr id="contains">
      <td><code>contains</code></td>
      <td>Returns true if the first string contains the second string, otherwise returns false.</td>
      <td><code class="highlighter-rouge">contains ('broomstick', 'room') = true</code><br><code class="highlighter-rouge">contains (product, 'trial version')</code></td>
    </tr>
    <tr id="edit_distance">
      <td><code>edit_distance</code></td>
      <td>Accepts two text strings. Returns the edit distance (minimum number of operations required to transform one string into the other) as an integer. Works with strings under 1023 characters.</td>
      <td><code class="highlighter-rouge">edit_distance ('attorney', 'atty') = 4</code><br><code class="highlighter-rouge">edit_distance (color, 'red')</code></td>
    </tr>
    <tr id="edit_distance_with_cap">
      <td><code>edit_distance_with_cap</code></td>
      <td>Accepts two text strings and an integer to specify the upper limit cap for the edit distance (minimum number of operations required to transform one string into the other). If the edit distance is less than or equal to the specified cap, returns the edit distance. If it is higher than the cap, returns the cap plus 1. Works with strings under 1023 characters.</td>
      <td><code class="highlighter-rouge">edit_distance_with_cap ('pokemon go', 'minecraft pixelmon', 3) = 4</code><br><code class="highlighter-rouge">edit_distance_with_cap (event, 'burning man', 3)</code></td>
    </tr>
    <tr id="similar_to">
      <td><code>similar_to</code></td>
      <td>Accepts a document text string and a search text string. Returns true if relevance score (0-100) of the search string with respect to the document is greater than or equal to 20. Relevance is based on edit distance, number of words in the query, and length of words in the query which are present in the document.</td>
      <td><code class="highlighter-rouge">similar_to ('hello world', 'hello swirl') = true</code><br><code class="highlighter-rouge">similar_to (current team, drafted by)</code></td>
    </tr>
    <tr id="similarity">
      <td><code>similarity</code></td>
      <td>Accepts a document text string and a search text string. Returns the relevance score (0-100) of the search string with respect to the document. Relevance is based on edit distance, number of words in the query, and length of words in the query which are present in the document. If the two strings are an exact match, returns 100.</td>
      <td><code class="highlighter-rouge">similarity ('where is the burning man concert', 'burning man') = 46</code><br><code class="highlighter-rouge">similarity (tweet1, tweet2)</code></td>
    </tr>
    <tr id="spells_like">
      <td><code>spells_like</code></td>
      <td>Accepts two text strings. Returns true if they are spelled similarly and false if they are not. Works with strings under 1023 characters.</td>
      <td><code class="highlighter-rouge">spells_like ('thouhgtspot', 'thoughtspot') = true</code><br><code class="highlighter-rouge">spells_like (studio, distributor)</code></td>
    </tr>
    <tr id="strlen">
      <td><code>strlen</code></td>
      <td>Returns the length of the text.</td>
      <td><code class="highlighter-rouge">strlen ('smith') = 5</code><br><code class="highlighter-rouge">strlen (lastname)</code></td>
    </tr>
    <tr id="strpos">
      <td><code>strpos</code></td>
      <td>Returns the numeric position (starting from 0) of the first occurrence of the second string in the first string, or -1 if not found.</td>
      <td><code class="highlighter-rouge">strpos ('haystack_with_needles', 'needle') = 14</code><br><code class="highlighter-rouge">strpos (complaint, 'lawyer')</code></td>
    </tr>
    <tr id="substr">
      <td><code>substr</code></td>
      <td>Returns the portion of the given string, beginning at the location specified (starting from 0), and of the given length.</td>
      <td><code class="highlighter-rouge">substr ('persnickety', 3, 7) = snicket</code><br><code class="highlighter-rouge">substr (lastname, 0, 5)</code></td>
    </tr>
  </tbody>
</table>
