<table>
<colgroup>
<col width="25%" />
<col width="75%" />
</colgroup>
  <thead>
    <tr>
      <th>Privilege</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Can administer ThoughtSpot</strong></td>
      <td>Can manage Users and Groups and has view and edit access to all data. Users with this privilege can also download a saved answer. </td>
    </tr>
    <tr>
      <td><strong>Can upload user data</strong></td>
      <td>Can upload their own data from the application's <strong>Data</strong> page using <strong>Actions > Upload data</strong>.</td>
    </tr>
    <tr>
      <td><strong>Can download data</strong></td>
      <td>Can download data from search results and pinboards.</td>
    </tr>
    <tr>
      <td><strong>Can share with all users</strong></td>
      <td>Can see the names of and share with users outside of the groups the user belongs to. Members of groups with this privilege can also share with groups marked as
      <strong>NOT SHAREABLE</strong>.</td>
    </tr>
    <tr>
      <td><strong>Can manage data</strong></td>
      <td>Can create worksheets and views.<br>Note that to edit a worksheet or a view created by another user, you must have the **Edit** permission on that object, and it must be shared with you.</td>
    </tr>
    <tr>
      <td><strong>Can use experimental features</strong></td>
      <td>Can access trial and experimental features that ThoughtSpot makes available to early adopters.</td>
    </tr>
    <tr>
      <td><strong>Can invoke Custom R Analysis</strong></td>
      <td>Can access R scripts to further explore search answers. Includes options to invoke R scripts on visualizations, create and share custom scripts, and share the results of R analysis as answers and pinboards.</td>
    </tr>
    <tr>
      <td><strong>Can schedule pinboards</strong></td>
      <td>Can create pinboard schedules and edit their own scheduled jobs.</td>
    </tr>
    <tr>
      <td><strong>Has SpotIQ privilege</strong></td>
      <td>Can use the SpotIQ feature.<br>If this privilege is not enabled for the user, they can still see "Did you know" SpotIQ insights on the ThoughtSpot home page.</td>
    </tr>
    <tr>
      <td><strong>Can administer and bypass RLS</strong></td>
      <td><p>Users in groups with this privilege (directly or through group inheritance):</p>
<ul>      <li>Are exempt from row-level security (RLS) rules.</li>
      <li>Can add/edit/delete existing RLS rules.</li>
      <li>Can check or uncheck Bypass RLS on a worksheet.</li></ul>

      <p>Your installation configuration may enable or disable the availability of this privilege. By default, it is enabled. Administrators or groups with the privilege <b>Can administer ThoughtSpot</b> can grant this privilege.</p> </td>
    </tr>
  </tbody>
</table>
