---
title: [Sync users and groups from LDAP]


last_updated: tbd
summary: "Use this procedure to synchronize your ThoughtSpot system with an LDAP server."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Before synchronizing users and groups, you need this information:

-   IP address and port of the server where your ThoughtSpot instance is running. This hostport is needed in the following format `http(s)://<host>:<port>` or `http(s)://<domain>`.
-   Administrator login username and password for your ThoughtSpot instance.
-   URL of the LDAP server, or hostport.

    For example, `ldap://192.168.2.48:389`

-   Login username and password for the LDAP system.

    An example username would be `moo_100@ldap.thoughtspot.com`

-   Distinguished Name (DN) for the base to start searching for users in the LDAP system.

    For example, `DC=ldap,DC=thoughtspot,DC=com`

-   Location of the Python synchronization script, in case you want to modify it or create your own: `/usr/local/scaligent/release/callosum/utilities/ldap_sync_python_api/syncUsersAndGroups.py`

There are two ways for you to fetch users and groups from LDAP and populate them
into your ThoughtSpot system:

-   Run the synchronization script in interactive mode, which will walk you through the process (shown here).
-   Create your own Python script by using the ThoughtSpot Python APIs. If you need details on the Python APIs, contact ThoughtSpot Support. If you choose this method, you can run the script periodically using a cron job.

To run the LDAP sync script in interactive mode:

1. Log in to the Linux shell using SSH.
2. Run the command to start the script:

    ```
    python syncUsersAndGroups.py interactive
    ```

3. Answer the prompts using the information you collected above. For example:

    ```
    Complete URL of TS server in format "http(s)://<host>:<port>": http://10.77.145.24:8088
    Disable SSL authentication to TS server (y/n): y
    Login username for ThoughtSpot system: admin
    Login password for ThoughtSpot system: 12345
    Complete URL of server where LDAP server is running in format ldap(s)://<host>:<port>: ldap://192.168.2.48:389
    Login username for LDAP system: moo_100@ldap.thoughtspot.com
    Login password for LDAP system: 12345
    Syncs user and groups between LDAP and TS systems (y/n): y
    Delete entries in ThoughtSpot system that are not currently in LDAP tree being synced (y/n): n
    Distinguished name for the base to start searching groups in LDAP System: DC=ldap,DC=thoughtspot,DC=com
    Scope to limit the search to (choice number)
    0:base Searching only the entry at the base DN
    1:one Searching all entries on level under the base DN - but not including the base DN
    2:tree Searching of all entries at all levels under and including the specified base DN: 2
    ```

    ```
    Filter string to apply the search to: (|(CN=TestGroupAlpha)(CN=TestGroupBeta))
    ```

    Answering this prompt is optional. If left blank, the default value of `'(CN=*)'`will be used.

    ```
    Apply sync recursively, i.e. Iterates through group members and creates member groups, users and relationships in a recursive way. (y/n): n
    ```

    This prompt is asking if you would like to include group members even if they do not belong to the current sub tree that is being synced.

4. Alternatively, to input your own shorthand script commands:

    Issue the Python script commands, supplying all this information, following this format example:

    ```
    python syncUsersAndGroups.py script \
    –-ts_hostport <ts_hostport> \
    --disable_ssl \
    --ts_uname <ts_username> \
    --ts_pass <ts_password> \
    --ldap_hostport '<ldap_hostport>' \
    --ldap_uname '<ldap_username>' \
    --ldap_pass '<ldap_password>' \
    --sync \
    --purge \
    --basedn 'DC=ldap,DC=thoughtspot,DC=com' \
    --filter_str '(|(CN=TestGroupAlpha)(CN=TestGroupBeta))' \
    --include_nontree_members
    ```

    The bottom half of the preceding command targets sub trees under the DC called TestGroupAlpha and TestGroupBeta, and iterates through them recursively to create/sync users, groups, and their relationships in the ThoughtSpot system. It also deletes any other entities created in the ThoughtSpot system from this LDAP system that are not currently being synced.

### `syncUsersAndGroups.py` command-line switches

The following table provides a description of each command-line switch available for the `syncUsersAndGroups` python script.

  <table width="100%" border="0">
  <col width="260">
  <col width="900">
	  <tbody>
	    <tr>
	      <th scope="col">Switch</th>
	      <th scope="col">Description</th>
        </tr>
        <tr>
  	      <td><code>--ts_hostport &lt;ts_hostport&gt;</code></td>
  	      <td>ThoughtSpot cluster host port. Default port is 8088.</td>
          </tr>  
	    <tr>
	      <td><code>--disable_ssl</code></td>
	      <td>Controls the communication between the sync script and the ThoughtSpot cluster. It disables SSL communications between the script and the cluster ONLY, and prevents the need to provide SSL certs during the script execution in order to create users and groups.</td>
        </tr>
	    <tr>
	      <td><code>--ts_uname</code></td>
	      <td>ThoughtSpot cluster username. The <code>admin</code> user is usually used.</td>
        </tr>
	    <tr>
	      <td><code>--ts_pass</code></td>
	      <td>ThoughtSpot cluster password.</td>
        </tr>
		<tr>
	      <td><code>--ldap_hostport</code></td>
	      <td>AD/LDAP server port that is queried. Default is 389.</td>
        </tr>
		<tr>
	      <td><code>--ldap_uname</code></td>
	      <td>Username for the LDAP/AD server.</td>
        </tr>
		<tr>
	      <td><code>--ldap_pass &lt;ldap_password&gt;</code></td>
	      <td>Password for the LDAP/AD server.</td>
        </tr>
		<tr>
	      <td><code>--sync</code></td>
	      <td>Syncs users and groups which match the <code>basedn</code> and <code>filter_str</code> queries to your ThoughtSpot cluster.</td>
        </tr>
		<tr>
	      <td><code>--purge</code></td>
	      <td>Purges any users that exist in ThoughtSpot, but not in AD.</td>
        </tr>
		<tr>
	      <td><code>--basedn</code></td>
	      <td>Place in the directory that will be searched for users.</td>
        </tr>
		<tr>
	      <td><code>--filter_str</code></td>
	      <td>Further filters results from your base DN.</td>
        </tr>
		<tr>
	      <td><code>--include_nontree_members</code></td>
	      <td>Includes group members from LDAP/AD even if they do not belong to the current subtree that is being synced.</td>
        </tr>	  
  </tbody>
</table>
