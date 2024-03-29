{: id="error-recovery"}
## Error recovery
{: id="set-config-error-recovery"}
### `Set-config` error recovery
If you get a warning about node detection when you run the `set-config` command, restart the node-scout service.

Your error may look something like the following:
```
Connecting to local node-scout WARNING: Detected 0 nodes, but found configuration for
only 1 nodes.
Continuing anyway. Error in cluster config validation: [] is not a valid link-local
IPv6 address for node: 0e:86:e2:23:8f:76 Configuration failed.
Please retry or contact support.
```
Restart the node-scout service with the following set of commands.

    $ sudo vim /etc/systemd/system/node-scout.service
    $ sudo systemctl daemon-reload
    $ sudo systemctl restart node-scout

Ensure that you restarted the node-scout by running `sudo systemctl status node-scout`. Your output should specify that the node-scout service is active. It may look something like the following:
```
$ sudo systemctl status node-scout
  ● node-scout.service - Setup Node Scout service
    Loaded: loaded (/etc/systemd/system/node-scout.service; enabled; vendor preset: disabled)
    Active: active (running) since Fri 2019-12-06 13:56:29 PST; 4s ago
```

Next, retry the `set-config` command.

    $ cat nodes.config | tscli cluster set-config

The command output should no longer have a warning.
