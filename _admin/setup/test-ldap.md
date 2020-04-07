---
title: [Test the LDAP configuration]


last_updated: tbd
summary: "This procedure allows you to test the LDAP connection you created.
"
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
After configuring LDAP, you can test to make sure it is working by issuing a command.

1. Log in to the Linux shell using SSH.
2. Issue the LDAP testing command, supplying the information for the LDAP server you configured, as in this example:

    ```
    $ ldapsearch -x -h 192.168.2.61 -p 389 -D "testuser@ldap.thoughtspot.com" -W -b "dc=ldap,dc=thoughtspot,dc=com" cn
    ```

3. Supply the LDAP password when prompted.
4. If the connection works, you can see a confirmation message.
