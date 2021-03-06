---
title: [Configure authentication through Active Directory]
last_updated: 10/10/2019
summary: "ThoughtSpot enables you to set up integration with LDAP using Active Directory. After successful setup, you can authenticate users against a secure LDAP server."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

{: id="prerequisites"}
## Configuration prerequisites

Before you configure ThoughtSpot for Active Directory, collect the following information:

| &#10063; | [URL](#url) |
| &#10063; | [Domain name](#domain-name) |
| &#10063; | [Search base](#search-base) |
| &#10063; | [SSL](#ssl) |
| &#10063; | [Automatically add LDAP or AD users in ThoughtSpot?](#auto-add) |
| &#10063; | [Also use ThoughtSpot internal authentication?](#ts-auth) |

{: id="url" }
### URL

Required to connect to Active Directory.

For example, `ldap://ad.yourdomain.local:389` or `ldap://ad.yourdomain.local:636`

{: id="domain-name" }
### Domain name

Default domain under which users who want to be authenticated against Active Directory reside. When a user logs in with a username, the default domain is added to the username before sending it to the LDAP server. If users reside in multiple sub-domains, you can still designate one of them as the default. Authentication against multiple domains is not supported.

Users who don't belong to the default domain must explicitly qualify their username when they log in.

For example: `username@ad.yourdomain.local`

{: id="search-base" }
### Search base

LDAP search base. The scope of searching user information, like _email_ and _Display name_, within AD.

{: id="ssl" }
### SSL

If you want to use SSL, you must obtain the SSL certificate from an issuing authority.

If AD servers are behind a load balancer, you must procure the SSL certificate to identify ThoughtSpot to the load balancer. The communication after the load balancer is non-secure. ThoughtSpot does not support a scenario where multiple AD servers provide their own SSL certificates.

{: id="auto-add" }
### Automatically add LDAP or AD users in ThoughtSpot? (yes/no)

If you choose 'yes', new users are automatically created within ThoughtSpot when successfully authenticated against AD. ThoughtSpot doesn't cache passwords for AD-authenticated users.

If you choose 'no', users have to be manually created with a dummy password as a placeholder in ThoughtSpot before they can log in. The username you specify when creating the LDAP-authenticated user manually in ThoughtSpot has to be domain qualified, for example: `username1@ad.yourdomain.local`.

In order to log in to ThoughtSpot, the user has to exist in ThoughtSpot independent of whether that user is authenticated against AD or against ThoughtSpot's internal authentication.

{: id="ts-auth" }
### Also use ThoughtSpot internal authentication? (yes/no)

If you choose 'yes', ThoughtSpot will first attempt to authenticate the user against AD. If that attempt fails, it will then attempt to authenticate the user as an internal/local ThoughtSpot user. If either of these succeed, then the user is successfully logged in. This is useful in scenarios where some users are not in AD and are created only in ThoughtSpot.

{: id="configure-ldap-tscli" }
## Configure LDAP using tscli

You do not have to create a user called `tsadmin` on your LDAP server. Internal authentication can be used for `tsadmin`. To configure AD based authentication, follow these steps:

1. Log in to the Linux shell using SSH.
2. Run the command to configure AD authentication:

    ```
    $ tscli ldap configure
    ```

3. Answer the prompts using the information you collected under **Before you begin** section. For example:

    ```
    Choose the LDAP protocol:
    [1] Active Directory
    Option number: 1
    Configuring Active Directory
    URL to connect to Active Directory. (Example: ldap://ad.yourdomain.local:389): ldaps://ad.yourdomain.local:636
    Default domain (Example: ldap.thoughtspot.com): yourdomain.local
    Use SSL (LDAPS) (y/n): n
    LDAP search base (Example: cn=Users): cn=Users,ou=orgunit,dc=youdomain,dc=local
    Automatically add LDAP users in ThoughtSpot (y/n): y
    Also use ThoughtSpot internal authentication (y/n): y
    ```

4. If you are using SSL, [add the SSL certificate for AD](add-SSL-for-LDAP.html#).
5. If you want to remove the AD configuration, issue the following command:

    ```
    $ tscli ldap purge-configuration
    ```
