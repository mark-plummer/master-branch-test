To perform basic administration such as checking network connectivity, starting and stopping services, and setting up email, log in remotely as the Linux administrator user "admin". To log in with SSH from any machine, you can use the command shell or a utility like Putty.

In the following procedure, replace `<hostname_or_IP>` with the hostname or IP address of a node in ThoughtSpot. The default SSH port (22) will be used.

1. Log in to a client machine and open a command prompt.
2. Issue the SSH command, specifying the IP address or hostname of the ThoughtSpot instance:
  ```
  ssh admin@<hostname_or_IP>
  ```
3. Enter the password for the admin user.<br>
    ThoughtSpot provides a default password for both the `admin` and `thoughtspot` shell users. ThoughtSpot recommends that you change the passwords for both these users on first login. Follow your company's policies on password security.
