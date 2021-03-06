---
title: [Configure SAML]
last_updated: 3/4/2020
summary: "You can use the Security Assertion Markup Language (SAML) to authenticate users."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

ThoughtSpot enables you to use the Security Assertion Markup Language (SAML) to authenticate user. You can set up SAML through the shell on ThoughtSpot using a `tscli`-based configurator. It is configured to work using service provided by an Identity Provider (IDP).

{: id="prerequisites"}
## Configuration prerequisites

Before you configure SAML, collect the following information:

| &#10063; | [ThoughtSpot service address](#ts-service-address) |
| &#10063; | [Service port](#ts-service-port) |
| &#10063; | [Unique service name](#ts-service-name) |
| &#10063; | [Skew time in seconds](#skew-time) |
| &#10063; | [IDP Metadata XML File](#metadata-xml-file) |
| &#10063; | [Automatically add SAML users to Thoughtspot](#auto-add) |
| &#10063; | [Also use ThoughtSpot internal authentication](#ts-auth) |

{: id="ts-service-address" }
### ThoughtSpot service address
DNS name of the load balancer _front-end_ for multi-node ThoughtSpot clusters, or of ThoughtSpot _server_ For single-node ThoughtSpot cluster.

{: id="ts-service-port" }
### Service port
Service port for ThoughtSpot instance, typically TCP/443.

{: id="ts-service-name" }
### Unique service name
The unique key ThoughtSpot uses to identify IDP service. Set by the ThoughtSpot Support Team.

The key has the following format: `urn:thoughtspot:callosum:saml`.

{: id="skew-time" }
### Skew time in seconds
Allowed skew time for authentication, or the duration after authentication response is rejected and sent back from the IDP.

Usually set to `3600` seconds.

{: id="metadata-xml-file" }
### IDP Metadata XML File
This file is provided by the IDP. The absolute path to the `idp-meta.xml` file is needed for one-time configuration.

{: id="auto-add" }
### Automatically add SAML users to Thoughtspot: (yes/no)
If you choose 'yes', then new users will be automatically created in ThoughtSpot.
If 'no', then SAML users will be added in ThoughtSpot upon first successful SSO login.

{: id="ts-auth" }
### Also use ThoughtSpot internal authentication: (y/n)

If 'y', then ThoughtSpot local/internal users (including local administrative users) will still be authenticated outside the scope of SSO.

{: id="saml-configure-tscli" }
## Configure SAML using tscli

{% include note.html content="The configuration persists across updates to newer releases of ThoughtSpot." %}

To set up SAML on ThoughtSpot for user authentication, follow these steps:

1. Log in to the Linux shell using SSH.

2. Run the `saml configure` command to launch the interactive SAML configuration:

    ```
    tscli saml configure
    ```

3. Complete the configurator prompts with the information you collected in [Configuration prerequisites](#prerequisites).

4. When the configuration completes, open a browser and navigate to the ThoughtSpot login page. It should show the SSO option.
