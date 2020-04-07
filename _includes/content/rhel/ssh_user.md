<dl>
<dlentry>
  <dt>On-premise deployments</dt>
  <dd>Use the default values.</dd>
</dlentry>
<dlentry>
  <dt>AWS</dt>
  <dd>The same as <code>ec2_user</code>.</dd>
</dlentry>
<dlentry>
  <dt>GCP</dt>
  <dd>Add values that are not currently in use. To determine what values your system uses already, run the following command:
  <codeblock>cat /etc/passwd | cut -d ":" -f3-4| sort
  </codeblock></dd>
</dlentry>
</dl>
