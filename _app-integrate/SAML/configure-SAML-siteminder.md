---
title: [Configure CA SiteMinder]


last_updated: tbd
summary: "CA SiteMinder can be used as an Identity Provider for single sign on to ThoughtSpot."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Before configuring CA SiteMinder, you must [configure SAML in ThoughtSpot](configure-SAML-with-tscli#). Use this procedure to set up CA SiteMinder for use with ThoughtSpot:

1. Configure the Local Identity Provider Entity as follows:

    |Section|Entry|
    |-------|-----|
    |Entity Location|Local|
    |Entity Type|SAML2 IDP|
    |Entity ID|Any (Relevant ID)|
    |Entity Name|Any (Relevant name)|
    |Description|Any (Relevant description)|
    |Base URL|https://<FWS_FQDN\> where FWS_FQDN is the fully-qualified domain name for the host serving SiteMinder Federation Web Services|
    |Signing Private Key Alias|Select the correct private key alias or import one if not done already|
    |Signed Authentication Requests Required|No|
    |Supported NameID format|Optional|

2. Create the Remote SP Entity, either through a metadata import or manually.
   To configure the Remote SP entity manually, select **Create Entity**. Create ThoughtSpot as a Remote Entity with following details:

    |Section|Entry|
    |-------|-----|
    |Entity Location|Remote|
    |New Entity Type|SAML2 SP|
    |Entity ID|Your cluster|
    |Entity Name|Any (relevant name)|
    |Description|Any (relevant description)|
    |Assertion Consumer Service URL|(Relevant URL)|
    |Verification Certificate Alias|Select the correct certificate or import one if not done already. This is used to verify the signature in incoming requests|
    |Supported NameID Format|Optional|

3. You will now configure the Federation Partnership between CA SiteMinder (the IDP) and ThoughtSpot (the Remote SP) in CA SiteMinder. Log in to CA SiteMinder.
4. Navigate to **Federation** -> **Partnership Federation -> Create Partnership** (**SAML 2 IDP -> SP**).
5. Click **Configure Partnership** and fill in the following values:

    |Section|Entry|
    |-------|-----|
    |Add Partnership Name|Any (relevant name)|
    |Description|Any (relevant description)|
    |Local IDP ID|Select Local IDP ID|
    |Remote SP ID|Select Remote SP ID|
    |Base URL|Will be pre-populated|
    |Skew Time|Any per environment requirement|
    |User Directories and Search Order|Select required Directories in required search order|

6. Click **Configure Assertion** and fill in the following values:

    |Section|Entry|
    |-------|-----|
    |Name ID Format|Optional|
    |Name ID Type|User Attribute|
    |Value|Should be the name of the user attribute containing the email address or user identifier. For example, 'mail'|

7. Click **Configure SSO and SLO** and fill in the following values:

    |Section|Entry|
    |-------|-----|
    |Add Authentication URL|This should be the URL that is protected by SiteMinder|
    |SSO Binding|Select SSO Binding supported by the SP, typically the HTTP-Post|
    |Audience|(Relevant audience)|
    |Transaction Allowed|Optional|
    |Assertion Consumer Service URL|This should be pre-populated using the information from the SP entity|

8. Continue to **Partnership Activation** and select **Activate**.
