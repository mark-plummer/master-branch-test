---
title: [Configure SSL]
last_updated: 3/4/2020
summary: "Secure socket layers (SSL) provide authentication and data security when sending data to and from ThoughtSpot."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can use your own SSL certificate to secure ThoughtSpot HTTP(S) traffic.

{: id="ssl-about"}
## About SSL
To enable SSL for the ThoughtSpot web service, you must provide your organization's SSL certificate for the ThoughtSpot service URL.  If you do not have this certificate, you have the following options:

-   Check with your IT department if they have an SSL certificate you can use.
-   Obtain the certificate from an issuing authority.
-   Use the default SSL certificate on the ThoughtSpot nodes.
-   Disable SSL using the `tscli ssl off` command.

ThoughtSpot supports a wide variety of SSL types.

{: id="ssl-ports"}
## Required ports

To use ThoughtSpot webservice securely, ensure that TCP port 443 is open to accommodate incoming connections to Thoughtspot nodes and clusters.

{: id="ssl-configure"}
## Configure SSL for web traffic
To add SSL and enable HTTPS in ThoughtSpot, obtain the [SSL certificate chain](#ssl-certificate-chain) and the [private key](#key).

You can then proceed to [Configure SSL using tscli]({{ site.baseurl
}} #ssl-configure-tscli), and [Test the SSL certificate]({{ site.baseurl
}} #ssl-configure-test).

{: id="ssl-certificate-chain"}
### SSL certificate chain
The SSL certificate chain must be in PEM format, which is an `X.509v3` file that contains ASCII (Base64) armored data, packed between `BEGIN` and `END` directives. The certificate chain may contain a series of certificates, with the root certificate at the bottom and user-facing, while the ThoughtSpot-specific SSL certificate is at the top.

{: id="key"}
### Private key
The private key must also be in compatible PEM format. It cannot be password-protected, or passphrase-protected.

{% include note.html content="Do not use a passphrase when creating certificates with ThoughtSpot." %}

If you are prompted to specify a passphrase, first check if it exists by invoking the following command:

```
openssl rsa -check -in pk.key`
```

If the answer is 'yes', you must remove the passphrase first, and then proceed to use the private key with ThoughtSpot.

{: id="ssl-configure-tscli"}
## Configure SSL using tscli

Follow these instructions to install the SSL certificate using tscli:

1. Use the instructions from the certifying authority where you obtained the certificate.

   This is usually sent to you by email, or available for download.

2. Copy the certificate and key files to ThoughtSpot:

      ```
      $ scp <key> <certificate> admin@<IP_address>:<certificate-path>
      ```

3. Log in to the Linux shell using SSH.

4. Change to the directory where you copied the files:

    ```
    $ cd <certificate-path>
    ```

5. To install the certificate, issue the `tscli` command:

    ```
    $ tscli ssl add-cert <key> <certificate>
    ```

6. To test that the certificate is correctly installed, sign in to the ThoughtSpot application (https://docs.thoughtspot.com/6.0/admin/setup/logins.html#sign-in-to-the-thoughtspot-application).

     You should see that the application's URL begins with `https://`.

{: id="set-tls-version"}
### Set the recommended TLS version
ThoughtSpot supports SSL v3, TLS v1.2 by default. Support for TLS v1.0 and v1.1 is included for backwards compatibility. To ensure support for TLS version 1.2:

1.  Enable your web browser to support TLS v1.2. This can be done in your browser's advanced settings.
2.  Log in to the Linux shell using SSH and run command:

    ```
    tscli ssl tls-status
    ```

    It should respond with
    ```
    Minimum TLS version supported: 1.2
    ```

    This will block all usage of older versions.
 3. To change this, run `tls ssl set-min-tls-version 1.1` or `tls ssl set-min-tls-version 1.0` as desired for backward compatibility.

{: id="config-load-balancer"}
### Configuration string for load balancers

When enabling SSL support on a load balancer’s server-side SSL client profile, make sure to add support for the following ciphers to ensure compatibility between the load balancer and ThoughtSpot.

The following ciphers are currently supported:

```
|   TLSv1.2:
|     ciphers:
|       TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 - strong
|       TLS_DHE_RSA_WITH_AES_256_CBC_SHA - strong
|       TLS_DHE_RSA_WITH_AES_256_CBC_SHA256 - strong
|       TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 - strong
|       TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 - strong
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA - strong
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 - strong
|       TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 - strong
|     compressors:
|       NULL
|_  least strength: strong
```

The cipher string would be as follows:-

```
EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH
```

You can retrieve these from the ThoughtSpot web server (not against the load balancer) by running the following command on any ThoughtSpot node:
    ```
    nmap --script ssl-enum-ciphers -p 443 <ThoughtSpot_node_IP_address>
    ```
You must ensure that your load balancer supports these ciphers.

{: id="ssl-configure-test"}
## Test the SSL certificate

To test if the certificate is installed correctly, see [Sign in to the ThoughtSpot application]({{ site.baseurl
}}//admin/setup/logins.html#sign-in-to-the-thoughtspot-application).
