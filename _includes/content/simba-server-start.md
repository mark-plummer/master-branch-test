Before you begin, you need to know the IP address or DNS name of the server you
intend to connect your server to.

1. SSH as `admin` or the `thoughtspot` user to your ThoughtSpot node.
2. Verify the node IP(s).

   ```bash
   $ tscli node ls
   172.18.231.17
   172.18.231.18
   ```

3. Make a note of each IP; there may be more than one.
4. Configure the ThoughtSpot firewall to allow connections from your ETL client, by running the following command on any ThoughtSpot node:
`tscli firewall open-ports --ports 12345`
5. Exit or close the shell.
