---
title: [Mobile FAQ]
summary: These are a few frequently asked questions about ThoughtSpot mobile.
last_updated: 02/28/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

## Caching data

You may wonder where does the mobile device store the cached data and login credentials.

ThoughtSpot iOS app stores two kinds of data:

- **Authentication data** is in an encrypted database, called a keychain.

  For more information, refer to Apple's documentation on [Keychain Services](https://developer.apple.com/documentation/security/keychain_services){:target="_blank"}.

- **Cached data for the Home Pinboard** is in encrypted files storage on the iOS device. iOS encrypts and decrypts these files as needed. ThoughtSpot app caches _only_ the Home page data.

  By default, these files are inaccessible, until the user unlocks the device for the first time.

  For more information, refer to Apple's documentation on [Encrypting your App's Files](https://developer.apple.com/documentation/uikit/protecting_the_user_s_privacy/encrypting_your_app_s_files){:target="_blank"}

{% include note.html content="You cannot access the data saved by the ThoughtSpot mobile app from any other app." %}

## Deleting data saved on the iOS device, and restricting sharing

You may choose to deploy the ThoughtSpot app using management platforms like Airwatch, Mobile Iron, Microsoft Intune, and others. They give you the flexibility to delete the mobile device's data and stop functionality like copy and paste, and screenshots.

## Restricting sharing options

We removed Facebook, Twitter, and Weibo from the share sheet.

## Debugging SSL certificate issues

The iOS may show a message that SSL certificates to the requested URL is invalid or expired. There are three possible solutions to this problem:

- Add a valid SSL certificate on the cluster.

- The customer may be using an internally-generated SSL certificate, which iOS doesn’t recognize. Use an external certificate-issuing agency, like <a href="https://www.digicert.com/" target="_blank">digicert.com/</a>, to generate a valid SSL certificate.

- Convert from HTTPS to HTTP connections by running the following `tscli` command for the entire cluster:

  ```
  tscli ssl off
  ```
