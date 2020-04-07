---
title: [Deploy mobile app]
summary: You can deploy the ThoughtSpot mobile app through the iOS app store, or your MDM or MAM platform.
last_updated: 11/15/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Deploying the ThoughtSpot mobile app to your users allows them to access their data and make decisions remotely from their Apple iOS device. For more information about features in the mobile app, refer to [ThoughtSpot mobile overview]({{ site.baseurl }}/admin/mobile/use-mobile.html#).

## Deployment options

There are two options for your users to download the ThoughtSpot mobile app:
- App Store for iOS
- Your MDM platform

### App Store for iOS
The ThoughtSpot app is available from the App Store for iOS. Your users can download it directly from there.

### Mobile device or app management platform
There are two ways to provide the ThoughtSpot app to your users with your MDM platform:

#### Option 1 [Recommended]: Provide a link to the app in the App Store for iOS.

Almost all of the platforms allow you to link to the app in the App Store. With this option, your users download it directly and automatically receive the latest updates, when they are available.

To add a link to the ThoughtSpot app on your management platform, refer to the following platform-specific information:

  - [Workspace ONE (AirWatch)](https://docs.vmware.com/en/VMware-Workspace-ONE-UEM/1811/VMware-Workspace-ONE-UEM-Mobile-Application-Management/GUID-AWT-CONFIG-PUBLIC-APPS-WS1.html){:target="_blank"}
  - [MobileIron](http://mi.extendedhelp.mobileiron.com/53/all/en/desktop/App_Catalog.htm){:target="_blank"} (Scroll to “Adding an app from a public store”)
  - [XenMobile](https://docs.citrix.com/en-us/xenmobile/xenmobile-service/apps.html#add-a-public-app-store-app){:target="_blank"}
  - [Intune](https://docs.microsoft.com/en-us/intune/store-apps-ios){:target="_blank"}
  - [Cisco Meraki](https://documentation.meraki.com/SM/Apps_and_Software/Deploying_Store_Apps_for_iOS%2F%2FmacOS_and_Android){:target="_blank"}

#### Option 2: Provide a custom .ipa file of the ThoughtSpot app.

  You can upload a custom .ipa file of the ThoughtSpot app to your management platform.

##### Before you begin
  - Your company must have an Apple developer enterprise account.
  - Contact ThoughtSpot at [mobile@thoughtspot.com](mailto:mobile@thoughtspot.com?subject=ThoughtSpot%20Mobile%20App%20.IPA%20Request) to get the ThoughtSpot .ipa file.

To upload the ThoughtSpot .ipa file to your management platform, refer to the following platform-specific information:
  - [Workspace ONE (AirWatch)](https://docs.vmware.com/en/VMware-Workspace-ONE-UEM/1811/VMware-Workspace-ONE-UEM-Mobile-Application-Management/GUID-AWT-CONFIG-INTERNAL-APPS-LOCAL.html#GUID-AWT-CONFIG-INTERNAL-APPS-LOCAL){:target="_blank"}
  - [MobileIron](http://mi.extendedhelp.mobileiron.com/53/all/en/desktop/App_Catalog.htm){:target="_blank"} (Scroll to “Adding an In-house app”)
  - [XenMobile](https://docs.citrix.com/en-us/citrix-endpoint-management/apps.html#add-an-enterprise-app){:target="_blank"}
  - [Intune](https://docs.microsoft.com/en-us/intune/lob-apps-ios){:target="_blank"}
  - [Cisco Meraki](https://documentation.meraki.com/SM/Apps_and_Software/Installing_Custom_Apps_on_iOS_and_Android_Devices){:target="_blank"}

#### AppConfig support

The ThoughtSpot mobile app conforms to the industry standard AppConfig community and version 1.1 of the app supports the following keys. You can add these keys while deploying through your MDM platform.

  |Key |Format     |Description                   |
  |-----------------|------------|-----------------------------------|
  |ServerUrls   |https://thoughtspot.example.com, <br>https://thoughtspot.finance-example.com| Displays a list of servers for users to choose from <br>during sign-in. Separate the servers with commas.|
  |HomePinboardHelpText |Please drop an email to admin@example.com <br>if you are facing difficulties in setting up your <br>home pinboard.| The home pinboard setup help text can be <br>customized using this key.|

## Try the mobile app

If you want to try the mobile app before you deploy it to ThoughtSpot users in your company, do the following:
1. Install and set up the app, following the steps in [Install and set up the mobile app]({{ site.baseurl }}/admin/mobile/install-mobile.html#).
2. Use the following credentials to connect to ThoughtSpot's testing environment and try out the app:  
   **Server URL**: https://try.thoughtspot.com  
   **User ID**: mobile_beta@thoughtspot.com  
   **Password**: mobile

Have questions? Feel free to contact us at [mobile@thoughtspot.com](mailto:mobile@thoughtspot.com?subject=ThoughtSpot%20Mobile%20App%20Question)   
