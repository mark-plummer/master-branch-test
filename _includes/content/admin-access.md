Each ThoughtSpot cluster has three default users. Contact your ThoughtSpot support team to get
the passwords.

<table>
<colgroup>
  <col width="15%">
  <col width="15%">
    <col width="70%">
</colgroup>
  <tr>
    <th>Type</th>
    <th>Username</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>Shell user</td>
    <td id="admin"><code>admin</code></td>
    <td>For work that requires <code>sudo</code> or <code>root</code> privileges
        <p>Not for application login</p>
        <p>Logs for this user are in <code>/usr/local/scaligent/logs</code> directory</p></td>
  </tr>
  <tr>
    <td>Shell user</td>
    <td id="thoughtspot"><code>thoughtspot</code></td>
    <td>For command-line work that does not <code>sudo</code> or <code>root</code> privileges
        <p>Can use <code>tsload</code>, <code>tql</code>, and check the cluster status</p>
        <p>Not for application login</p>
        <p>Logs for this user are in <code>/tmp</code> directory</p></td>
  </tr>
  <tr>
    <td>Application user</td>
    <td id="tsadmin"><code>tsadmin</code></td>
    <td>Access through a Web browser</td>
  </tr>
</table>

Both the [`admin`](#admin) and [`thoughtspot`](#thoughtspot) user can SSH into the cluster. After
authenticating, either user can use and and all of the following utilities:

* [tscli]({{ site.baseurl }}/reference/tscli-command-ref.html); [`thoughtspot`](#thoughtspot) user cannot use commands that require
`sudo` or `root` privileges
* [tsload]({{ site.baseurl }}/admin/loading/use-data-importer.html)
* [tql]({{ site.baseurl }}/reference/sql-cli-commands.html)
