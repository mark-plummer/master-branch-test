---
title: [tscli command reference]
last_updated: 11/13/2019
summary: "The ThoughtSpot command line interface, or tscli, is an administration interface for the cluster. Use tscli to take snapshots (backups) of data, apply
updates, stop and start the services, and view information about the system.
This reference defines each subcommand."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

The command returns `0` on success, and a non-zero exit code on failure.
The `tscli` command logs errors to the `stderr` directory.

{: id="tscli-command"}
## How to use the tscli command

The `tscli` command has the following syntax:

<pre>
tscli [-h]
      [--helpfull]
      [--verbose]
      [--noautoconfig]
      [--autoconfig]
      [--yes]
      [--cluster ]
      [--zoo ]
      {access,alert,ansible,backup,backup-policy,calendar,callhome,cassandra,cluster,command,dr-mirror,etl,event,feature,fileserver,firewall,hdfs,ipsec,ldap,logs,map-tiles,monitoring,nas,node,notification,onboarding,patch,rpackage,saml,scheduled-pinboards,set,smtp,snapshot,snapshot-policy,socialproof,spot,ssl,sssd,storage,support,tokenauthentication}
</pre>

The `tscli` command has several subcommands, such as `alert`, `backup`, and so on.

Issue subcommands using the following format:

```
tscli [subcommand]
```

Subcommands have their own additional options and actions, such as `tscli backup
create` or `tscli backup delete`.  

Each subcommand may have several options. When a subcommand option is of the form <code>tscli subcommand --flag <em>FLAG</em></code>, it requires a specific input from the user. For example, the command <code>tscli access list --type <em>TYPE</em></code>, where you want a list of pinboards, takes the form `tscli access list type pinboard`.

To view help for a subcommand, type `-h` after the subcommand option:

```
tscli [subcommand] -h
```

{: id="tscli-optional-flags"}
## tscli optional flags

There are eight optional flags common to each `tscli` subcommand.

{: id="tscli--help"}
### help
```
-h, --help
```

Shows help for a command. This flag lists the specified command's subcommands and their definitions.

{: id="tscli--helpfull"}
### helpfull
```
--helpfull HELPFUll
```

This flag shows help for all supported commands.

{: id="tscli--verbose"}
### verbose
```
--verbose
```

Turns verbose logging on for the console. By default, logs are written to both the console and log files, with the log files containing the highest verbosity log messages.

The default is `false`.

{: id="tscli--noautoconfig"}
### noautoconfig
```
--noautoconfig
```

Prompts y/n for each question within a command instead of assuming `yes`.

The default is `True`.

{: id="tscli--autoconfig"}
### autoconfig
```
--autoconfig
```

Automatically configures properties of the cluster when possible. User may still be prompted for certain inputs.

The default is `False`.

{: id="tscli--yes"}
### yes
```
--yes
```

Automatically configures properties of the cluster when possible. User may still be prompted for certain inputs.

The default is `False`.

{: id="tscli--cluster"}
### cluster
```
--cluster CLUSTER
```

Name of the cluster. Used when a cluster is not automatically detected.

The default is `False`.

{: id="tscli--zoo"}
### zoo
```
--zoo ZOO
```

List of Zookeeper servers, comma separated. Used when a cluster is not automatically detected.

{: id="tscli-subcommands"}
## tscli subcommands

This section lists each subcommand and its syntax.

{: id="tscli-access"}
### access

```
tscli access [-h] {list}
```

This subcommand has the following option:

<dl>
  <dlentry>
    <dt><code>tscli access list</code></dt>
    <dd>Lists objects by last access time, with the following parameters:
    <dl>
  <dlentry>
    	<dt><code>--type <em>TYPE</em></code></dt>
    	<dd>Type of object, either answer or pinboard.</dd>
  </dlentry>
  <dlentry>
  <dt><code>--limit	<em>LIMIT</em></code></dt>
    <dd><p>The number of objects to fetch.</p>
      <p>The default is 30.</p> </dd>
  </dlentry>
  <dlentry>
  <dt><code>--offset <em>OFFSET</em></code></dt>
    <dd><p>Offset to use to skip objects for batched results.</p>
    <p>
      The default is 0.
      </p></dd>
  </dlentry>
  <dlentry>
  <dt><code>--ascending</code></dt>
    <dd><p>
      Sorts the answers by access time ascending.
      </p>
    <p>
      The default is <code>True</code>.
      </p></dd>
  </dlentry>
</dl>
</dd>
  </dlentry>
</dl>

{: id="tscli-alert"}
### alert

```
tscli alert [-h] {count,info,list,off,on,refresh,silence,status,unsilence}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli alert count</code></dt>
    <dd>Lists counts of generated alerts by type.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli alert info</code></dt>
    <dd>Lists all alerts. Add <code>--silenced</code> to list only silenced alerts, <code>--active</code> to list only active alerts, or <code>--detailed</code> to get detailed alert information.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli alert list</code></dt>
    <dd>Lists the generated alerts, with these parameters:
    <dl>
    <dlentry>
    <dt><code>--limit <em>LIMIT</em></code></dt>
    <dd>Specifies the number of recent alerts to display.</dd>
    </dlentry>
    <dlentry>
    <dt><code>--since <em>SINCE</em></code></dt>
    <dd>Lists all alerts raised since a specified time period, in the form of a human readable duration string, such as 4h (4 hours) or 4m (4 minutes).</dd>
    </dlentry>
    </dl>
    </dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli alert off</code></dt>
    <dd>Disables all alerts from the cluster in the cluster's timezone.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli alert on</code></dt>
    <dd>Enables alerts from the cluster.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli alert refresh</code></dt>
    <dd>Refreshes alert metadata on the cluster.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli alert silence --name <em>NAME</em></code></dt>
    <dd>Silences the alert with <code>NAME</code>. For example, <code>DISK_ERROR</code>. Silenced alerts are still recorded in postgres; however, emails are not sent out.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli alert status</code></dt>
    <dd>Shows the status of cluster alerts.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli alert unsilence --name  <em>NAME</em></code></dt>
    <dd>Unsilences the alert with <code>NAME</code>. For example, <code>DISK_ERROR</code>.</dd>
   </dlentry>
</dl>   

{: id="tscli-ansible"}
### ansible

```
tscli ansible [-h] {checkout,commit} [--local]
```

This subcommand has the following options:

   <dl>
     <dlentry>
       <dt><code>tscli ansible checkout --host <em>HOST</em></code></dt>
       <dd>Checks out Ansible playbook with the target <code>HOST</code> that is running the ts_ansible service.</dd>
     </dlentry>

     <dlentry>
       <dt><code>tscli ansible commit --host <em>HOST</em></code></dt>
       <dd>Commits Ansible playbooks with the target <code>HOST </code> that is running the ts_ansible service.</dd>
     </dlentry>
</dl>

   Use this subcommand to install and configure third-party software on the ThoughtSpot cluster.  

   For details, see these articles:

   - [About third party security and monitoring software]({{ site.baseurl}}/admin/data-security/about-secure-monitor-sw.html#)
   - [Installing third party security and monitoring software]({{ site.baseurl}}/admin/data-security/install-secure-monitor-sw.html#)

{: id="tscli-backup"}
### backup

```
tscli backup [-h] {create,delete,ls,restore}
```

  This subcommand has the following options:

  <dl>
    <dlentry>
      <dt><code>tscli backup create [-h] [--mode {full,light,dataless}] [--type {full,incremental}] [--base BASE] <br>[--storage_type {local,nas}] [--remote] [--no-orion-master]</code></dt>
      <dd>
        <p>Pulls a snapshot and saves it as a backup, with these parameters:</p>

        <dl>
          <dlentry>
           <dt><code>--mode {full,light,dataless}</code></dt>
            <dd><p>Mode of backups.</p>
            <p>
              The default is <code>full</code>.
              </p></dd></dlentry>
          <dlentry>
            <dt><code>--type</code></dt>
            <dd>Type of backup. Only <code>STANDALONE</code> is supported.</dd></dlentry>
          <dlentry>
            <dt><code>--base <em>BASE</em></code></dt>
            <dd>
              <p>Based snapshot name for incremental backup.</p>
              <p><strong>Note:</strong> Because <code>incremental</code> is not implemented,  neither is this option.</p>
              <p>There is no default setting.</p></dd></dlentry>
          <dlentry>
            <dt><code>--storage_type {local,nas}</code></dt>
            <dd>
              <p>Storage type of output directory.</p>
              <p>The default setting is <code>local</code>.</p></dd></dlentry>
          <dlentry>
            <dt><code>--remote</code></dt>
            <dd>
              <p>Takes backup through orion master.</p>
              <p>The default setting is <code>True</code>.</p></dd></dlentry>
            <dlentry>
            <dt><code>--no-orion-master</code></dt>
             <dd> <p>
                Determines whether orion master is available during backup.
              </p>
               <p>
                 The default is <code>False</code>.
               </p></dd>
            </dlentry>
          </dl>
      </dd>

      </dlentry>

    <dlentry>
      <dt><code>tscli backup delete <em>ID</em></code></dt>
      <dd>Deletes the backup with the specified ID.</dd>
    </dlentry>

    <dlentry>
      <dt><code>tscli backup ls</code></dt>
      <dd>Lists all backups taken by the system.</dd>
    </dlentry>

    <dlentry>
      <dt><code>tscli backup restore</code></dt>
      <dd>Restores cluster using backup, with the following parameters:
      <dl>
        <dlentry>
        <dt><code>--release <em>RELEASE</em></code></dt>
          <dd>Restore the cluster on a specific release number.</dd>
        </dlentry>
        <dlentry>
        <dt><code>--disable_rotate_keys</code></dt>
          <dd><p>
            Disables cluster rotate key configurations.
            </p>
          <p>
            The default is <code>False</code>.
            </p></dd>
        </dlentry>
        <dlentry>
        <dt><code>--enable_cloud_storage</code></dt>
          <dd>Enables object storage, on the specified platform, either <code>s3a</code> or <code>gcs</code>. For example, run <code>tscli backup restore --enable_cloud_storage=s3a</code> to enable AWS S3 object storage.</dd>
        </dlentry>
        <dlentry>
        <dt>--heterogeneous</dt>
          <dd><p>
            Should be set for heterogeneous clusters.
            </p>
          <p>
            The default is <code>False</code>.
            </p></dd>
        </dlentry>
        </dl>
      </dd>
    </dlentry>
  </dl>

{: id="tscli-backup-policy"}
### backup-policy

```
tscli backup-policy [-h] {create,delete,disable,enable,ls,show,status,update}
```

Manages the backup policy.

This subcommand has the following options:

<dl>
<dlentry>
<dt><code>tscli backup-policy create</code></dt>
<dd>Prompts an editor for you to edit the parameters of a new periodic backup policy, with the following parameters:
<dl>
<dlentry>
<dt><code>name</code></dt>
<dd>Specify a name for your backup.</dd></dlentry>
<dlentry>
<dt><code>mode {full,light,dataless}</code></dt>
<dd>
<p>The backup mode. A `FULL` backup is required for restoring a cluster.</p>
<p>The default is <code>full.</code></p>
</dd></dlentry>
<dlentry>
<dt><code>type</code></dt>
<dd>The backup type. Only <code>STANDALONE</code> is supported.</dd>
<dt><code>directory</code></dt>
<dd>The location on the disk to place the backup. You specify an existing directory path, but the folder (the last part of the path: <code>home/admin/folder</code>) must not already exist. ThoughtSpot creates the folder when it runs a backup.</dd></dlentry>
<dlentry>
<dt><code>storage_type {NAS,local}</code></dt>
<dd>The type of storage you are using. <code>NAS</code> storage is recommended for <code>FULL</code> backups.</dd></dlentry>
<dlentry>
<dt><code>--config <em>CONFIG</em></code></dt>
<dd>Specifies the text format of the periodic backup policy config.</dd></dlentry>
</dl>
</dd></dlentry>
<dlentry>
<dt><code>tscli backup-policy delete <em>NAME</em></code></dt>
<dd>Deletes the backup policy <code>name</code>.</dd></dlentry>

  <dlentry>
    <dt><code>tscli backup-policy disable NAME</code></dt>
    <dd>Disables the policy <code>name</code>.</dd></dlentry>

  <dlentry>
    <dt><code>tscli backup-policy enable <em>NAME</em></code></dt>
    <dd>Enables the policy <code>name</code>.</dd></dlentry>

  <dlentry>
    <dt><code>tscli backup-policy ls</code></dt>
    <dd>Lists backup policies.</dd></dlentry>

  <dlentry>
    <dt><code>tscli backup-policy show NAME</code></dt>
    <dd>Shows the backup policy <code>name</code>.</dd></dlentry>

  <dlentry>
    <dt><code>tscli backup-policy status <em>NAME</em></code></dt>
    <dd>Shows the status of the backup policy <code>name</code>.</dd></dlentry>

  <dlentry>
    <dt><code>tscli backup-policy update <em>NAME</em></code></dt>
    <dd>Prompts an editor for you to edit the backup policy <code>name</code>, with the following parameter:
    <dl>
    <dlentry>
    <dt><code>--config <em>CONFIG</em></code></dt>
    <dd>Specifies the text format of the periodic backup policy config.</dd></dlentry></dl>
    </dd></dlentry>
</dl>

{: id="tscli-calendar"}
### calendar
```
tscli calendar [-h] {create,delete,disable,enable,generate,get,list,update}
```

This subcommand has the following options:

<dl>
<dlentry>
<dt><code>tscli calendar create</code></dt>
<dd>Creates a new custom calendar, with the following parameters:
<dl>
<dlentry>
<dt><code>--file_path <em>FILE_PATH</em></code></dt>
<dd>Path to the CSV file holding custom calendar data.</dd>
</dlentry>
<dlentry>
<dt><code>--name <em>NAME</em></code></dt>
<dd>Custom calendar name.</dd>
</dlentry>
<dlentry>
<dt><code>--separator <em>SEPARATOR</em></code></dt>
<dd><p>The separator used in the CSV file.</p>
<p>The default is <code>,</code>.</p></dd>
</dlentry>
<dlentry>
<dt><code>--no-header-row</code></dt>
<dd><p>Flag to indicate that the CSV file has no header row.</p>
<p>The default is <code>True</code>.</p></dd>
</dlentry>
<dlentry>
<dt><code>--username <em>USERNAME</em></code></dt>
<dd>The admin username for ThoughtSpot login.</dd>
</dlentry>
</dl></dd>
</dlentry>
<dlentry>
<dt><code>tscli calendar delete</code></dt>
<dd>Deletes a custom calendar table from the system, with the following parameters:
<dl>
<dlentry>
<dt><code>--name <em>NAME</em></code></dt>
<dd>Deletes the custom calendar <em>NAME</em>.</dd>
</dlentry>
<dlentry>
<dt><code>--username <em>USERNAME</em></code></dt>
<dd>The admin username for ThoughtSpot login.</dd>
</dlentry></dl></dd>
</dlentry>
<dlentry>
<dt><code>tscli calendar disable</code></dt>
<dd>Disables custom calendar on the cluster.</dd>
</dlentry>
<dlentry>
<dt><code>tscli calendar enable</code></dt>
<dd>Enables custom calendar on the cluster.</dd>
</dlentry>
<dlentry>
<dt><code>tscli calendar generate</code></dt>
<dd>Creates a custom calendar table based on given specifications, with the following parameters:
<dl>
<dlentry>
<dt><code>--name <em>NAME</em></code></dt>
<dd>A name to create the custom calendar CSV file with.</dd>
</dlentry>
<dlentry>
<dt><code>--start_date <em>START_DATE</em></code></dt>
<dd>The start date to begin the custom calendar with in the form mm/dd/yyyy.</dd>
</dlentry>
<dlentry>
<dt><code>--end_date <em>END_DATE</em></code></dt>
<dd>The end date to end the custom calendar with in the form mm/dd/yyyy.</dd>
</dlentry>
<dlentry>
<dt><code>--calendar_type {MONTH_OFFSET,4-4-5,4-5-4,5-4-4}</code></dt>
<dd><p>The type of custom calendar to create.</p>
<p>The default is <code>MONTH_OFFSET</code>.</p></dd>
</dlentry>
<dlentry>
<dt><code>--month_offset {January,February,March,April,May,June,July,August,September,October,November,December}</code></dt>
<dd><p>The month offset to start the year from, if the calendar is the MONTH_OFFSET type.</p>
<p>The default is <code>January</code>.</p></dd>
</dlentry>
<dlentry>
<dt><code>--start_day_of_week</code></dt>
<dd><p>The day the week starts on.</p>
<p>The default is <code>Sunday</code>.</p></dd>
</dlentry>
<dlentry>
<dt><code>--quarter_name_prefix</code></dt>
<dd>The string to prefix a quarter name with.</dd>
</dlentry>
<dlentry>
<dt><code>--year_name_prefix <em>YEAR_NAME_PREFIX</em></code></dt>
<dd>The string to prefix a year name with.</dd>
</dlentry>
<dlentry>
<dt><code>--username <em>USERNAME</em></code></dt>
<dd>The admin username for ThoughtSpot login.</dd>
</dlentry>
</dl></dd>
</dlentry>
<dlentry>
<dt><code>tscli calendar get</code></dt>
<dd>Procures data of a custom calendar as a CSV file, with the following parameters:
<dl><dlentry>
<dt><code>--name <em>NAME</em></code></dt>
<dd>Procures data of custom calendar <code>NAME</code></dd>
</dlentry>
<dlentry>
<dt><code>--username <em>USERNAME</em></code></dt>
<dd>Admin username for ThoughtSpot login.</dd>
</dlentry></dl></dd></dlentry>
<dlentry>
<dt><code>tscli calendar list</code></dt>
<dd>Procures a list of custom calendars present in the cluster, with the following parameter:
<dl>
<dlentry>
<dt><code>--username <em>USERNAME</em></code></dt>
<dd>Admin username for ThoughtSpot login.</dd>
</dlentry></dl></dd></dlentry>
<dlentry>
<dt><code>tscli calendar update</code></dt>
<dd>Updates a custom calendar table in the system, with the following parameters:
<dl>
<dlentry>
<dt><code>--file_path <em>FILE_PATH</em></code></dt>
<dd>Path to the CSV file holding custom calendar data.</dd>
</dlentry>
<dlentry>
<dt><code>--name <em>NAME</em></code></dt>
<dd>Custom calendar name.</dd>
</dlentry>
<dlentry>
<dt><code>--separator <em>SEPARATOR</em></code></dt>
<dd><p>The separator used in the CSV file.</p>
<p>The default is <code>,</code>.</p></dd>
</dlentry>
<dlentry>
<dt><code>--no-header-row</code></dt>
<dd><p>Flag to indicate that the CSV file has no header row.</p>
<p>The default is <code>True</code>.</p></dd>
</dlentry>
<dlentry>
<dt><code>--username <em>USERNAME</em></code></dt>
<dd>The admin username for ThoughtSpot login.</dd>
</dlentry>
</dl></dd>
</dlentry>
</dl>

{: id="tscli-callhome"}
### callhome

```
tscli callhome [-h] {disable,enable,generate-bundle}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli callhome disable</code></dt>
    <dd>Turns off the periodic call home feature.</dd></dlentry>

  <dlentry>
    <dt><code>tscli callhome enable --customer_name <em>CUSTOMER_NAME</em></code></dt>
    <dd>
      <p>Enables the "call home" feature, which sends usage statistics to ThoughtSpot.</p>
      <p>This feature is enabled by default.</p>
      <p>The parameter <code>customer_name</code> takes the form <code>Shared/CUSTOMER_NAME/stats</code>.</p>
      </dd></dlentry>

  <dlentry>
    <dt><code>tscli callhome generate-bundle [--d D] [--since SINCE]</code></dt>
    <dd>Generates the callhome stats tar file, with the following parameters:
      <dl>
        <dlentry>
          <dt><code>--d <em>D</em></code></dt>
          <dd><p>Destination folder for the tar file.</p>
            <p>There is no default setting.</p></dd></dlentry>
        <dlentry>
          <dt><code>--since <em>SINCE</em></code></dt>
          <dd>
            <p>Grabs <code>callhome</code> data from the specified time window in the past.</p>
            <p>This should be a human-readable duration string, such as <code>4h</code> (4 hours), <code>30m</code> (30 minutes), <code>1d</code> (1 day).</p>
            <p>This option generates a <code>tar</code> file of the cluster metrics and
      writes it to the specified directory, where  <code><em>SINCE</em></code> is how many days back the file must start.</p>
            <p>There is no default setting.</p></dd>
            </dlentry>
            </dl>
            </dd>
  </dlentry>
</dl>

{: id="tscli-cassandra"}
### cassandra

```
tscli cassandra [-h] {backup,restore}
```

Backs up cassandra.

This subcommand has the following options:

<dl>
<dlentry>
  <dt><code>tscli cassandra backup</code></dt>
  <dd>Takes a backup of cassandra, with the following parameters:
  <dl>
  <dlentry>
  <dt><code>--keyspaces <em>KEYSPACES</em></code></dt>
  <dd>Comma separated list of keyspaces to take a backup of.</dd></dlentry>
  <dlentry>
  <dt><code>backup_dir <em>BACKUP_DIR</em></code></dt>
  <dd>The path to the backup directory to write the backup to.</dd>
  </dlentry></dl></dd></dlentry>
<dlentry>
    <dt><code>tscli cassandra restore</code></dt>
    <dd>Restores cassandra from a backup, with the following parameter:
    <dl>
    <dlentry>
    <dt><code>--backup_dir <em>BACKUP_DIR</em></code></dt>
    <dd>The path to the backup directory to restore the backup to.</dd>
    </dlentry></dl></dd></dlentry>
</dl>

{: id="tscli-cluster"}
### cluster

```
tscli cluster [-h] abort-reinstall-os,abort-update,bucket-name,check,create,download-release,get-config,list-available-releases,list-downloaded-releases,load,reinstall-os,restore,resume-reinstall-os,resume-update,set-config,set-min-resource-spec,setup-release-host,setup-release-host-key,show-resource-spec,start,status,stop,update,update-hadoop}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli cluster abort-reinstall-os</code></dt>
    <dd>Aborts in-progress reinstall.</dd></dlentry>

    <dlentry>
      <dt><code>tscli cluster abort-update</code></dt>
      <dd>Aborts an ongoing cluster update, if safe.</dd></dlentry>

    <dlentry>
      <dt><code>tscli cluster bucket-name</code></dt>
      <dd>Returns the name of the s3 bucket associated with the cluster, if there is one.</dd></dlentry>  

  <dlentry>
    <dt><code>tscli cluster check [--path PATH] [--includes INCLUDES] [--retry RETRY] [--localhost] [--disable-events]</code></dt>
    <dd>Checks the status of all nodes in the cluster, with the following parameters:
      <dl>
      <dlentry>
      <dt><code>--path <em>PATH</em></code></dt>
      <dd><p>Specifies the working directory of the diagnostic tool.</p>
      <p>The default is <code>/usr/local/scaligent/release</code>.</p></dd></dlentry>
      <dlentry>
      <dt><code>--includes <em>INCLUDES</em></code></dt>
      <dd><p>Specifies the comma-separated component(s) to be included in the check.</p>
      <p>The default is <code>all</code>.</p></dd></dlentry>
      <dlentry>
      <dt><code>--retry <em>RETRY</em></code></dt>
      <dd><p>The maximum number of retry times if the node is unreachable.</p>
      <p>The default is <code>10</code>.</p></dd></dlentry>
      <dlentry>
      <dt><code>--localhost</code></dt>
      <dd><p>Runs cluster checks only on localhost.</p>
      <p>The default is <code>False</code>.</p></dd></dlentry>
      <dlentry>
      <dt><code>--disable-events</code></dt>
      <dd><p>Disables raising configuration events.</p>
      <p>The default is <code>False</code>.</p></dd></dlentry></dl>
      </dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster create <em>release</em></code></dt>
    <dd>
      <p>Creates a new cluster from the release file specified by adding the  release number.</p>
      <p>Used by ThoughtSpot Support when installing a new cluster. For example, <code>tscli cluster create 5.3.2.tar.gz</code>.</p>
      <p>This command has the following parameters:</p>
      <dl>
      <dlentry>
      <dt><code>--disable_rotate_keys</code></dt>
      <dd><p>Disables cluster rotate key configuration.</p>
      <p>The default is <code>False</code>.</p></dd></dlentry>
      <dlentry>
      <dt><code>--enable_cloud_storage {s3a,gcs}</code></dt>
      <dd>Determines whether to enable Cloud Storage setup, and which storage format to use.
      </dd></dlentry>
      <dlentry>
      <dt><code>heterogeneous</code></dt>
      <dd><p>Should be set for heterogeneous clusters.</p>
      <p>The default is <code>False</code>.</p></dd></dlentry></dl></dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster download-release <em>release</em></code></dt>
    <dd>Downloads the specified release to the Hadoop Distributed File Sytem (HDFS) for later upgrading.</dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster get-config</code></dt>
    <dd>
      <p>Gets current cluster network and time configuration. Prints JSON configuration to <code>stdout</code>.</p>
      <p>If the system cannot be connected to all interfaces, the command returns an error but continues to function.</p>
      <p>This command has the following parameters:</p>
      <dl>
      <dlentry>
      <dt><code>--local</code></dt>
      <dd><p>Gets the config for the local host only.</p>
      <p>The default is <code>False</code>.</p></dd></dlentry>
      <dlentry>
      <dt><code>--nodes <em>NODES</em></code></dt>
      <dd>A comma separated list of specified nodes to get the config for.</dd></dlentry>
      </dl></dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster list-available-releases</code></dt>
    <dd>Lists the available releases to update to on the cluster.</dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster list-downloaded-releases</code></dt>
    <dd>Lists the releases downloaded to the cluster.</dd></dlentry>    

  <dlentry>
    <dt><code>tscli cluster load <em>backupdir</em></code></dt>
    <dd>Loads the state from a specified backup directory onto an existing cluster. Add <code>--reuse_cluster</code> to reuse the cluster service configs rather than restoring from the backup directory.</dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster reinstall-os</code></dt>
    <dd>Reinstalls OS on all nodes of the cluster, with the following parameters:
    <dl>
    <dlentry>
    <dt><code>--secondary <em>SECONDARY</em></code></dt>
    <dd><p>A secondary drive for reinstall.</p>
    <p>The default is <code>sdd</code>.</p></dd></dlentry>
    <dlentry>
    <dt><code>--stdin</code></dt>
    <dd>Command to take JSON configuration from stdin.</dd></dlentry></dl>
    </dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster restore --release <em>RELEASE</em> <em>backupdir</em></code></dt>
    <dd><p>Restores a cluster on the specified release number using the backup in the specified directory <em>backupdir</em>. If you're restoring from a dataless backup, you must supply the release tarball for the corresponding software release.</p>
    <p>This command has the following parameters:</p>
    <dl>
    <dlentry>
    <dt><code>--disable_rotate_keys</code></dt>
    <dd><p>Disables cluster rotate key configurations.</p>
    <p>The default is <code>False</code>.</p></dd></dlentry>
    <dlentry>
    <dt><code>--enable_cloud_storage {s3a,gcs}</code></dt>
    <dd>Determines whether to enable Cloud Storage setup. For example, run <code>tscli backup restore --enable_cloud_storage=s3a</code> to enable AWS S3 object storage.</dd></dlentry>
    <dlentry>
    <dt><code>--heterogeneous</code></dt>
    <dd><p>Should be set for heterogeneous clusters.</p>
    <p>The default is <code>False</code>.</p></dd></dlentry></dl>
    </dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster resume-reinstall-os</code></dt>
    <dd>Resumes in-progress reinstall.</dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster resume-update</code></dt>
    <dd>Resumes in-progress updates, with the following parameter:
    <dl>
    <dlentry>
    <dt><code>--ignore_if_unhealthy</code></dt>
    <dd>Comma separated list of node IPs on which upgrade is not attempted if they are found to be unhealthy. If a node outside of this list is found unhealthy, the upgrade is aborted.</dd></dlentry></dl>
    </dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster set-config</code></dt>
    <dd><p>Sets cluster network and time configuration. Takes JSON configuration from stdin.</p>
    <p>This subcommand has the following parameters:</p>
    <dl>
    <dlentry>
    <dt><code>--ipv4-only</code></dt>
    <dd><p>Only use ipv4 for node communication. Requires passing ipMap in config unless no-network-change is also specified.</p>
    <p>The default is <code>False</code>.</p></dd>
    </dlentry>
    <dlentry>
    <dt><code>--no-network-change</code></dt>
    <dd><p>This flag ensures that a change made with set-config does not update network settings.</p>
    <p>The default is <code>False</code>.</p>
    </dd></dlentry></dl>
    </dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster set-min-resource-spec</code></dt>
    <dd>Sets the minimum resource configuration of the cluster, with the following parameter:
<dl>
  <dlentry>
  <dt><code>--file <em>FILE</em></code></dt>
  <dd><p>Specified script with overrides.</p>
  <p>The default is <code>False</code>.</p></dd>
  </dlentry></dl></dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster setup-release-host HOST</code></dt>
    <dd>Sets up the release host for Self Service Upgrade, with the specified <code>HOST</code>.</dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster setup-release-host-key</code></dt>
    <dd>Sets up the release host api key for Self Service Upgrade.</dd></dlentry>  

  <dlentry>
    <dt><code>tscli cluster show-resource-spec</code></dt>
    <dd>Prints default or min.</dd></dlentry>
  <dlentry>
    <dt><code>tscli cluster start</code></dt>
    <dd>Starts the cluster.</dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster status</code></dt>
    <dd>Gives the status of the cluster, including release number, date last updated, number of nodes, pending tables time, and services status. This subcommand has the following parameters:
  <dl>
  <dlentry>
  <dt><code>--mode {basic,service,table,full,reinstall-os}</code></dt>
  <dd>Specifies the kind of status message you want.</dd></dlentry>
  <dlentry>
  <dt><code>--tail</code></dt>
  <dd><p>Prints the details of creation and update progress.</p>
  <p>The default is <code>False</code>.</p></dd></dlentry>
  <dlentry>
  <dt><code>--no-orion</code></dt>
  <dd><p>Runs checks not related to orion.</p>
  <p>The default is <code>False</code>.</p></dd></dlentry>
  <dlentry>
  <dt><code>--includes <em>INCLUDES</em></code></dt>
  <dd>The name of the service to check the status of, either falcon or sage.</dd></dlentry></dl></dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster stop</code></dt>
    <dd>Pauses the cluster (but does not stop storage services).</dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster update</code></dt>
    <dd>Updates an existing cluster on a specified release, with the following parameters:
  <dl>
  <dlentry>
  <dt><code>--release_version</code></dt>
  <dd><p>Looks for 'release' in the downloaded tarballs and if found, will update to that tarball.</p>
  <p>The default is <code>False</code>.</p></dd></dlentry>
  <dlentry>
  <dt><code>--dry_run_only</code></dt>
  <dd><p>Runs only the pre-update checks.</p>
  <p>The default is <code>False</code>.</p></dd></dlentry>
  <dlentry>
  <dt><code>--wait_for_falcon_sage</code></dt>
  <dd><p>Waits for Falcon and Sage to be in a serving state before marking an update as complete.</p>
  <p>The default is <code>False</code>.</p></dd></dlentry>
  <dlentry>
  <dt><code>--create_snapshot_before_update</code></dt>
  <dd><p>Creates a snapshot automatically before starting update.</p>
  <p>The default is <code>False</code>.</p></dd></dlentry>
  <dlentry>
  <dt><code>--generate_compare_scoreboard</code></dt>
  <dd><p>Generates pre-update and post-update scoreboards and compares them.</p>
  <p>The default is <code>False</code>.</p></dd></dlentry>
  <dlentry>
  <dt><code>--update_orion_only</code></dt>
  <dd>Only updates orion.</dd></dlentry>
  <dlentry>
  <dt><code>--ignore_if_unhealthy</code></dt>
  <dd>A comma separated list of node IPs on which upgrade is not attempted in case they are found to be unhealthy. If a node outside of this list is found unhealthy, the upgrade is aborted.</dd></dlentry></dl>
    </dd></dlentry>

  <dlentry>
    <dt><code>tscli cluster update-hadoop</code></dt>
    <dd>Updates Hadoop/Zookeeper on the cluster.</dd></dlentry>

</dl>


{: id="tscli-command"}
### command

```
tscli command [-h] {run}
```

Runs a specified command (`COMMAND`) on all nodes.

This subcommand has the following option:
<dl>
  <dlentry>
    <dt><code>tscli command run <em>COMMAND</em></code></dt>
  <dd>
    <p>This subcommand has the following parameters:</p>
    <dl>
    <dlentry>
      <dt><code>--nodes <em>NODES</em></code></dt>
      <dd>
        <p>Space-separated IPs of nodes on which to run the command.</p>
        <p>The default setting is <code>all</code>.</p></dd></dlentry>
    <dlentry>
      <dt><code>--dest_dir <em>DEST_DIR</em></code></dt>
      <dd>
        <p>Directory to save the files that contain the output from each node.</p>
        <p>This is a mandatory parameter.</p></dd></dlentry>
    <dlentry>
      <dt><code>--copyfirst <em>COPYFIRST</em></code></dt>
      <dd>
        <p>Command to copy the executable to required nodes first.</p>
        <p>The default setting is <code>False</code>.</p></dd></dlentry>
    <dlentry>
      <dt><code>--timeout <em>TIMEOUT</em></code></dt>
      <dd>
        <p>Timeout waiting for the command to finish.</p>
        <p>The default setting is <code>60</code>.</p></dd></dlentry>
    </dl>
  </dd>
 </dlentry>
</dl>

{: id="tscli-dr-mirror"}
###  dr-mirror

```
tscli dr-mirror [-h] {start,status,stop}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli dr-mirror start</code></dt>
    <dd>Starts a mirror cluster which will continuously recover from a primary cluster, with the following parameters:
    <dl><dlentry>
    <dt><code>directory</code></dt>
    <dd>Directory where backups of primary cluster can be found.</dd></dlentry>
    <dlentry>
    <dt><code>nodes</code></dt>
    <dd>Comma-separated list of IP addresses of nodes in the mirror cluster.</dd></dlentry>
    <dlentry>
    <dt><code>cluster_name</code></dt>
    <dd>The name of the mirror cluster.</dd></dlentry>
    <dlentry>
    <dt><code>cluster_id</code></dt>
    <dd>The ID of the mirror cluster.</dd></dlentry>
    <dlentry>
    <dt><code>--email <em>EMAIL</em></code></dt>
    <dd><p>Option alert email setting.</p>
    <p>The default is <code>later</code>.</p></dd></dlentry></dl>
    </dd></dlentry>
  <dlentry>
    <dt><code>tscli dr-mirror status</code></dt>
    <dd>Checks whether the current cluster is running in mirror mode.</dd></dlentry>
  <dlentry>
    <dt><code>tscli dr-mirror stop</code></dt>
    <dd>Stops mirroring on the local cluster.</dd></dlentry>
</dl>

{: id="etl"}
### etl

```
tscli etl [-h] {change-password,disable-lw,download-agent,enable-lw,show-lw}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli etl change-password</code></dt>
    <dd>Changes the Informatica Cloud account password used by ThoughtSpot Data Connect, with the following parameters:

      <dl>
        <dlentry>
          <dt><code>--admin_username <em>ADMIN_USERNAME</em></code></dt>
          <dd>Specifies the Administrator username for ThoughtSpot.</dd></dlentry>
        <dlentry>
          <dt><code>--username <em>USERNAME</em></code></dt>
          <dd>Specifies the username for Informatica Cloud.</dd></dlentry>
        <dlentry>
          <dt><code>--max_wait <em>MAX_WAIT</em></code></dt>
          <dd>The maximum time in seconds to wait for the Data Connect agent to start.</dd></dlentry>
        <dlentry>
          <dt><code>--isIICS</code></dt>
          <dd>This flag identifies whether Informatica is in IICS or ICS mode. By default, Informatica is in ICS mode.</dd>
          </dlentry>
      </dl></dd></dlentry>

  <dlentry>
    <dt><code>tscli etl disable-lw</code></dt>
    <dd>Disables ThoughtSpot Data Connect.</dd></dlentry>

  <dlentry>
    <dt><code>tscli etl download-agent</code></dt>
    <dd>Downloads the ThoughtSpot Data Connect agent to the cluster, with the following parameters:
    <dl>
      <dlentry>
      <dt><code>--push_to_all</code></dt>
      <dd><p>Pushes the downloaded installer to all nodes.</p>
      <p>The default is <code>False</code>.</p></dd>
      </dlentry>
      <dlentry>
      <dt><code>--proxy_host <em>PROXY_HOST</em></code></dt>
      <dd>Specify your proxy server host for network access.</dd>
      </dlentry>
      <dlentry>
      <dt><code>--proxy_port <em>PROXY_PORT</em></code></dt>
      <dd>Specify your proxy server port.</dd>
      </dlentry>
      <dlentry>
      <dt><code>--proxy_username <em>PROXY_USERNAME</em></code></dt>
      <dd>Specify your proxy server username.</dd>
      </dlentry>
      <dlentry>
      <dt><code>--isIICS</code></dt>
      <dd><p>This flag identifies whether Informatica is in IICS or ICS mode. By default, Informatica is in ICS mode.</p>
      <p>The default is <code>False</code>.</p></dd>
      </dlentry>
    </dl></dd></dlentry>

  <dlentry>
    <dt><code>tscli etl enable-lw</code></dt>

    <dd><p>Enables Data Connect.Contact ThoughtSpot Support for assistance in setting this up.</p>
    <p>This subcommand has the following parameters:</p>

      <dl>
        <dlentry>
          <dt><code>--username <em>USERNAME</em></code></dt>
          <dd>Username for Informatica Cloud</dd></dlentry>
        <dlentry>
          <dt><code>--thoughtspot_url THOUGHTSPOT_URL</code></dt>
          <dd>URL to reach ThoughtSpot.</dd></dlentry>
        <dlentry>
          <dt><code>--admin_username <em>ADMIN_USERNAME</em></code></dt>
          <dd>Admin username for ThoughtSpot</dd></dlentry>
        <dlentry>
          <dt><code>--groupname <em>GROUPNAME</em></code></dt>
          <dd>Name of the secure agent group to use.</dd></dlentry>
        <dlentry>
          <dt><code>--org_id <em>ORG_ID</em></code></dt>
          <dd>Specifies the Informatica <code>id</code> of the company.<!--For ThoughtSpot, this is `001ZFA`. `org_id` shouldn't include the prefix `Org`. For example, if on Informatica cloud, the `orgid` is `Org003XYZ`, then use only--></dd></dlentry>
        <dlentry>
          <dt><code>--pin_to <em>PIN_TO</em></code></dt>
          <dd>Specifies the IP address to pin to. If you specify an IP to pin to, that node becomes sticky
      to the Informatica agent, and will always be used. Defaults to the public IP
      address of the localhost where this command was run.</dd></dlentry>
        <dlentry>
          <dt><code>--proxy_host <em>PROXY_HOST</em></code></dt>
          <dd>Proxy server host for network access.</dd></dlentry>
        <dlentry>
          <dt><code>--proxy_port <em>PROXY_PORT</em></code></dt>
          <dd>Proxy server port.</dd></dlentry>
        <dlentry>
          <dt><code>--proxy_username <em>PROXY_USERNAME</em></code></dt>
          <dd>Proxy server username.</dd></dlentry>
        <dlentry>
          <dt><code>--max_wait <em>MAX_WAIT</em></code></dt>
          <dd>Maximum time in seconds to wait for Data Connect agent to start.</dd></dlentry>
        <dlentry>
          <dt><code>--isIICS</code></dt>
          <dd><p>This flag identifies whether Informatica is in IICS or ICS mode. By default, Informatica is in ICS mode.</p>
          <p>The default is <code>False</code>.</p></dd>
          </dlentry>
      </dl></dd></dlentry>

  <dlentry>
     <dt><code>tscli etl show-lw</code></dt>
     <dd>
       <p>Shows the status of ThoughtSpot Data Connect.</p>
       <p>It also returns the Informatica username and OrgId.</p></dd></dlentry>

</dl>
{: id="tscli-event"}

### event
```
tscli event [-h] {list}
```
This subcommand and its options manage event notifications.

This subcommand has the following option:

<dl>
  <dlentry>
    <dt><code>tscli event list [-h] [--include <em>INCLUDE</em>] [--since <em>SINCE</em>] [--from <em>FROM</em>] [--to <em>TO</em>] [--limit <em>LIMIT</em>] [--detail] [--summary_contains <em>SUMMARY_CONTAINS</em>] [--detail_contains <em>DETAIL_CONTAINS</em>] [--attributes <em>ATTRIBUTES</em>]</code></dt>

    <dd>
      <p>The <code>event list </code> subcommand accepts these optional flags:</p>

      <dl>

        <dlentry>
          <dt><code>--include <em>INCLUDE</em></code></dt>
          <dd><p>Options are all, config, and notification.</p>
          <p>The default is <code>config</code>.</p></dd></dlentry>
        <dlentry>
          <dt><code>--since <em>SINCE</em></code></dt>
          <dd>Grabs events from the specified time window. Should be a human readable duration string, such as <code>4h</code> (4 hours), <code>30m</code> (30 minutes), or <code>1d</code> (1 day).</dd></dlentry>
        <dlentry>
          <dt><code>--from <em>FROM</em></code></dt>
          <dd>Specifies the starting point for the time window to grab events from. Must be of the form <code>yyyymmdd-HH:MM</code>.</dd></dlentry>
        <dlentry>
          <dt><code>--to <em>TO</em></code></dt>
          <dd>Specifies the ending point for the time window to grab events from. Must be of the form: <code>yyyymmdd-HH:MM</code>.</dd></dlentry>
        <dlentry>
          <dt><code>--limit <em>LIMIT</em></code></dt>
          <dd>
            <p>Maximum number of events to fetch.</p>
            <p>The default setting is <code>0</code>.</p></dd></dlentry>
        <dlentry>
          <dt><code>--detail</code></dt>
          <dd>
            <p>Prints events in detail format. This is not tabular. Default is a tabular summary.</p>
            <p>The default setting is <code>False</code>.</p></dd></dlentry>
        <dlentry>
          <dt><code>--summary_contains <em>SUMMARY_CONTAINS</em></code></dt>
          <dd>Summary of the event will be checked for this string. Multiple strings to check for can be specified by separating them with <code>|</code> (pipe). The event is returned if it <code>matches ALL</code>. Put single quotes around the param value to prevent undesired glob expansion.</dd></dlentry>
        <dlentry>
          <dt><code>--detail_contains <em>DETAIL_CONTAINS</em></code></dt>
          <dd>Details of the event will be checked for this string. Multiple strings to check for can be specified by separating them with <code>|</code> (pipe). The event is returned if it <code>matches ALL</code>. Put single quotes around the param value to prevent undesired glob expansion.</dd></dlentry>
        <dlentry>
          <dt><code>--attributes <em>ATTRIBUTES</em></code></dt>
          <dd>Specify attributes to match as key=value. Multiple strings to check for can be specified by separating them with <code>|</code> (pipe). The event is returned if it <code>matches ALL</code>. Put single quotes around the param value to prevent undesired glob expansion.</dd></dlentry>
        </dl>
      </dd></dlentry>
  </dl>    

{: id="tscli-feature"}
### feature

```
tscli feature [-h] {get-all-config}
```
This subcommand has the following option:

<dl>
  <dlentry>
    <dt><code>tscli feature get-all-config</code></dt>
    <dd>Gets the configured features in a cluster. The command returns a list of features, such as custom branding, Data Connect, and callhome, and informs whether they are enabled or disabled. This subcommand has the following parameter:
    <dl><dlentry>
    <dt><code>--proto</code></dt>
    <dd><p>Shows the output as a serialized proto.</p>
    <p>The default is <code>False</code>.</p></dd></dlentry></dl></dd></dlentry>
</dl>

{: id="tscli-fileserver"}
### fileserver

```
tscli fileserver [-h] {configure,download-release,purge-config,show-config,upload}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli fileserver configure [-h] --user <em>USER</em> [--password <em>PASSWORD</em>]</code></dt>
    <dd>
      <p>Configures the secure file server username and password for file upload/download, and the call home feature.</p>
      <p>You only have to issue this command one time, to set up the connection to the secure file server. Reissue this command if the password changes.</p>
      <p>The parameter <code>PASSWORD</code> is optional. If a password is not specified, you will be prompted to enter it.</p></dd></dlentry>
  <dlentry>
    <dt><code>tscli fileserver download-release [-h] [--user <em>USER</em>] [--password <em>PASSWORD</em>] [--url <em>URL</em>] [--md5 <em>MD5</em>] [--out <em>OUT</em>] <em>release</em></code></dt>
    <dd>
      <p>Downloads the specified release file, including its checksum, and verifies the integrity of release bundle.</p>
      <p>You must specify the exact release number, such as <code>5.1.3</code>. </p>
      <p>Before using this command for the first time, you must set up the file server connection using <code>tscli fileserver configure</code>. You can then work with a member of the ThoughtSpot Support team because a privileged <code>user</code> and a corresponding <code>password</code> must be specified to download releases. This command has the following parameters:</p>
      <dl><dlentry>
      <dt><code>--user <em>USER</em></code></dt>
      <dd>The fileserver username.</dd></dlentry>
      <dlentry>
      <dt><code>--password <em>PASSWORD</em></code></dt>
      <dd>The fileserver password.</dd></dlentry>
      <dlentry>
      <dt><code>--url <em>URL</em></code></dt>
      <dd>Url from where the release needs to be downloaded.</dd></dlentry>
      <dlentry>
      <dt><code>--md5 <em>MD5</em></code></dt>
      <dd>Md5 of the release tarball, if known.</dd></dlentry>
      <dlentry>
      <dt><code>--out <em>OUT</em></code></dt>
      <dd>File name of the tar ball.</dd></dlentry></dl>
      </dd></dlentry>
  <dlentry>
    <dt><code>tscli fileserver purge-config</code></dt>
    <dd>Removes the file server configuration.</dd></dlentry>
  <dlentry>
    <dt><code>tscli fileserver show-config</code></dt>
    <dd>Shows the file server configuration.</dd></dlentry>

  <dlentry>
    <dt><code>tscli fileserver upload [-h] [--user <em>USER</em>] [--password <em>PASSWORD</em>] --file_name <em>FILE_NAME</em> --server_dir_path <em>SERVER_DIR_PATH</em></code></dt>

    <dd>
      <p>Uploads the specified file to the directory specified on the secure file server.</p>
      <p>You may optionally specify the <code>user</code> and <code>password</code> to bypass the
  credentials specified when configuring the file server connection with
  <code>tscli fileserver configure</code>. Before using this command for the first time, you
  must set up the file server connection using <code>tscli fileserver configure</code>.</p>

      <p>This command uses the following flags:</p>

      <dl>

       <dlentry>
         <dt><code>--user <em>USER</em></code></dt>
         <dd>Username of the fileserver.</dd></dlentry>
       <dlentry>
         <dt><code>--password <em>PASSWORD</em></code></dt>
         <dd>Password of the fileserver. This is required and the command prompts you for it if you do not supply it.</dd></dlentry>
       <dlentry>
         <dt><code>--file_name <em>FILE_NAME</em></code></dt>
         <dd>Local file to upload.</dd></dlentry>
       <dlentry>
         <dt><code>--server_dir_path <em>SERVER_DIR_PATH</em></code></dt>
         <dd>Directory path on fileserver. The <code>SERVER_DIR_PATH</code> parameter specifies the directory for file upload. It is based on customer name, and takes the form <code>/Shared/support/<em>customer_name</em></code>.</dd></dlentry>
   </dl>
   </dd></dlentry>
</dl>

{: id="tscli-firewall"}
### firewall

```
tscli firewall [-h] {close-ports,disable,enable,open-ports,status}
```
This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli firewall close-ports --ports <em>PORTS</em></code></dt>
    <dd>
      <p>Closes specified ports through firewall on all nodes.</p>
      <p>Accepts a comma-separated list of ports. Only closes ports that were previously opened using <code>open-ports</code>, and ignores ports that were not opened with <code>open-port</code>, or closed ports.</p>
      <p>Some essential ports are always kept open, such as <code>ssh</code>; they are not affected by this command
  or by <code>open-ports</code>.</p></dd></dlentry>
  <dlentry>
    <dt><code>tscli firewall disable</code></dt>
    <dd>Disables firewall.</dd></dlentry>
   <dlentry>
     <dt><code>tscli firewall enable</code></dt>
     <dd>Enables firewall.</dd></dlentry>
   <dlentry>
     <dt><code>tscli firewall open-ports --ports <em>PORTS</em></code></dt>
     <dd>
       <p>Opens specified ports through a firewall on all nodes.</p>
       <p>Accepts a comma-separated list of ports.</p>
       <p>Ignores open ports.</p>
       <p>Some essential ports are always kept open, such as <code>ssh</code>; they are not affected by this command
   or by <code>close-ports</code>.</p></dd></dlentry>

   <dlentry>
     <dt><code>tscli firewall status</code></dt>
     <dd>Shows whether firewall is currently enabled or disabled.</dd></dlentry>
</dl>

{: id="tscli-hdfs"}
### hdfs

```
tscli hdfs [-h] {leave-safemode}
```

This subcommand has the following option:

<dl>
  <dlentry>
    <dt><code>tscli hdfs leave-safemode</code></dt>
    <dd>Command to get HDFS <code>namenodes</code> out of <code>safemode</code>, with the following parameter:
    <dl><dlentry>
    <dt><code>--timeout <em>TIMEOUT</em></code></dt>
    <dd><p>Specifies timeout when waiting for the command to finish.</p>
    <p>The default is <code>5</code>.</p></dd></dlentry></dl></dd>
  </dlentry></dl>

{: id="tscli-ipsec"}
### ipsec

```
tscli ipsec [-h] {disable,enable,status}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli ipsec disable</code></dt>
    <dd>Disables IPSec.</dd></dlentry>
  <dlentry>
    <dt><code>tscli ipsec enable</code></dt>
    <dd>Enables IPSec.</dd></dlentry>
  <dlentry>
    <dt><code>tscli ipsec status</code></dt>
    <dd>Shows IPSec status on all nodes.</dd></dlentry>
</dl>

{: id="tscli-ldap"}
### ldap

```
tscli ldap [-h] {add-cert,configure,purge-configuration}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli ldap add-cert <em>name</em> <em>cert_file</em></code></dt>
    <dd>Adds an SSL certificate for LDAP. Use only if LDAP has been configured without
  SSL and you wish to add it. Use <code>name</code> to supply an alias for the
  certificate you are installing. Use <code>cert-file</code> to specify the file where the certificate is.</dd></dlentry>

  <dlentry>
    <dt><code>tscli ldap configure</code></dt>
    <dd>Configures LDAP using an interactive script.</dd></dlentry>

  <dlentry>
    <dt><code>tscli ldap purge-configuration</code></dt>
    <dd>Purges (removes) any existing LDAP configuration.</dd></dlentry>
</dl>

{: id="tscli-logs"}
### logs

```
tscli logs [-h] {collect,runcmd}
```

Manages the logging behavior.

This subcommand has the following options:

<dl>

  <dlentry>
    <dt><code>tscli logs collect [-h] [--include <em>INCLUDE</em>] [--exclude <em>EXCLUDE</em>] [--since <em>SINCE</em>] [--from <em>FROM</em>] [--to <em>TO</em>] [--out <em>OUT</em>] [--maxsize <em>MAXSIZE</em>] [--sizeonly] [--nodes <em>NODES</em>]</code></dt>
    <dd>
      <p>Extracts logs from the cluster. Does not include any logs that have been deleted due to log rotation.</p>
      <p>This subcommand has the following parameters:</p>
      <dl>
        <dlentry>
          <dt><code>--include <em>INCLUDE</em></code></dt>
          <dd><p>Specifies a comma separated list of logs to include. Each entry is either a
    "selector" or a glob for matching files. Selectors must be among: <code>all</code>,
    <code>orion</code>, <code>system</code>, <code>ts</code>. Anything starting with <code>/</code> is assumed to be a glob
    pattern, and it is interpreted through <code>find(1)</code>. Other entries are ignored. Put single
    quotes around the param value to prevent undesired glob expansion.</p>
    <p>The default is <code>all</code>.</p></dd></dlentry>

        <dlentry>
          <dt><code>--exclude <em>EXCLUDE</em></code></dt>
          <dd>Comma separated list of logs to exclude. Applies to the list selected by
  <code>--include</code>. Params are interpreted just like in <code>--include</code>.</dd></dlentry>

       <dlentry>
         <dt><code>--since <em>SINCE</em></code></dt>
         <dd>Grabs logs from the specified time window in the past. Should be a human-readable duration string, such as <code>4h</code> (4 hours), <code>30m</code> (30 minutes), <code>1d</code> (1 day).</dd></dlentry>

      <dlentry>
        <dt><code>--from <em>FROM</em></code></dt>
        <dd>Timestamp where collection begins; must be of the form <code>yyyymmdd-HH:MM</code>.</dd></dlentry>                
      <dlentry>
        <dt><code>--to <em>TO</em></code></dt>
        <dd>Timestamp where collection ends; must be of the form <code>yyyymmdd-HH:MM</code>.</dd></dlentry>
      <dlentry>
        <dt><code>--out <em>OUT</em></code></dt>
        <dd>
          <p>Tarball path for writing logs from each node.</p>
          <p>The default setting is <code>/tmp/logs.tar.gz</code>.</p></dd></dlentry>
      <dlentry>
        <dt><code>--maxsize <em>MAXSIZE</em></code></dt>
        <dd>Only fetch logs if size is smaller than this value. Can be specified in megabytes or gigabytes, such as <code>100MB</code>, <code>10GB</code>.</dd></dlentry>
      <dlentry>
              <dt><code>--sizeonly</code></dt>
              <dd>
                <p>Do not collect logs. Just report the size.</p>
                <p>The default setting is <code>False</code>.</p></dd></dlentry>
      <dlentry>
        <dt><code>--nodes <em>NODES</em></code></dt>
        <dd>Comma separated list of nodes from where to collect logs.  Skip this to use all nodes.</dd></dlentry>
      </dl>
    </dd></dlentry>

  <dlentry>
    <dt><code>tscli logs runcmd [-h] --cmd <em>CMD</em> [--include <em>INCLUDE</em>] [--exclude <em>EXCLUDE</em>]
   [--since <em>SINCE</em>] [--from <em>FROM</em>] [--to <em>TO</em>] [--outfile <em>OUTFILE</em>] [--outdir <em>OUTDIR</em>] [--cmd_infmt <em>CMD_INFMT</em>] [--cmd_outfmt <em>CMD_OUTFMT</em>] [--nodes <em>NODES</em>]</code></dt>

   <dd>
     <p>Runs a Unix command on logs in the cluster matching the given constraints.  Results are reported as text dumped to standard out, the specified output file, or as tarballs dumped into the specified directory.</p>
    <p>Accepts these optional flags:</p>
    <dl>
    <dlentry>
      <dt><code>--cmd <em>CMD</em></code></dt>
      <dd>
        <p>Unix-Command to be run on the selected logs. Use single quotes to escape
    spaces etc. Note the language used to specify CMDSTR has the following rules.</p>
        <ul>
          <li>A logfile and its corresponding result file can be referred to by the keywords <code>SRCFILE</code> and
    <code>DSTFILE</code>. For example, <code>cp SRCFILE DSTFILE</code>.</li>
          <li>Without any reference to <code>DSTFILE</code> in CMDSTR, <code>DSTFILE</code> will be appended to CMDSTR for output redirection. For example, <code>du -sch SRCFILE</code> gets auto-translated to <code>du -sch SRCFILE > DSTFILE</code>.</li>
          <li>Without any reference to <code>SRCFILE</code>, the contents of the log are streamed to CMDSTR by pipe. For example,
    <code>tail -n100 | grep ERROR</code> gets auto-translated to <code>cat SRCFILE | tail -n100 |
    grep ERROR > DSTFILE</code>.</li></ul></dd></dlentry>

    <dlentry>
      <dt><code>--include <em>INCLUDE</em></code></dt>
      <dd>
        <p>Comma-separated list of logs to include. Each entry is either a "selector" or
    a glob for matching files.</p>
        <p>Selectors must be one of <code>all</code>, <code>orion</code>, <code>system</code>, or
    <code>ts</code>.</p>
        <p>Anything that starts with <code>/</code> (forward slash) is assumed to be a glob pattern and
    interpreted through <code>find(1)</code>. Other entries are ignored.</p>
         <p><strong>TIP:</strong> use single quotes around the parameter value to prevent undesired glob expansion.</p>
         <p>The default setting is <code>all</code>.</p></dd></dlentry>

    <dlentry>
      <dt><code>--exclude <em>EXCLUDE</em></code></dt>
      <dd>Comma separated list of logs to exclude. Applies to the list selected by
    <code>--include</code>. Parameters are interpreted just like in <code>--include</code>.</dd></dlentry>

    <dlentry>
      <dt><code>--since <em>SINCE</em></code></dt>
      <dd>Grabs logs from the specified time window in the past. Should be a human-readable duration string, such as <code>4h</code> (4 hours), <code>30m</code> (30 minutes), or  <code>1d</code> (1 day).</dd></dlentry>

    <dlentry>
      <dt><code>--from <em>FROM</em></code></dt>
      <dd>Timestamp where collection begins; must be of the form <code>yyyymmdd-HH:MM</code>.</dd></dlentry>

    <dlentry>
      <dt><code>--to <em>TO</em></code></dt>
      <dd>Timestamp where collection ends; must be of the form <code>yyyymmdd-HH:MM</code>.</dd></dlentry>

    <dlentry>
      <dt><code>--outfile <em>OUTFILE</em></code></dt>
      <dd>File path for printing all results. By default printed to <code>stdout</code>.</dd></dlentry>

    <dlentry>
      <dt><code>--outdir <em>OUTDIR</em></code></dt>
      <dd>Directory path for writing results with original directory structure from each node. Used as an alternative to printing output to <code>outfile/stdout</code>.</dd></dlentry>

    <dlentry>
      <dt><code>--cmd_infmt <em>CMD_INFMT</em></code></dt>
      <dd>Specify if the input file should be compressed or uncompressed before running <code>CMD</code>. <code>C</code> for compressed, <code>U</code> for uncompressed. Don't use this flag if <code>CMD</code> works on both.</dd></dlentry>

    <dlentry>
      <dt><code>--cmd_outfmt <em>CMD_OUTFMT</em></code></dt>
      <dd>Specify if <code>OUTFILE</code> generated by <code>CMD</code> should be compressed or uncompressed. <code>C</code> for compressed, <code>U</code> for uncompressed. Don't use this flag if output file is of the same format as the input file.</dd></dlentry>

    <dlentry>
      <dt><code>--nodes <em>NODES</em></code></dt>
      <dd>Comma separated list of nodes to run command on. Skip this to use all nodes.</dd></dlentry>
   </dl>
  </dd></dlentry></dl>

{: id="tscli-tiles"}
### map-tiles

```
tscli map-tiles [-h] {disable,enable,status}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli map-tiles enable [-h] [--online] [--offline] [--tar TAR] [--md5 <em>MD5</em>]</code></dt>
    <dd>
      <p>Enables ThoughtSpot's map tiles.  Used when constructing geomap charts.</p>
      <p>If you don't have internett access, you must download the map tiles tar and md5 files, and append the following to the <code>tscli</code> command:</p>
      <dl>
        <dlentry>
          <dt><code>--online</code></dt>
          <dd>
            <p>Downloads <code>maptiles</code> tar from internet.</p>
            <p>The default setting is <code>True</code>.</p></dd></dlentry>
        <dlentry>
          <dt><code>--offline</code></dt>
          <dd>
            <p>Specifies that you are using <code>maptiles</code> tar from a local disk.</p>
            <p>The default setting is <code>False</code>.</p></dd></dlentry>
        <dlentry>
          <dt><code>--tar <em>TAR</em></code></dt>
          <dd>Specified tar file for map-tiles.</dd></dlentry>
        <dlentry>
          <dt><code>--md5 <em>MD5</em></code></dt>
          <dd>Specified md5 file for map-tiles.</dd></dlentry>
      </dl>

    </dd></dlentry>  

  <dlentry>
    <dt><code>tscli map-tiles disable</code></dt>
    <dd>Disables map-tiles functionality.</dd></dlentry>

  <dlentry>
    <dt><code>tscli map-tiles status</code></dt>
    <dd>Checks whether map-tiles are enabled, with the following parameter:
    <dl><dlentry>
    <dt><code>--md5 <em>MD5</em></code></dt>
    <dd>Specified md5 checksum for validation.</dd></dlentry></dl>
    </dd></dlentry>

</dl>

{: id="tscli-monitoring"}
### monitoring

```
tscli monitoring [-h] {set-config,show-config}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli monitoring set-config [-h] [--email EMAIL] [--clear_email] [--heartbeat_interval HEARTBEAT_INTERVAL] [--heartbeat_disable]</code></dt>
    <dd>
      <p>Sets the monitoring configuration.</p>
      <p>The <code>monitoring</code> subcommand accepts the following optional flags:</p>

      <dl>
        <dlentry>
          <dt><code>--email <em>EMAIL</em></code></dt>
          <dd>Comma separated list (no spaces) of email addresses where the cluster sends monitoring information.</dd></dlentry>
        <dlentry>
          <dt><code>--clear_email</code></dt>
          <dd><p>Disables monitoring emails by clearing email configuration.</p>
          <p>The default is <code>False</code>.</p></dd></dlentry>
       <dlentry>
         <dt><code>--heartbeat_interval <em>HEARTBEAT_INTERVAL</em></code></dt>
         <dd>Specify a heartbeat email generation interval in seconds. The interval should be greater than 0.</dd></dlentry>
       <dlentry>
         <dt><code>--heartbeat_disable</code></dt>
         <dd><p>Disables heartbeat email generation.</p>
         <p>The default is <code>False</code>.</p></dd></dlentry>

      </dl>
    </dd></dlentry>

    <dlentry>
      <dt><code>tscli monitoring show-config</code></dt>
      <dd>Shows the monitoring configuration.</dd></dlentry>

</dl>

{: id="tscli-nas"}
### nas

```
tscli nas [-h] {ls,mount-cifs,mount-nfs,unmount}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli nas ls [-h]</code></dt>
    <dd>Lists mounts managed by NAS mounter service.</dd></dlentry>

 <dlentry>
    <dt><code>tscli nas mount-cifs [-h] --server <em>SERVER</em> [--path_on_server <em>PATH_ON_SERVER</em>] --mount_point <em>MOUNT_POINT</em>--username <em>USERNAME</em> --password <em>PASSWORD</em> [--uid <em>UID</em>] [--gid <em>GID</em>] [--options <em>OPTIONS</em>]</code></dt>
    <dd>

    <p>Mounts a CIFS device on all nodes.</p>
    <p>Accepts the following optional flags:</p>

    <dl>
      <dlentry>
      <dt><code>--server <em>SERVER</em></code></dt>
      <dd>
        <p>IP address or DNS name of CIFS service.</p>
        <p>For example, <code>10.20.30.40</code>.</p></dd></dlentry>

     <dlentry>
       <dt><code>--path_on_server <em>PATH_ON_SERVER</em></code></dt>
       <dd>
         <p>Filesystem path on the CIFS source server to mount NAS.</p>
         <p>For example, <code>/a</code>.</p>
         <p>The default setting is <code>/</code> (forward slash).</p></dd></dlentry>

     <dlentry>
       <dt><code>--mount_point <em>MOUNT_POINT</em></code></dt>
       <dd>
         <p>Directory on all cluster nodes where the NFS filesystem should be mounted on the target.</p>
         <p>If this directory does not exist, the command creates it. If this directory already exists, the command uses it for mounting.</p>
         <p>For example, <code>/mnt/external</code>.</p></dd></dlentry>

      <dlentry>
        <dt><code>--username <em>USERNAME</em></code></dt>
        <dd>Username to connect to the CIFS filesystem.</dd></dlentry>

      <dlentry>
        <dt><code>--password <em>PASSWORD</em></code></dt>
        <dd>CIFS password for <code>--username</code>.</dd></dlentry>

      <dlentry>
        <dt><code>--uid <em>UID</em></code></dt>
        <dd>
          <p>The <em>UID</em> that owns all files or directories on the mounted filesystem when the server does not provide ownership information.</p>
          <p>See <code>man mount.cifs</code> for more details.</p>
          <p>The default setting is <code>1001</code>.</p></dd></dlentry>

      <dlentry>
        <dt><code>--gid <em>GID</em></code></dt>
        <dd>
          <p>The <code>GID</code> that owns all files or directories on the mounted filesystem when the server does not provide ownership information.</p>
          <p>See <code>man mount.cifs</code> for more details.</p>
          <p>The default is <code>1001</code>.</p></dd></dlentry>

      <dlentry>
        <dt><code>--options <em>OPTIONS</em></code></dt>
        <dd>
          <p>Other command-line options to forward to the <code>mount.cifs</code> command.</p>
          <p>The default setting is <code>noexec</code>.</p></dd></dlentry>
     </dl>

    </dd></dlentry>

  <dlentry>
    <dt><code>tscli nas mount-nfs [-h] [--server <em>SERVER</em>] [--path_on_server <em>PATH_ON_SERVER</em>] [--mount_point <em>MOUNT_POINT</em>] [--options <em>OPTIONS</em>] [--protocol {nfs,nfs4}]</code></dt>
    <dd>
      <p>Mounts the NFS filesystem on all nodes.</p>
      <p>Accepts the following optional flags:</p>

      <dl>
        <dlentry>
          <dt><code>--server <em>SERVER</em></code></dt>
          <dd>IP address or DNS name of NFS service. For example, <code>10.20.30.40</code>.</dd></dlentry>
        <dlentry>
          <dt><code>--path_on_server <em>PATH_ON_SERVER</em></code></dt>
          <dd>
            <p>Filesystem path on the NFS source server.</p>
            <p>For example, <code>/a/b/c/d</code>.</p>
            <p>The default setting is <code>/</code>.</p></dd></dlentry>

        <dlentry>
          <dt><code>--mount_point <em>MOUNT_POINT</em></code></dt>
          <dd>
            <p>Directory on all cluster nodes of the target system.</p>
            <p>If this directory does not exist, the command creates it. If this directory already exists, the command uses it for mounting.</p>
            <p>For example, <code>/mnt/external</code>.</p></dd></dlentry>

        <dlentry>
          <dt><code>--options <em>OPTIONS</em></code></dt>
          <dd>
            <p>Command-line options to mount.</p>
            <p>The default setting is <code>noexec</code>.</p></dd></dlentry>
        <dlentry>
          <dt><code>--protocol <em>PROTO</em></code></dt>
          <dd>
            <p>Protocol to use for mounting, either <code>nfs</code> or <code>nfs4</code>.</p>
            <p>The default is <code>nfs</code>.</p></dd></dlentry>
       </dl>
       </dd>
       </dlentry>

  <dlentry>
    <dt><code>tscli nas unmount [-h] --dir <em>DIR</em></code></dt>
    <dd>
      <p>Unmounts all devices from the specified directory, <code>DIR</code>.</p>
      <p>This command returns an error if nothing is currently mounted on this directory through <code>tscli nas mount</code>.</p></dd></dlentry>

</dl>

{: id="tscli-node"}
### node

```
tscli node [-h] {check,ls,reinstall-os,resume-reinstall-os,status}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli node check [-h] [--select {reinstall-preflight}] [--secondary <em>SECONDARY</em>]</code></dt>
    <dd>
      <p>Runs checks per node.</p>
      <p>Accepts the following flags:</p>

      <dl>
        <dlentry>
          <dt><code>--select {reinstall-preflight}</code></dt>
          <dd>
            <p>Specifies the type of node check.</p>
            <p>The default setting is <code>reinstall-preflight</code>.</p></dd></dlentry>
        <dlentry>
          <dt><code>--secondary <em>SECONDARY</em></code></dt>
          <dd>
            <p>Secondary drive for <code>reinstall-preflight</code>.</p>
            <p>The default setting is <code>sdd</code>.</p></dd></dlentry>
      </dl>
    </dd></dlentry>

   <dlentry>
      <dt><code>tscli node ls [-h] [--type {all,healthy,not-healthy}]</code></dt>
      <dd>Lists all nodes in the cluster, with the following parameter:
      <dl><dlentry>
      <dt><code>--type {all,healthy,not-healthy}</code></dt>
      <dd><p>Filters by node state.</p>
      <p>The default setting is <code>all</code>.</p></dd></dlentry></dl>
      </dd></dlentry>

   <dlentry>
      <dt><code>tscli node reinstall-os [-h] [--secondary <em>SECONDARY</em>] [--cluster]</code></dt>
      <dd>
        <p>Reinstalls OS on a node.</p>
        <p>Accepts the following flags:</p>

        <dl>
          <dlentry>
            <dt><code>--secondary <em>SECONDARY</em></code></dt>
            <dd>
              <p>Secondary drive for reinstall.</p>
              <p>The default setting is <code>sdd</code>.</p></dd></dlentry>
          <dlentry>
          <dt><code>--cluster</code></dt>
          <dd>
            <p>Use this flag to specify if the node is part of a cluster.</p>
            <p>The default setting is <code>False</code>.</p></dd></dlentry>
        </dl>
     </dd></dlentry>

   <dlentry>
    <dt><code>tscli node resume-reinstall-os</code></dt>
    <dd>Resumes in-progress reinstall</dd></dlentry>

</dl>

{: id="tscli-notification"}
### notification
```
tscli notification [-h] {set-apns-config}
```
This subcommand has the following option:

<dl>
<dlentry>
<dt><code>tscli notification set-apns-config</code></dt>
<dd>Sets APNS configuration.</dd>
</dlentry>
</dl>

{: id="tscli-onboarding"}
### onboarding

```
tscli onboarding [-h] {configure,purge-configuration}
```

Onboarding helps application administrators to bulk update user information.
In particular, it configures various in-app email options.

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli onboarding --help</code></dt>
    <dd>Prints help for the onboarding configuration</dd></dlentry>
  <dlentry>
    <dt><code>tscli onboarding configure</code></dt>
    <dd>
      <p>Configures the onboarding through a series of steps.</p>
      <p>Asks the user to provide information necessary for onboarding-related functionality, such as the following:</p>
      <ol>
        <li>Company name</li>
        <li>Product name</li>
        <li>
          <p>Should welcome emails be enabled?</p>
          <ul>
            <li>Send welcome emails to new users</li>
            <li>Support email</li>
            <li>Custom message to include in emails</li>
            <li>URL of the ThoughtSpot instance</li>
            <li>URL of the ThoughtSpot documentation</li>
          </ul></li></ol></dd></dlentry>
  <dlentry>
    <dt><code>tscli onboarding purge-configuration</code></dt>
    <dd>This command removes all previous onboarding configuration.</dd></dlentry>
</dl>

{: id="tscli-patch"}
### patch

```
tscli patch [-h] {abort-apply,apply,ls,resume-apply,resume-rollback,rollback,status}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli patch abort-apply</code></dt>
    <dd>Aborts an ongoing patch-apply, if safe.</dd></dlentry>

  <dlentry>
    <dt><code>tscli patch apply [-h] [<em>release</em>]</code></dt>
    <dd>
      <p>Applies the patch on an existing cluster, with the specified <code><em>release</em></code>.</p>
      <p>Accepts the following flag:</p>
      <dl>
        <dlentry>
          <dt><code>--skip-check</code></dt>
          <dd><p>When set, skips all pre-apply checks.</p>
          <p>The default is <code>False</code>.</p></dd></dlentry>
          </dl>
      </dd></dlentry>

    <dlentry>
      <dt><code>tscli patch ls [-h]  [--applied] [--rolled_back] [--service <em>SERVICE</em>] [--md5 <em>MD5</em>] [--history]</code></dt>
      <dd>
        <p>Lists the patches currently applied.</p>
        <p>Accepts the following flags:</p>

        <dl>
          <dlentry>
            <dt><code>--applied</code></dt>
            <dd>
              <p>Shows only the patches applied since the last full release.</p>
              <p>The default setting is <code>False</code>.</p></dd></dlentry>
          <dlentry>
            <dt><code>--rolled_back</code></dt>
            <dd>
              <p>Shows only the patches rolled back since the last full release.</p>
              <p>The default setting is <code>False</code>.</p></dd></dlentry>
          <dlentry>
            <dt><code>--service <em>SERVICE</em></code></dt>
            <dd>
              Shows patches filtered by service.</dd></dlentry>
          <dlentry>
            <dt><code>--md5 <em>MD5</em></code></dt>
            <dd>
              Shows the details of the patch specified.</dd></dlentry>
          <dlentry>
            <dt><code>--history</code></dt>
            <dd>
              <p>Shows the history of all patches applied/rollback releases.</p>
              <p>The default setting is <code>False</code>.</p></dd></dlentry>
        </dl>
        </dd></dlentry>

    <dlentry>
      <dt><code>tscli patch resume-apply [-h]</code></dt>
      <dd>Resumes patch apply.</dd></dlentry>

    <dlentry>
      <dt><code>tscli patch resume-rollback [-h]</code></dt>
      <dd>Resumes patch roll-back.</dd></dlentry>

    <dlentry>
      <dt><code>tscli patch rollback <em>md5</em> [-h]</code></dt>
      <dd>Rolls back a specified patch from an existing cluster with the following parameters:
      <dl>
      <dlentry>
      <dt><code>md5</code></dt>
      <dd>Specifies the md5 of the patch to be rolled back.</dd></dlentry>
      <dlentry>
      <dt><code>--skip_check</code></dt>
      <dd><p>When set, skips all pre-apply checks while rolling back.</p>
      <p>The default is <code>False</code>.</p></dd></dlentry></dl>
      </dd></dlentry>

    <dlentry>
      <dt><code>tscli patch status</code></dt>
      <dd>Shows the progress of patch operation.</dd></dlentry>

</dl>    

{: id="tscli-rpackage"}
### rpackage

```
tscli rpackage [-h] {add,delete,list}
```

Manages R packages available to SpotIQ.

This subcommand has the following options:

<dl>
<dlentry>
<dt><code>tscli rpackage add [-h] [--repo <em>REPO</em>] [--timeout <em>TIMEOUT</em>] [--dest_dir <em>DEST_DIR</em>] [--nodes <em>NODES</em>] <em>package_name</em></code></dt>
<dd>
<p>Command to add an R package, <code>package_name</code>, to the cluster.</p>
<p>Accepts the following flags:</p>
<dl>
<dlentry>
<dt><code>--repo <em>REPO</em></code></dt>
<dd><p>Specifies the url of a specific repository to download packages from.</p>
<p>The default is <code>http://cran.rstudio.com/</code>.</p></dd></dlentry>
<dlentry>
<dt><code>-timeout  <em>REPO</em></code></dt>
<dd><p>Timeout waiting for the R Package to be installed.</p>
<p>The default is <code>60</code>.</p></dd>
<dt><code>--dest_dir <em>REPO</em></code></dt>
<dd>Directory where output of this command will be placed.</dd></dlentry>
<dlentry>
<dt><code>--nodes <em>NODES</em></code></dt>
<dd>
<p>Space-separated list of IPs for nodes to run the command on.</p>
<p>The default setting is <code>all</code>.</p>
</dd></dlentry></dl></dd></dlentry>
<dlentry>
<dt><code>tscli rpackage delete [-h] [--timeout <em>TIMEOUT</em>] [--dest_dir <em>DEST_DIR</em>] [--nodes <em>NODES</em>] <em>package_name</em></code></dt>
<dd>
<p>Command to delete an installed R package from the cluster.</p>
<p>Accepts the following flags:</p>
<dl>
<dlentry>
<dt><code>--timeout <em>REPO</em></code></dt>
<dd>
<p>Timeout waiting for the R Package to be removed.</p>
<p>The default is 60.</p>
</dd></dlentry>
<dlentry>
<dt><code>--dest_dir <em>REPO</em></code></dt>
<dd>Directory where the output of this command should be saved.</dd></dlentry>
<dlentry>
<dt><code>--nodes <em>NODES</em></code></dt>
<dd>
<p>Space-separated list of node IPs on which to run the command.</p>
<p>The default setting is <code>all</code>.</p>
</dd></dlentry>
</dl>
</dd></dlentry>
<dlentry>
<dt><code>tscli rpackage list [-h] [--detailed]</code></dt>
<dd>List all R packages installed on the cluster, with the following parameter:
<dl><dlentry>
<dt><code>--detailed</code></dt>
<dd><p>Command to get install information as well as package names.</p>
<p>The default is <code>False</code>.</p></dd></dlentry></dl>
</dd></dlentry>
</dl>


{: id="tscli-saml"}
### saml

```
tscli saml [-h] {configure,purge-configuration}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli saml configure [-h]</code></dt>
    <dd>Configures SAML.</dd></dlentry>
  <dlentry>
    <dt><code>tscli saml purge-configuration</code></dt>
    <dd>Purges any existing SAML configuration.</dd></dlentry>
</dl>

To see a list of prerequisites, refer to [Configure SAML]({{ site.baseurl }}/admin/setup/configure-SAML-with-tscli.html).

{: id="tscli-scheduled-pinboards"}
### scheduled-pinboards

```
tscli scheduled-pinboards [-h] {disable,enable}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli scheduled-pinboards disable</code></dt>
    <dd>Disables scheduled pinboards for the cluster.</dd></dlentry>
  <dlentry>
    <dt><code>tscli scheduled-pinboards enable [-h]</code></dt>
    <dd>Enables scheduled pinboards, which are disabled in prod clusters by default.</dd></dlentry>
  </dl>

{% include note.html content="When you enable scheduled pinboards, you should
also configure a whitelist of intended email domains. Contact ThoughtSpot
Support for help on how to configure a whitelist." %}

{: id="tscli-set"}
### set

```
tscli set [-h] {heterogeneous}
```

This subcommand has the following option:

 <dl>
 <dlentry>
  <dt><code>tscli set heterogeneous</code></dt>
  <dd>Sets or unsets a cluster as heterogeneous, with the following parameters:
    <dl>
    <dlentry>
      <dt><code>--set</code></dt>
      <dd><p>Marks the cluster heterogeneous.</p>
      <p>The default is <code>True</code>.</p></dd></dlentry>
    <dlentry>
      <dt><code>--unset</code></dt>
      <dd><p>Marks the cluster homogeneous.</p>
      <p>The default is <code>False</code>.</p></dd></dlentry>
  </dl></dd></dlentry></dl>

{: id="tscli-smtp"}
###  smtp

```
tscli smtp [-h] {remove-mailfromname,remove-mailname,remove-relayhost,remove-saslcredentials,reset-canonical-mapping,set-canonical-mapping,set-mailfromname,set-mailname,set-relayhost,set-saslcredentials,show-canonical-mapping,show-mailfromname,show-mailname,show-relayhost}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli smtp remove-mailfromname</code></dt>
    <dd><p>Removes current cluster mail from name.</p>
    <p>It is the first half of the email address, the part before the @ sign. In <em>example@company.com</em>, it is <em>example</em>.</p></dd></dlentry>
  <dlentry>
    <dt><code>tscli smtp remove-mailname</code></dt>
    <dd><p>Removes current cluster mail name.</p>
    <p>It is the second half of the email address, the part after the @ sign. In <em>example@company.com</em>, it is <em>company</em>.</p></dd></dlentry>
<dlentry>
    <dt><code>tscli smtp remove-relayhost</code></dt>
  <dd>Removes current cluster relay host.</dd></dlentry>
<dlentry>
    <dt><code>tscli smtp remove-saslcredentials</code></dt>
  <dd>Clears SASL credentials and disables SMTP AUTH.</dd></dlentry>

<dlentry>
    <dt><code>tscli smtp reset-canonical-mapping</code></dt>
  <dd>Deletes the current postmap mapping.</dd></dlentry>

<dlentry>
  <dt><code>tscli smtp set-canonical-mapping [-h] <em>new_key</em> <em>new_value</em></code></dt>
  <dd>Sets a new Postmap mapping. You must specify the <code>new_key</code> and the <code>new_value</code>.</dd></dlentry>
<dlentry>
  <dt><code>tscli smtp set-mailfromname <em>mailfromname</em></code></dt>
  <dd><p>Sets the name from where email alerts are sent for the cluster.</p>
  <p>It is the first half of the email address, the part before the @ sign. In <em>example@company.com</em>, it is <em>example</em>.</p></dd></dlentry>
<dlentry>
  <dt><code>tscli smtp set-mailname <em>mailname</em></code></dt>
  <dd><p>Sets the domain from where email alerts are sent for the cluster.</p>
  <p>It is the second half of the email address, the part after the @ sign. In <em>example@company.com</em>, it is <em>company</em>.</p></dd></dlentry>
<dlentry>
  <dt><code>tscli smtp set-relayhost [-h] [--force <em>FORCE</em>] <em>relayhost</em></code></dt>
  <dd>
    <p>Sets the specified <code>relayhost</code> for SMTP (email) sent from the cluster.</p>
    <p>Accepts the following flag:</p>
      <dl>
        <dlentry>
        <dt><code>--force <em>FORCE</em></code></dt>
          <dd><p>Set even if relay host is not accessible.</p>
            <p>The default setting is <code>False</code>.</p></dd></dlentry>
    </dl>
  </dd></dlentry>
<dlentry>
    <dt><code>tscli smtp set-saslcredentials</code></dt>
  <dd>Sets SASL credentials and enables SMTP AUTH.</dd></dlentry>

<dlentry>
  <dt><code>tscli smtp show-canonical-mapping</code></dt>
  <dd>Shows the current postmap mapping.</dd></dlentry>
<dlentry>
    <dt><code>tscli smtp show-mailfromname</code></dt>
  <dd>Shows the mailname, from which email alerts are sent, for the cluster.</dd></dlentry>
<dlentry>
    <dt><code>tscli smtp show-mailname</code></dt>
  <dd>Shows the mailname, from which email alerts are sent, for the cluster.</dd></dlentry>
<dlentry>
    <dt><code>tscli smtp show-relayhost</code></dt>
  <dd>
    <p>Shows the relay host for SMTP (email) sent from the cluster.</p>
    <p>If the relay host is not configured, the command returns <code>NOT FOUND</code>.</p></dd></dlentry>
   </dl>

{: id="tscli-snapshot"}
### snapshot

```
tscli snapshot [-h] {backup,create,delete,ls,pin,restore,unpin,update-ttl,validate}
```

To learn more about snapshots and backups, see the [Understand the backup strategies]({{ site.baseurl }}/admin/backup-restore/choose-strategy.html) documentation.

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli snapshot backup [-h] [--mode {full,light,dataless}] [--type {full,incremental}] [--base <em>BASE</em>] [--storage_type {local,nas}] [--remote] [--no-orion-master] <em>name</em> <em>out</em></code></dt>
  <dd>
    <p>Pulls snapshot out as a backup.</p>
    <p>This command has the following required elements:</p>
    <dl>
    <dlentry>
      <dt><code>name</code></dt>
      <dd>Name of snapshot to pull out as a backup. To list all snapshots, run <code>tscli snapshot ls</code>.</dd></dlentry>
    <dlentry>
      <dt><code>out</code></dt>
      <dd>Directory where backup will be written. The directory must not already exist.</dd></dlentry></dl>
    <p><code>tscli snapshot backup</code> also accepts the following optional flags:</p>
      <dl>
        <dlentry>
          <dt><code>--mode {full,light,dataless}</code></dt>
          <dd><p>Mode of backups.</p>
          <p>The default is <code>full</code>.</p></dd></dlentry>
        <dlentry>
          <dt><code>--type {full,incremental}</code></dt>
          <dd>
            <p>Type of backup.</p>
            <p>Incremental backup is not implemented.</p>
            <p>The default setting is <code>full</code>.</p>
        </dd></dlentry>
      <dlentry>
        <dt><code>--base <em>BASE</em></code></dt>
        <dd>
          <p>Based snapshot name for incremental backup.</p>
          <p>Incremental backup is not implemented yet.</p>
        </dd></dlentry>
      <dlentry>
        <dt><code>storage_type {local,nas}</code></dt>
        <dd><p>Storage type of output directory.</p>
        <p>The default is <code>local</code>.</p></dd></dlentry>
      <dlentry>
        <dt><code>--remote</code></dt>
        <dd><p>Takes backup through orion master.</p>
        <p>The default is <code>False</code>.</p></dd></dlentry>
        <dlentry>
          <dt><code>--no-orion-master</code></dt>
          <dd><p>Specifies whether orion master is available during backup</p>
          <p>The default is <code>False</code>.</p></dd></dlentry></dl>
    </dd></dlentry>
  <dlentry>
    <dt><code>tscli snapshot create [-h] <em>name</em> <em>reason</em> <em>ttl</em></code></dt>
    <dd>
      <p>Creates a new snapshot with the specified <code>name</code> and <code>reason</code>.</p>
      <p>This command does not accept <code>.</code> (periods). It does accept <code>-</code> (dashes or hyphens).</p>
      <p>The <code>ttl</code> parameter is the number of days after which this snapshot is automatically deleted. A value of <code>-1</code> disables automatic deletion.</p>
   </dd>
</dlentry>
<dlentry>
  <dt><code>tscli snapshot delete [-h] <em>name</em></code></dt>
  <dd>Deletes the named snapshot.</dd></dlentry>
<dlentry>
  <dt><code>tscli snapshot ls [-h]</code></dt>
  <dd>Lists available snapshots.</dd></dlentry>
<dlentry>
  <dt><code>tscli snapshot pin [-h] <em>name</em></code></dt>
  <dd>Pins a snapshot with the specified <em>name</em> so it cannot be deleted or garbage collected.</dd></dlentry>
<dlentry>
  <dt><code>tscli snapshot restore [-h] [--allow_release_change] [--only_service_state] <em>name</em></code></dt>
  <dd>
    <p>Restores cluster to the specified snapshot <em>name</em>.</p>
    <p>Accepts the following flags:</p>
    <dl>
      <dlentry>
        <dt><code>--allow_release_change</code></dt>
        <dd><p>Allows restoration to a snapshot at a different release.</p>
        <p>The default is <code>False</code>.</p></dd></dlentry>
      <dlentry>
        <dt><code>--only_service_state</code></dt>
        <dd><p>Restores only the service state.</p>
        <p>The default is <code>False</code>.</p></dd></dlentry></dl></dd></dlentry>
<dlentry>
  <dt><code>tscli snapshot unpin [-h] <em>name</em></code></dt>
  <dd>Unpins the specified snapshot <em>name</em> so it can be deleted or garbage-collected.</dd></dlentry>
<dlentry>
  <dt><code>tscli snapshot update-ttl [-h] [--disable <em>DISABLE</em>] <em>name</em> <em>ttl</em></code></dt>
  <dd><p>Updates manual snapshot garbage collection policy.</p>
    <p>Accepts the following flags:</p>
    <dl>
      <dlentry>
        <dt><code>name</code></dt>
        <dd>Specifies which snapshot to update.</dd></dlentry>
      <dlentry>
        <dt><code>ttl</code></dt>
        <dd><p>This is the "time-to-live" value.</p>
          <p>Use a positive value to increase <code>ttl</code>. Use negative values to decrease it.</p></dd></dlentry>
      <dlentry>
        <dt><code>--disable <em>DISABLE</em></code></dt>
        <dd><p>Disables manual snapshot garbage collection.</p>
          <p>Setting this value to <code>True</code> overrides any <code>ttl</code> value. The default is <code>False</code>.</p></dd></dlentry></dl></dd></dlentry>
  <dlentry>
  <dt><code>tscli snapshot validate</code></dt>
  <dd>Validates a specified snapshot <em>name</em> to ensure it is not corrupt.</dd></dlentry>
</dl>

{: id="tscli-snapshot-policy"}
### snapshot-policy

```
tscli snapshot-policy [-h] {disable,enable,show,update}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli snapshot-policy disable [-h]</code></dt>
    <dd>Disables a specified snapshot policy.</dd></dlentry>
  <dlentry>
    <dt><code>tscli snapshot-policy enable -h</code></dt>
    <dd>Enables a specified snapshot policy.</dd></dlentry>
  <dlentry>
    <dt><code>tscli snapshot-policy show [-h]</code></dt>
    <dd>Shows snapshot policy.</dd></dlentry>
  <dlentry>
    <dt><code>tscli snapshot-policy update [-h] [--config <em>CONFIG</em>]</code></dt>

    <dd>
      <p>Updates periodic snapshot config, with the following parameter:</p>
      <dl>
        <dlentry>
          <dt><code>--config <em>CONFIG</em></code></dt>
          <dd>Text format of periodic backup policy config.</dd></dlentry></dl>
    </dd></dlentry>          
</dl>

{: id="tscli-socialproof"}
### socialproof
```
tscli socialproof [-h] {disable,enable}
```

This subcommand has the following options:

<dl>
<dlentry>
  <dt><code>tscli socialproof disable</code></dt>
  <dd>Disables socialproof.</dd></dlentry>
<dlentry>
  <dt><code>tscli socialproof enable</code></dt>
  <dd>Enables socialproof.</dd></dlentry></dl>

{: id="tscli-spot"}
### spot

```
tscli spot [-h] {enable}
```

Enables Spot integration.  

This subcommand has the following option:

<dl>
  <dlentry>
    <dt><code>tscli spot enable [-h] --token <em>TOKEN</em> --thoughtspot_url <em>THOUGHTSPOT_URL</em> [--cache_timeout <em>CACHE_TIMEOUT</em>]</code></dt>
    <dd>
      <p>The <code>spot enable</code> subcommand accepts the following optional flags:</p>

      <dl>
        <dlentry>
          <dt><code>--token <em>TOKEN</em></code></dt>
          <dd>Slack authorization token for Spot bot. This is required. You receive this token when your Slack administrator adds the Spot application.</dd></dlentry>

      <dlentry>
        <dt><code>--thoughtspot_url <em>THOUGHTSPOT_URL</em></code></dt>
        <dd>
          <p>URL for the ThoughtSpot application.</p>
          <p>This is required.</p></dd></dlentry>
      <dlentry>
        <dt><code>--cache_timeout <em>CACHE_TIMEOUT</em></code></dt>
        <dd>
          <p>Internal cache timeout.</p>
          <p>The default setting is <code>60000</code>.</p></dd></dlentry>
     </dl></dd></dlentry>

</dl>

{: id="tscli-ssl"}
### ssl

```
tscli ssl [-h] {add-cert,add-valid-hosts,clear-min-tls-version,off,on,remove-valid-hosts,rm-cert,set-alert-days,set-min-tls-version,status,tls-status}
```        
This subcommand manages the SSL configuration.

To use SSL, the following ports must be open:
- 443
- 80

Refer to [Configure SSL]({{ site.baseurl }}/admin/setup/SSL-config.html) for more information.

This subcommand has the following options:

<dl>

  <dlentry>
    <dt><code>tscli ssl add-cert [-h] <em>key</em> <em>certificate valid_hosts</em></code></dt>
    <dd>Adds a specified SSL certificate and key pair. Requires a comma-separated host list. Nginx will reject if the hosts are not valid. This command has the following optional flag:
    <dl><dlentry>
    <dt><code>--force</code></dt>
    <dd><p>Forces setting of key and certification without validation.</p>
    <p>The default is <code>False</code>.</p></dd></dlentry></dl></dd>
  </dlentry>

 <dlentry>
    <dt><code>tscli ssl add-valid-hosts [-h] <em>VALID_HOSTS</em></code></dt>
    <dd>Enables host validation for the specified host(s). Helps improve security. This feature is for all customers that have or are planning to enable SSL. Multiple hosts must be separated by a comma (,).</dd>
    <dd>Examples:</dd>
    <dd>1. If you want to make sure the valid host is <b>cluster1.corp.example.com</b>, you would run the command: <br><code>tscli ssl add-valid-hosts cluster1.corp.example.com</code></dd>
    <dd>2. If you want to allow all hosts which have the suffix <b>corp.example.com</b>, you would run the command: <br><code>tscli ssl add-valid-hosts *.corp.example.com</code>. This wild card should be used within the hostname.</dd>
    <dd>3. If you want to allow multiple valid hosts, for example both <b>*.corp.example.com</b> and <b>cluster1</b>, you would run the command: <br><code>tscli ssl add-valid-hosts *.corp.thoughtspot.com,cluster1</code></dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli ssl clear-min-tls-version [-h]</code></dt>
    <dd>Clears any customizations for the minimum TLS version to support.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli ssl off</code></dt>
    <dd>Disables SSL. Disabling SSL will stop users from seeing a security warning
    when accessing ThoughtSpot from a browser if there is no SSL certificate
    installed.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli ssl on [-h]</code></dt>
    <dd>If SSL is enabled and there is no certificate, users will see a security warning when accessing ThoughtSpot from a browser. To bypass this warning, users must click <strong>Advanced</strong> and then <strong>Proceed</strong>.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli ssl remove-valid-hosts</code></dt>
    <dd>Turns off validation of hosts.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli ssl rm-cert</code></dt>
    <dd>Removes the existing SSL certificate, if any. Reverts to default self-signed certificate.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli ssl set-alert-days <em>days</em></code></dt>
    <dd><p>Sets alert threshold for a specifed number of days to check before SSL certificate expires.</p>
    <p>The default is <code>30 days</code>.</p></dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli ssl set-min-tls-version <em>{1.0,1.1,1.2}</em></code></dt>
    <dd>Sets a specified minimum supported TLS version. Sets the minimum SSL version to be supported by the ThoughtSpot application. You must ensure that client browsers are enabled for this version or newer.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli ssl status</code></dt>
    <dd>Shows whether SSL authentication is enabled or disabled.</dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli ssl tls-status</code></dt>
    <dd>Prints the status of TLS support.</dd>
  </dlentry>

</dl>

{: id="tscli-sssd"}
### sssd

```
tscli sssd {enable, disable, set-sudo-group, clear-sudo-group}
```

This subcommand uses system security services daemon (SSSD), and has the following options:

<dl>

<dlentry id="tscli-sssd-enable">
  <dt><code>tscli sssd enable --user <em>USER</em> --domain <em>DOMAIN</em></code></dt>
  <dd>Enables system Active Directory (AD) user access on a single node. You will be
   prompted for password credentials. The user must have permission to join a
   computer or VM to the domain. This subcommand has the following parameters:
   <dl>
    <dlentry>
      <dt><code>--user <em>USER</em></code></dt>
      <dd>You must specify the user to receive access.</dd>
    </dlentry>
    <dlentry>
      <dt><code>--domain <em>DOMAIN</em></code></dt>
      <dd>You must specify the domain.</dd>
    </dlentry>
  </dl>
   </dd>
 </dlentry>

 <dlentry id="tscli-sssd-disable">
   <dt><code>tscli sssd disable</code></dt>
    <dd>Disables Active Directory access. Leaves identity domain and removes AD sudo group.</dd>
  </dlentry>

  <dlentry id="tscli-sssd-set-sudo-group">
    <dt><code>tscli sssd set-sudo-group <em>ACTIVE_DIRECTORY_GROUP_NAME</em></code></dt>
    <dd>Allows <code>sudo</code> permissions for a specified AD group.</dd>
  </dlentry>

  <dlentry id="tscli-sssd-clear-sudo-group">
    <dt><code>tscli sssd clear-sudo-group <em>ACTIVE_DIRECTORY_GROUP_NAME</em></code></dt>
    <dd>Clears a specified AD sudo group so that they no longer have <code>sudo</code> permissions.</dd>
  </dlentry>

</dl>

For more about setting up Active Directory access, see [Enable Active Directory based access]({{ site.baseurl }}/admin/setup/active-directory-based-access.html).

{: id="tscli-storage"}
### storage

```
tscli storage [-h] {gc,df}
```

This subcommand has the following options:

<dl>

  <dlentry>
    <dt><code>tscli storage gc [-h] [--log_age <em>LOG_AGE</em>] [--force] [--localhost_only]</code></dt>
    <dd>
    Garbage collects unused storage.
    <p>Before issuing this command, you must stop the cluster using <code>tscli
    cluster stop</code>.</p>
    <p>After garbage collection finishes, you can restart the cluster with <code>tscli cluster start</code>.</p>

    <p>This command frees space in the following directories:</p>

    <pre>/tmp
    /usr/local/scaligent/logs/
    /export/logs/orion
    /export/logs/oreo
    /export/logs/hadoop
    /export/logs/zookeeper
    cores</pre>

    <p>The <code>storage gc</code> subcommand accepts these optional flags:</p>

    <dl>

      <dlentry><dt><code>--log_age <em>LOG_AGE</em></code></dt>
        <p>Deletes logs older than a specified number of hours. Use a non-zero value, because zero deletes all temporary files, including the ones that are closed temporarily while passing from one component to the next.</p>
        <p>The default setting is <code>4</code>.</p>
      </dlentry>

      <dlentry><dt><code>--force</code></dt>
        <p>Forces deletion of all logs and temporary files regardless of age. Only run this command on a stopped cluster. To stop a cluster, run <code>tscli cluster stop</code>.</p>
        <p>The default setting is <code>False</code>.</p>
      </dlentry>

      <dlentry><dt><code>--localhost_only</code></dt>
        <p>Only removes the logs on the local host. If not specified, the
           command acts on the entire cluster.</p>
      </dlentry>
    </dl>
    </dd>
  </dlentry>

  <dlentry>
    <dt><code>tscli storage df [--mode disk|hdfs]</code></dt>
    <dd>Checks the disk usage on the relevant mounts. Returns output similar to the Linux system command <code>df -h <em>directory</em></code>.</dd>
  </dlentry>

</dl>

{: id="tscli-support"}
### support

```
tscli support [-h]
   {bundle, restart-remote, rm-admin-email, rm-admin-phone, rm-feedback-email,
    set-admin-email, set-admin-phone, set-debug-ui-password, set-feedback-email,
    set-remote, show-admin-email, show-admin-phone, show-feedback-email,
    show-remote, start-remote, stop-remote}

```
This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli support bundle [-h] [--include <em>INCLUDE</em>] [--exclude <em>EXCLUDE</em>] [--list_selectors] [--since <em>SINCE</em>] [--from <em>FROM</em>] [--to <em>TO</em>] [--out <em>OUT</em>] [--nodes <em>NODES</em>]</code></dt>

   <dd>
      <dl>

        <dlentry>
          <dt><code>--include <em>INCLUDE</em></code></dt>
          <dd>
            <p>Comma-separated list of selectors to include. Each entry is
      either a "selector" or a glob for matching files. To see the list of valid
      selectors, run this command with <code>--list_selectors</code>. You may also specify <code>all</code> to get all selectors and logs, and <code>basic</code> to get only the basic selectors.</p>
            <p>Selectors can be used for logs collection: <code>all</code>, <code>orion</code>, <code>system</code>, <code>ts</code>, or the name of a service.</p>
            <p>Anything that starts with <code>/</code> (forward slash) is assumed to be a glob
      pattern, and is interpreted through <code>find(1)</code>. Other entries are ignored.</p>
            <p><strong>TIP:</strong> Use single quotes around the parameter value to prevent undesired glob expansion. Use <code>all</code> to collect all selectors and all logs.</p>
            <p>The default setting is <code>all_but_logs</code>.</p></dd></dlentry>

        <dlentry>
          <dt><code>--exclude <em>EXCLUDE</em></code></dt>
          <dd>
            <p>Comma-separated list of selectors to exclude. Applies to the
      list selected by <code>--include</code>. Parameters are interpreted in the same manner as in <code>--include</code>.</p>
           <p>Use the special keyword <code>logs</code> to exclude logs collection altogether.</p>
           <p>There is no default setting.</p></dd></dlentry>

        <dlentry>
          <dt><code>--list_selectors</code></dt>
          <dd>
            <p>Lists the selectors available for <code>--include</code> and <code>--exclude</code>, and then exits.</p>
            <p>The default setting is <code>False</code>.</p></dd></dlentry>

        <dlentry>
          <dt><code>--since <em>SINCE</em></code></dt>
          <dd><p>Grabs logs from the specified time window. Should be a human-readable duration string, such as <code>4h</code> (4 hours), <code>30m</code> (30 minutes), <code>1d</code> (1 day).</p>
          <p>There is no default setting.</p></dd></dlentry>

        <dlentry>
          <dt><code>--from <em>FROM</em></code></dt>
          <dd>
            <p>Timestamp when collection begins. Must be of the form: <code>yyyymmdd-HH:MM</code>.</p>
            <p>There is no default setting.</p></dd></dlentry>

        <dlentry>
          <dt><code>--to <em>TO</em></code></dt>
          <dd>
            <p>Timestamp when collection ends. Must be of the form: <code>yyyymmdd-HH:MM</code>.</p>
            <p>There is no default setting.</p></dd></dlentry>

        <dlentry>
          <dt><code>--out <em>OUT</em></code></dt>
          <dd>
            <p>Tarball path for dumping the support bundle.</p>
            <p>The default setting is <code>/tmp/support_bundle.tar.gz</code>.</p></dd></dlentry>

        <dlentry>
          <dt><code>--nodes <em>NODES</em></code></dt>
          <dd>
            <p>Comma separated list of nodes from where to collect logs. Skip this to use all
        nodes.</p>
            <p>There is no default setting.</p></dd></dlentry>

      </dl></dd></dlentry>

<dlentry>
  <dt><code>tscli support restart-remote</code></dt>
  <dd>Restarts remote support.</dd>
</dlentry>

<dlentry>
  <dt><code>tscli support rm-admin-email</code></dt>
  <dd>Removes the email address for contacting the customer administrator. Replaces it with the default ThoughtSpot Support email address.</dd>
</dlentry>

<dlentry>
  <dt><code>tscli support rm-feedback-email</code></dt>
  <dd>Removes the email address for product feedback. Replaces it with the default ThoughtSpot Support email address.</dd>
</dlentry>

<dlentry>
  <dt><code>tscli support rm-admin-phone</code></dt>
  <dd>Removes the phone number for contacting the customer administrator. Replaces it with the default ThoughtSpot Support phone number.</dd>
</dlentry>

<dlentry>
  <dt><code>tscli support set-admin-email <em>email</em></code></dt>
  <dd>Sets the specified email address for contacting the customer administrator.</dd>
</dlentry>

<dlentry>
  <dt><code>tscli support set-feedback-email <em>email</em></code></dt>
  <dd>Sets the specified email address for sending feedback.</dd>
</dlentry>

<dlentry>
  <dt><code>tscli support set-admin-phone <em>phone_number</em></code></dt>
  <dd>Sets the specified phone number for contacting the customer administrator. Specify a phone number using any value, such as <code>+1 800-508-7008 Ext. 1</code>.</dd>
</dlentry>

<dlentry>
  <dt><code>tscli support set-remote [-h] [--addr <em>ADDR</em>] [--user <em>USER</em>]</code></dt>
  <dd>Configures the cluster for remote support through SSH tunneling, where <em><code>ADDR</code></em> is the support address, such as <code>tunnel.thoughtspot.com</code>, and <em><code>USER</code></em> is the support username.</dd>
</dlentry>

<dlentry>
  <dt><code>tscli support show-admin-email</code></dt>
  <dd>Shows the email address for the customer administrator, if set.</dd>
</dlentry>

<dlentry>
  <dt><code>tscli support show-feedback-email</code></dt>
  <dd>Shows the email address for product feedback, if set.</dd>
</dlentry>

<dlentry>
  <dt><code>tscli support show-admin-phone</code></dt>
  <dd>Shows the phone number for the customer administrator, if set.</dd>
</dlentry>

<dlentry>
  <dt><code>tscli support show-remote</code></dt>
  <dd>Prints the status and configuration of remote support.</dd>
</dlentry>

<dlentry>
  <dt><code>tscli support start-remote</code></dt>
  <dd>Starts remote support.</dd>
</dlentry>

<dlentry>
  <dt><code>tscli support stop-remote</code></dt>
  <dd>Stops remote support.</dd>
</dlentry>
</dl>

{: id="tscli-tokenauthentication"}
### tokenauthentication

```
tscli tokenauthentication [-h] {disable,enable}
```

This subcommand has the following options:

<dl>
  <dlentry>
    <dt><code>tscli tokenauthentication enable</code></dt>
    <dd>Configures token-based login.</dd>
  </dlentry>
<dlentry>
  <dt><code>tscli tokenauthentication disable</code></dt>
  <dd>Purges existing token-based login configuration.</dd></dlentry>
</dl>
