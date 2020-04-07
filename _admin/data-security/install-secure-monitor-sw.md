---
title: [Installing third-party security and monitoring software]
summary: "You can install third-party software for security, governance, and monitoring of ThoughtSpot."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
This procedure shows how to install supported [third-party security and monitoring software]({{ site.baseurl}}/admin/data-security/about-secure-monitor-sw.html#) on a ThoughtSpot cluster:

## To install third-party software

1. Log in to the Linux shell using SSH.

2. Issue the `tscli ansible checkout` command, specifying a temporary directory, for example:

    ```
    $ tscli ansible checkout
    Checking out playbooks successfully in /tmp/111895937.
    ```
3. Switch to the temporary directory that was created.

    ```
    $ cd /tmp/111895937
    ```

4. In the temporary directory, save or edit the playbooks and modules.  
   If you want to create a global ordering between playbooks, name them in alphabetical order, e.g. 10.first.yml, 20.second.yml, etc. You can also specify the order line by line in order.txt within the same directory.

5. Commit your changes. This command will validate the playbook first, and then apply it.

   Use the --local flag if you want to commit the change only to local storage on the local node. Otherwise, push it will go to centralized storage, and your changes will apply to all nodes in the cluster.

   - To apply your changes globally to all nodes in the cluster, issue the command:

   ```
   $ tscli ansible commit
   ```

   - To apply your changes on the local node only, issue the command:

   ```
   $ tscli ansible commit --local
   ```

   This commits your changes. If there is a problem with the configuration. you will see an error message in standard output.
